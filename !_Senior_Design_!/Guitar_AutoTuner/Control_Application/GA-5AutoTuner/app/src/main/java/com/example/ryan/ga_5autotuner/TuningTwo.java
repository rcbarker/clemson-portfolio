package com.example.ryan.ga_5autotuner;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothServerSocket;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class TuningTwo extends AppCompatActivity {
    private Handler mHandler1 = new Handler();
    private Handler mHandler2 = new Handler();
    private Handler mHandler3 = new Handler();
    private Handler mHandler4 = new Handler();
    private Handler mHandler5 = new Handler();
    private Handler mHandler6 = new Handler();

    public static final int SUCCESS_CONNECT = 0;

    private static final String TAG = "BluetoothServer";
    private static final boolean DEBUG = true;

    private static final UUID MY_UUID = UUID.fromString("000011008-0000-1000-8000-00805F9B34FB");
    private static final int REQUEST_ENABLE_BT = 3;
    private static final int LISTENING = 4;

    private BluetoothAdapter mBTAdapter;
    private AcceptThread mAcceptThread;
    private EditText view;

    /** Thread Handler. */
    private final Handler mHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            switch(msg.what) {
                case LISTENING:
                    Toast.makeText(getApplicationContext(), "Listening for remote connections...",
                            Toast.LENGTH_SHORT).show();
                    break;
                case SUCCESS_CONNECT:
                    /** Connected. */
                    Toast.makeText(getApplicationContext(),
                            "Connected to remote Bluetooth Device", Toast.LENGTH_SHORT).show();

                    ConnectedThread mConnectedThread =
                            new ConnectedThread(mHandler, (BluetoothSocket) msg.obj);
                    mConnectedThread.start();
                    break;
            }
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tuning_two);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        /** Get Bluetooth adapter. */
        mBTAdapter = BluetoothAdapter.getDefaultAdapter();
        if (mBTAdapter == null) {
            /** Device does not support Bluetooth. */
            Toast.makeText(this, "Bluetooth is not supported on this device",
                    Toast.LENGTH_SHORT).show();
            finish();
        }
    }

    @Override
    protected void onStart() {
        super.onStart();

        if (!mBTAdapter.isEnabled()) {
            Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivityForResult(enableBtIntent, REQUEST_ENABLE_BT);
        }
    }

    @Override
    protected void onPause() {
        mAcceptThread.cancel();

        super.onPause();
    }


    @Override
    protected void onResume() {
        super.onResume();

        Toast.makeText(this, "Starting Bluetooth Server...",
                Toast.LENGTH_SHORT).show();

        mAcceptThread = new AcceptThread();
        mAcceptThread.start();
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
        if (resultCode == RESULT_CANCELED) {
            Toast.makeText(this, "Bluetooth must be enabled to continue",
                    Toast.LENGTH_SHORT).show();
            finish();
        }
    }

    /** Class for accepting connections as a server. */
    private class AcceptThread extends Thread {
        private final BluetoothServerSocket mmServerSocket;

        public AcceptThread() {
            BluetoothServerSocket tmp = null;
            try {
                tmp = mBTAdapter.listenUsingRfcommWithServiceRecord("BluetoothServer", MY_UUID);
            }
            catch (IOException e) { }
            mmServerSocket = tmp;
        }

        @Override
        public void run()
        {
            BluetoothSocket socket = null;
            while (true) {
                try {
                    mHandler.obtainMessage(LISTENING, mmServerSocket).sendToTarget();
                    socket = mmServerSocket.accept();
                }
                catch (IOException e) {
                    break;
                }

                if (socket != null) {
                    manageConnectedSocket(socket);
                    try {
                        mmServerSocket.close();
                    } catch (IOException e) {
                    }
                    break;
                }
            }
        }

        public void cancel() {
            try {
                mmServerSocket.close();
            }
            catch (IOException e) { }
        }
    }

    /** Server connection handler. */
    public void manageConnectedSocket(BluetoothSocket socket) {
        mHandler.obtainMessage(SUCCESS_CONNECT, socket).sendToTarget();
        if (DEBUG) Log.d(TAG, "Connected");
        ConnectedThread server = new ConnectedThread(mHandler, socket);
        server.start();
    }

    /** Client connection handler. */
    private class ConnectedThread extends Thread {
        private final BluetoothSocket mmSocket;
        private final InputStream mmInStream;
        private final OutputStream mmOutStream;

        public ConnectedThread(Handler mHandler, BluetoothSocket socket) {
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
     * Method Name: demoDisplay
     * Input Argument: None.
     * Return Value: None.
     * Purpose: Demonstrates intended user interface.
     */
    private void demoDisplay() {
        /* Get text views. */
        TextView string6 = (TextView) findViewById(R.id.string6);
        TextView string5 = (TextView) findViewById(R.id.string5);
        TextView string4 = (TextView) findViewById(R.id.string4);
        TextView string3 = (TextView) findViewById(R.id.string3);
        TextView string2 = (TextView) findViewById(R.id.string2);
        TextView string1 = (TextView) findViewById(R.id.string1);
        TextView tune    = (TextView) findViewById(R.id.tune);

        /** Inform user of demo. */
        Toast.makeText(this, "UI Demonstration. Screen will update every 2 seconds.",
                Toast.LENGTH_SHORT).show();

        /** Start tuning demo. */
        string6.setText("Strum...");

        /** For making the thread happy. */
        final TextView finalString6 = string6;
        final TextView finalString5 = string5;
        final TextView finalString4 = string4;
        final TextView finalString3 = string3;
        final TextView finalString2 = string2;
        final TextView finalString1 = string1;
        final TextView finalTune = tune;

        mHandler1.postDelayed(new Runnable() {
            public void run() {
                finalString6.setText("71.42");
                finalString5.setText("Strum...");
            }
        }, 4000);

        mHandler2.postDelayed(new Runnable() {
            public void run() {
                finalString5.setText("110.00");
                finalString4.setText("Strum...");
            }
        }, 6000);

        mHandler3.postDelayed(new Runnable() {
            public void run() {
                finalString4.setText("146.83");
                finalString3.setText("Strum...");
            }
        }, 8000);

        mHandler4.postDelayed(new Runnable() {
            public void run() {
                finalString3.setText("196.00");
                finalString2.setText("Strum...");
            }
        }, 10000);

        mHandler5.postDelayed(new Runnable() {
            public void run() {
                finalString2.setText("246.94");
                finalString1.setText("Strum...");

            }
        }, 12000);

        mHandler6.postDelayed(new Runnable() {
            public void run() {
                finalString1.setText("329.63");
                finalTune.setText("In Tune");

                /** Tell user we are done. */
                Toast.makeText(getApplicationContext(), "Demonstration complete",
                        Toast.LENGTH_SHORT).show();
            }
        }, 14000);
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