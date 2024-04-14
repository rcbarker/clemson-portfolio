/* Team GA-5
 * File name: bluetooth.c
 * 
 * Content Description: Contains code for bluetooth interfacing in the
 * overall system.
 * 
 */

/* Import project header file. */
#include "guitarTuner.h"

/* Bluetooth addresses for devices - DO NOT MODIFY. */
char Pi_Address[] = "00:19:86:00:0F:5F";     // Bluetooth address of
                                             // Raspberry Pi.
char Phone_Address[] = "4C:A5:6D:C3:5F:EF";  // Bluetooth address of 
                                             // Ryan's Phone.

/* Sockets for bluetooth connection. */
int Bluetooth_Socket = -1;  // Socket to USB Bluetooth Adapter 
                            // connection.
int Client_Socket = -1;     // Socket to Client (Android Application)
                            // connection.
int Server_Socket = -1;     // Socket to remote Bluetooth server
                            // (Android Application).

/* Function Name: startBluetoothServer
 * Input:         None.
 * Return Value:  None.
 * Precondition:  None.
 * Purpose:       Creates a Bluetooth socket, binds it to the USB
 *                bluetooth adapter on the Raspberry Pi, and starts
 *                a Bluetooth server on the adapter in listening mode.
 */
void startBluetoothServer(void)
{
	/* Variables. */
	struct sockaddr_rc loc_addr = { 0 };

    /* Get socket for bluetooth connection. */
    Bluetooth_Socket = socket(AF_BLUETOOTH, SOCK_STREAM, 
                              BTPROTO_RFCOMM);

    /* Bind socket to port 1 of the USB bluetooth adapter. */
    loc_addr.rc_family = AF_BLUETOOTH;
    loc_addr.rc_bdaddr = *BDADDR_ANY;
    loc_addr.rc_channel = (uint8_t) 1;
    bind(Bluetooth_Socket, (struct sockaddr *)&loc_addr, 
         sizeof(loc_addr));

    /* Start a Bluetooth Server in listening mode. */
    listen(Bluetooth_Socket, 1);
    
    /* Tell user server has started. */
    printf("Bluetooth server with socket ID %d ", Bluetooth_Socket); 
    printf("has been opened in listening mode.\n");
}

/* Function Name: startBluetoothClient
 * Input:         None.
 * Return Value:  None.
 * Precondition:  None.
 * Purpose:       Creates a Bluetooth socket and remote connects to
 *                Android application server.
 */
void startBluetoothClient(void)
{
	/* Allocate a Bluetooth Socket. */
    struct sockaddr_rc addr = { 0 };
    Bluetooth_Socket = socket(AF_BLUETOOTH, SOCK_STREAM, 
                              BTPROTO_RFCOMM);

    /* Set connection parameters. */
    addr.rc_family = AF_BLUETOOTH;
    addr.rc_channel = (uint8_t) 1;
    str2ba(Phone_Address, &addr.rc_bdaddr);

    /* Connect to Bluetooth server. */
    Server_Socket = connect(Bluetooth_Socket, (struct sockaddr *)&addr, 
                            sizeof(addr));
    if(Server_Socket < 0) {
		printf("Error establishing Bluetooth connection. Please ");
		printf("restart code.\n");
		exit(1);
	} else {
		printf("Successfully opened a bluetooth socket to device ");
		printf("with MAC address %s\n", Phone_Address);
	}
}

/* Function Name: receiveBluetoothServer
 * Input:         None.
 * Return Value:  tuning_num - The index for the tuning the user 
 *                wishes to tune to.
 * Precondition:  None.
 * Purpose:       Blocks until a Bluetooth signal with the tuning mode
 *                number is recieved. Returns the tuning number.
 * 
 *                Server side code. 
 * 
 *                Tuning modes:
 *                0 - Standard tuning
 *                1 - Drop D tuning
 *                2 - Open G tuning
 */
int receiveBluetoothServer(void)
{
	/* Variable Declarations */
    struct sockaddr_rc rem_addr = { 0 };
    char buffer[BUFF_SIZE] = { 0 };
	int bytes_read = 0, tune_num = 0;
	socklen_t opt = sizeof(rem_addr);

    /* Block until a connection is recieved from a client. */
    printf("Bluetooth server is about to block to wait for ");
    printf("a remote connection...\n");
    Client_Socket = accept(Bluetooth_Socket, 
                           (struct sockaddr *)&rem_addr, &opt);

    /* Print recieved connection. */
    ba2str( &rem_addr.rc_bdaddr, buffer);
    fprintf(stderr, "Accepted connection from %s.\n", buffer);

    /* Clear read buffer. */
    memset(buffer, 0, sizeof(buffer));

    /* Read data from client. */
    bytes_read = read(Client_Socket, buffer, sizeof(buffer));
    if(!bytes_read) printf("Error - No data recieved.\n");
    
	/* Return the tuning number read. */
	tune_num = atoi(buffer);
	printf("tuning number read = %d\n", tune_num);
	
	return tune_num; 
}


