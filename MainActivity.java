package app.android.bateria;

import android.app.*;
import android.os.*;
import android.content.*;



import android.os.Bundle; 
import android.widget.TextView;
import android.app.Activity; 
import java.text.SimpleDateFormat; 
import java.util.Calendar;  


public class MainActivity extends Activity { 
	IntentFilter intentFilter;
	TextView timewiew ;
	TextView timewiew2 ;
	TextView timewiew3 ;
	TextView timewiew4 ;
	TextView timewiew5 ;
	TextView timewiew6 ;
	@Override 
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState); setContentView(R.layout.main); 
		timewiew = (TextView) findViewById(R.id.txt1);
		
		timerHandler.postDelayed(timerRunnable, 10);

	}
    Handler timerHandler = new Handler();
    Runnable timerRunnable = new Runnable() {


        public void run() {
			;
			setTimeView() ;
			timerHandler.postDelayed(this, 1000);
		}
	};
	private void setTimeView() {
	intentFilter=new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
		Intent batteryStatus = registerReceiver(null, intentFilter);
		int status = batteryStatus.getIntExtra(BatteryManager.EXTRA_STATUS, -1);

		int level = batteryStatus.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
		int scale = batteryStatus.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
		int chargePlug = batteryStatus.getIntExtra(BatteryManager.EXTRA_PLUGGED, -1);
		
		boolean usbCharge = chargePlug == BatteryManager.BATTERY_PLUGGED_USB;
		boolean acCharge = chargePlug == BatteryManager.BATTERY_PLUGGED_AC;
		
		String s=Double.toString((double)level)+" %";
		
		if(acCharge)s=s+" AC";
		
		if(usbCharge)s=s+" usb";
		
		timewiew.setText (s);
		
		
	} 
}

