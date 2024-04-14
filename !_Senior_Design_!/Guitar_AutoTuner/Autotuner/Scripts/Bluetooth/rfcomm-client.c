/* Example C Bluetooth RFCOMM Client from the Internet. */
/* Uses bluez package for bluetooth communication. */

/* Source code pulled from Albert Huang's (very useful) Bluez tutorial:
 * https://people.csail.mit.edu/albert/bluez-intro/
 */

/* To install necessary packages:
 *  
 * sudo apt-get update
 * sudo apt-get install libbluetooth-dev bluez 
 */

/* To determine bluetooth name and bluetooth address of each connected
 * device:
 * 
 * hcitool dev
 */
 
#include <stdio.h>
#include <unistd.h>
#include <sys/socket.h>
#include <bluetooth/bluetooth.h>
#include <bluetooth/rfcomm.h>

int main(int argc, char **argv)
{
    struct sockaddr_rc addr = { 0 };
    int s, status;
    char dest[18] = "01:23:45:67:89:AB";

    // allocate a socket
    s = socket(AF_BLUETOOTH, SOCK_STREAM, BTPROTO_RFCOMM);

    // set the connection parameters (who to connect to)
    addr.rc_family = AF_BLUETOOTH;
    addr.rc_channel = (uint8_t) 1;
    str2ba( dest, &addr.rc_bdaddr );

    // connect to server
    status = connect(s, (struct sockaddr *)&addr, sizeof(addr));

    // send a message
    if( status == 0 ) {
        status = write(s, "hello!", 6);
    }

    if( status < 0 ) perror("uh oh");

    close(s);
    return 0;
}
