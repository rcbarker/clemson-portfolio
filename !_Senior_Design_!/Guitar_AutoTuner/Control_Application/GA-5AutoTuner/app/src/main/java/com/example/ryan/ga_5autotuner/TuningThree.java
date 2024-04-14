package com.example.ryan.ga_5autotuner;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

public class TuningThree extends AppCompatActivity {
    private Handler mHandler1 = new Handler();
    private Handler mHandler2 = new Handler();
    private Handler mHandler3 = new Handler();
    private Handler mHandler4 = new Handler();
    private Handler mHandler5 = new Handler();
    private Handler mHandler6 = new Handler();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tuning_three);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        /** UI demonstration. */
        demoDisplay();
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
                finalString5.setText("98.00");
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
                finalString1.setText("293.67");
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