/* Function Name: receiveBluetoothClient
 * Input:         None.
 * Return Value:  tuning_num - The index for the tuning the user 
 *                wishes to tune to.
 * Precondition:  None.
 * Purpose:       Blocks until a Bluetooth signal with the tuning mode
 *                number is recieved. Returns the tuning number.
 * 
 *                Client side code. 
 * 
 *                Tuning modes:
 *                0 - Standard tuning
 *                1 - Drop D tuning
 *                2 - Open G tuning
 */
int receiveBluetoothClient(void)
{
	/* Variable Declarations */
    char buffer[BUFF_SIZE] = { 0 };
	int bytes_read = 0, tune_num = -1;

    /* Clear read buffer. */
    memset(buffer, 0, sizeof(buffer));

    /* Read data from client. */
    bytes_read = read(Server_Socket, buffer, sizeof(buffer));
    if(!bytes_read) printf("Error - No data recieved.\n");
    
	/* Return the tuning number read. */
	tune_num = atoi(buffer);
	printf("tuning number read = %d\n", tune_num);
	
	return tune_num; 
}


/* Function Name: transmitBluetoothServer
 * Input:         stringNum - Number ID of tuned string.
 *                frequency - Frequency of tuned string.          
 * Return Value:  None.
 * Precondition:  None.
 * Purpose:       Transmits frequency of the tuned string to user's
 *                Android application.
 * 
 *                Server side code.
 * 
 */
void transmitBluetoothServer(int stringNum, float frequency) 
{
    /* Variables. */
    char *buffer = malloc(BUFF_SIZE*sizeof(char));
    int status;

    /* Create string to send frequency. */
    sprintf(buffer, "%1.2f\n", frequency);

    /* Send frequency. */
    printf("Sending frequency of %1.2f Hz for ", frequency);
    printf("string %d to Android App...\n", stringNum);
    status = write(Client_Socket, buffer, sizeof(buffer));
    
    /* Error check. */
    if(status < 0) 
        printf("Error sending frequency for string %d\n", stringNum);

    /* Free buffer. */
    free(buffer);
}

/* Function Name: transmitBluetoothClient
 * Input:         stringNum - Number ID of tuned string.
 *                frequency - Frequency of tuned string.          
 * Return Value:  None.
 * Precondition:  None.
 * Purpose:       Transmits frequency of the tuned string to user's
 *                Android application.
 * 
 *                Server side code.
 * 
 */
void transmitBluetoothClient(int stringNum, float frequency) 
{
    /* Variables. */
    char *buffer = malloc(BUFF_SIZE*sizeof(char));
    int status;

    /* Create string to send frequency. */
    sprintf(buffer, "%1.2f\n", frequency);

    /* Send frequency. */
    printf("Sending frequency of %1.2f Hz for ", frequency);
    printf("string %d to Android App...\n", stringNum);
    status = write(Server_Socket, buffer, sizeof(buffer));
    
    /* Error check. */
    if(status < 0) 
        printf("Error sending frequency for string %d\n", stringNum);

    /* Free buffer. */
    free(buffer);
}


/* Function Name: closeBluetoothClient
 * Input:         None.
 * Return Value:  None.
 * Precondition:  None.
 * Purpose:       Closes the current client connection.
 */
void closeBluetoothClient(void)
{
	/* Tear down client connection. */
	close(Client_Socket);
	printf("Disconnected from client.\n");
}

/* Function Name: closeBluetoothServer
 * Input:         None.
 * Return Value:  None.
 * Precondition:  None.
 * Purpose:       Closes the Bluetooth server.
 */
void closeBluetoothServer(void)
{
	/* Tear down server. */
    close(Bluetooth_Socket);
    printf("Bluetooth Server closed.\n");
}

/* Function Name: disconnectServer
 * Input:         None.
 * Return Value:  None.
 * Precondition:  None.
 * Purpose:       Closes the Bluetooth server connection.
 */
void disconnectServer(void)
{
	/* Tear down server. */
    close(Server_Socket);
    printf("Connection to Bluetooth server closed.\n");
}

