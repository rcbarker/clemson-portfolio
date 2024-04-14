package com.example.ryan.ga_5autotuner;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Toast;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Set;
import java.util.UUID;

public class TuningOne extends AppCompatActivity {
    /** EDIT UUID FOR CONNECTION HERE. */
    public static final UUID MY_UUID = UUID.fromString("33a5a4e5-ab28-4f07-bb07-2d0c29a2e9ad");
            //"00001101-0000-1000-8000-00805F9B34FB");

    /** Other constants. */
    private static final int SUCCESS_CONNECT = 0;
    private static final int MESSAGE_READ = 1;

    /** Connect to Bluetooth adapter. */
    BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
    BluetoothDevice  mDevice = null;
    Set<BluetoothDevice> pairedDevices;

    /** Thread Handler. */
    private final Handler mHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            switch(msg.what) {
                case SUCCESS_CONNECT:
                    /** Connected. */
                    Toast.makeText(getApplicationContext(),
                            "Connected to remote Bluetooth Device", Toast.LENGTH_SHORT).show();

                    ConnectedThread mConnectedThread =
                            new ConnectedThread((BluetoothSocket) msg.obj);
                    mConnectedThread.start();
                    break;
            }
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tuning_one);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        Toast.makeText(this, "Checking Bluetooth compatibility...",
                Toast.LENGTH_SHORT).show();

        if (mBluetoothAdapter == null) {
            /** Device does not support Bluetooth. */
            Toast.makeText(this, "Bluetooth is not supported on this device",
                    Toast.LENGTH_SHORT).show();
            finish();
        } else {
            /** Check if Bluetooth is enabled and turn it on if not. */
            if (!mBluetoothAdapter.isEnabled()) {
                Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
                startActivityForResult(enableBtIntent, 1);
            }

            Toast.makeText(this, "Retrieving paired devices...",
                    Toast.LENGTH_SHORT).show();

            /** Grab all paired devices. */
            mDevice = getPairedDevices();

            /** Check return. */
            if (mDevice == null) {
                /** No device found. */
                Toast.makeText(this, "No paired devices found - Must pair device with tuner",
                        Toast.LENGTH_SHORT).show();
                finish();
            } else {
                /** Connect to the returned device. */
                Toast.makeText(this, "Attempting remote connection to first paired device...",
                        Toast.LENGTH_SHORT).show();
                ConnectThread mConnectThread = new ConnectThread(mDevice);
                mConnectThread.start();
            }
        }
    }

    /** Loops through list of paired devices and returns address of
     *  last device for bluetooth connection.
     */
    private BluetoothDevice getPairedDevices() {
        /** Grab all paired devices. */
        pairedDevices = mBluetoothAdapter.getBondedDevices();

        /** Loop through all paired devices. */
        BluetoothDevice mDevice = null;
        if (pairedDevices.size() > 0) {
            for (BluetoothDevice device : pairedDevices) {
                /** Grab last paired device for connection. */
                mDevice = device;
            }
        }

        /** Give last device to user. */
        return mDevice;
    }

    /** Method that checks if the user cancels enabling Bluetooth if it is disabled.
        In such a case, the method informs the user Bluetooth is required and then finishes
        the current activity.
     */
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        /** Run normal onActivityResult. */
        super.onActivityResult(requestCode, resultCode, data);

        /** Check for user cancellation. */
        if(resultCode == RESULT_CANCELED) {
            Toast.makeText(TuningOne.this, "Bluetooth must be enabled to continue",
                    Toast.LENGTH_SHORT).show();
            finish();
        }
    }

    private class ConnectThread extends Thread {
        private final BluetoothSocket mmSocket;
        private final BluetoothDevice mmDevice;

        public ConnectThread(BluetoothDevice device) {
            // Use a temporary object that is later assigned to mmSocket,
            // because mmSocket is final
            BluetoothSocket tmp = null;
            mmDevice = device;

            // Get a BluetoothSocket to connect with the given BluetoothDevice
            try {
                // MY_UUID is the app's UUID string, also used by the server code
                tmp = device.createRfcommSocketToServiceRecord(MY_UUID);
            } catch (IOException e) { }
            mmSocket = tmp;
        }

        public void run() {
            // Cancel discovery because it will slow down the connection
            mBluetoothAdapter.cancelDiscovery();

            try {
                // Connect the device through the socket. This will block
                // until it succeeds or throws an exception
                mmSocket.connect();
            } catch (IOException connectException) {
                // Unable to connect; close the socket and get out
                try {
                    mmSocket.close();
                } catch (IOException closeException) { }
                return;
            }

            /** Signal handler. */
            mHandler.obtainMessage(SUCCESS_CONNECT, mmSocket).sendToTarget();
        }

        /** Will cancel an in-progress connection, and close the socket */
        public void cancel() {
            try {
                mmSocket.close();
            } catch (IOException e) { }
        }
    }

    private class ConnectedThread extends Thread {
        private final BluetoothSocket mmSocket;
        private final InputStream mmInStream;
        private final OutputStream mmOutStream;

        public ConnectedThread(BluetoothSocket socket) {
            mmSocket = socket;
            InputStream tmpIn = null;
            OutputStream tmpOut = null;

            // Get the input and output streams, using temp objects because
            // member streams are final
            try {
                tmpIn = socket.getInputStream();
                tmpOut = socket.getOutputStream();
            } catch (IOException e) { }

            mmInStream = tmpIn;
            mmOutStream = tmpOut;
        }

        public void run() {
          /**  byte[] buffer = new byte[1024];  // buffer store for the stream
            int bytes; // bytes returned from read()

            // Keep listening to the InputStream until an exception occurs
            while (true) {
                try {
                    // Read from the InputStream
                    bytes = mmInStream.read(buffer);
                    // Send the obtained bytes to the UI activity
                    mHandler.obtainMessage(MESSAGE_READ, bytes, -1, buffer)
                            .sendToTarget();
                } catch (IOException e) {
                    break;
                }
            } */
        }

        /* Call this from the main activity to send data to the remote device */
        public void write(byte[] bytes) {
            try {
                mmOutStream.write(bytes);
            } catch (IOException e) { }
        }

        /* Call this from the main activity to shutdown the connection */
        public void cancel() {
            try {
                mmSocket.close();
            } catch (IOException e) { }
        }
    }

    /**
     * Method Name: home
     * Input Argument: view - Necessary to link to button in application.
     * Return Value: None.
     * Purpose: Takes the user back to the main activity.
     */
    public void home(View view) {
        /* Create intent to go back to main activity. */
        Intent intent = new Intent(this, MainActivity.class);

        /* Set flag to go back to existing activity. */
        intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);

        /* Start intent. */
        startActivity(intent);
    }
}




