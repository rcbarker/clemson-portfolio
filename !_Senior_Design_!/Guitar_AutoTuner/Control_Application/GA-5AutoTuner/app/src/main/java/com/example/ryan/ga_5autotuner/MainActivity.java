package com.example.ryan.ga_5autotuner;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
    }

    /**************** Methods for Push Buttons ****************/

    /**
     * Method Name: tuneOne
     * Input Argument: view - Necessary to link to button in application.
     * Return Value: None.
     * Purpose: Starts the first tuning for the design.
     */
    public void tuneOne(View view) {
        /* Link to new intent. */
        Intent intent = new Intent(this, TuningOne.class);

        /* Start new intent. */
        startActivity(intent);
    }

    /**
     * Method Name: tuneTwo
     * Input Argument: view - Necessary to link to button in application.
     * Return Value: None.
     * Purpose: Starts the second tuning for the design.
     */
    public void tuneTwo(View view) {
        /* Link to new intent. */
        Intent intent = new Intent(this, TuningTwo.class);

        /* Start new intent. */
        startActivity(intent);
    }

    /**
     * Method Name: tuneThree
     * Input Argument: view - Necessary to link to button in application.
     * Return Value: None.
     * Purpose: Starts the third tuning for the design.
     */
    public void tuneThree(View view) {
        /* Link to new intent. */
        Intent intent = new Intent(this, TuningThree.class);

        /* Start new intent. */
        startActivity(intent);
    }

    /**
     * Method Name: displayTeam
     * Input Argument: view - Necessary to link to button in application.
     * Return Value: None.
     * Purpose: Starts the team member screens (with Ryan's screen).
     */
    public void displayTeam(View view) {
        /* Link to new intent. */
        Intent intent = new Intent(this, Ryan.class);

        /* Start new intent. */
        startActivity(intent);
    }
}