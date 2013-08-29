package com.ihwapp.android;

import com.ihwapp.android.model.Curriculum;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.*;
import android.support.v4.app.NavUtils;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.method.ScrollingMovementMethod;

public class PreferencesActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_preferences);
		// Show the Up button in the action bar.
		setupActionBar();
	}
	
	protected void onStart() {
		super.onStart();
		int year = Curriculum.getCurrentYear();
		((EditText)this.findViewById(R.id.text_year)).setText("" + year);
		((TextView)findViewById(R.id.text_hint_year)).setText("-" + ((year+1)%100));
		((TextView)this.findViewById(R.id.text_disclaimer)).setMovementMethod(new ScrollingMovementMethod());
		
		((EditText)this.findViewById(R.id.text_year)).addTextChangedListener(new TextWatcher() {
			public void afterTextChanged(Editable editText) {
				try {
					int year = Integer.parseInt(editText.toString());
					String nextYear = "" + ((year+1)%100);
					while (nextYear.length() < 2) nextYear = "0" + nextYear;
					((TextView)findViewById(R.id.text_hint_year)).setText("-" + nextYear);
				} catch (NumberFormatException e) {
					((TextView)findViewById(R.id.text_hint_year)).setText("");
				}
			}
			public void beforeTextChanged(CharSequence s, int start, int count,
					int after) { }
			public void onTextChanged(CharSequence s, int start, int before,
					int count) { }
		});
		
		((Button)this.findViewById(R.id.button_change_year)).setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				int year = Curriculum.getCurrentYear();
				try {
					year = Integer.parseInt(((EditText)findViewById(R.id.text_year)).getText().toString());
				} catch (NumberFormatException ignored) {}
				Curriculum.setCurrentYear(year);
				Intent i = new Intent(PreferencesActivity.this, ScheduleActivity.class);
				i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
				startActivity(i);
			}
		});
		((Button)this.findViewById(R.id.button_middle)).setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				Curriculum.setCurrentCampus(Constants.CAMPUS_MIDDLE);
				Intent i = new Intent(PreferencesActivity.this, ScheduleActivity.class);
				i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
				startActivity(i);
			}
		});
		((Button)this.findViewById(R.id.button_upper)).setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				Curriculum.setCurrentCampus(Constants.CAMPUS_UPPER);
				Intent i = new Intent(PreferencesActivity.this, ScheduleActivity.class);
				i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
				startActivity(i);
			}
		});
		((Button)this.findViewById(R.id.button_redownload)).setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				Intent i = new Intent(PreferencesActivity.this, DownloadScheduleActivity.class);
				i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
				startActivity(i);
			}
		});
	}

	/**
	 * Set up the {@link android.app.ActionBar}.
	 */
	private void setupActionBar() {

		getActionBar().setDisplayHomeAsUpEnabled(true);

	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.preferences, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case android.R.id.home:
			// This ID represents the Home or Up button. In the case of this
			// activity, the Up button is shown. Use NavUtils to allow users
			// to navigate up one level in the application structure. For
			// more details, see the Navigation pattern on Android Design:
			//
			// http://developer.android.com/design/patterns/navigation.html#up-vs-back
			//
			NavUtils.navigateUpFromSameTask(this);
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

}
