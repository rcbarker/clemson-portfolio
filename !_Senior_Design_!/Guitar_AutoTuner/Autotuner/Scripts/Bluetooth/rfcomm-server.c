/* Example C Bluetooth RFCOMM Server from the Internet. */
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
    struct sockaddr_rc loc_addr = { 0 }, rem_addr = { 0 };
    char buf[1024] = { 0 };
    int s, client, bytes_read;
    socklen_t opt = sizeof(rem_addr);

    // allocate socket
    s = socket(AF_BLUETOOTH, SOCK_STREAM, BTPROTO_RFCOMM);

    // bind socket to port 1 of the first available 
    // local bluetooth adapter
    loc_addr.rc_family = AF_BLUETOOTH;
    loc_addr.rc_bdaddr = *BDADDR_ANY;
    loc_addr.rc_channel = (uint8_t) 1;
    bind(s, (struct sockaddr *)&loc_addr, sizeof(loc_addr));

    // put socket into listening mode
    listen(s, 1);

    // accept one connection
 //   client = accept(s, (struct sockaddr *)&rem_addr, &opt);

  //  ba2str( &rem_addr.rc_bdaddr, buf );
  //  fprintf(stderr, "accepted connection from %s\n", buf);
  //  memset(buf, 0, sizeof(buf));

    // read data from the client
  //  bytes_read = read(client, buf, sizeof(buf));
  //  if( bytes_read > 0 ) {
  //      printf("received [%s]\n", buf);
  //  }

    // close connection
  //  close(client);
  //  close(s);
  //  return 0;
}
