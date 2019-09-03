@interface SBUICallToActionLabel : UIView //Inherits from UIView, so any UIView method will work
- (void)setText:(NSString *)arg1 ;
@end

%hook SBUICallToActionLabel //Hook the class
	
- (void)fadeIn { // This is called when the screen is woken and label fades in

	%orig;

	UIDevice *device = [UIDevice currentDevice]; // Get current device

	[device setBatteryMonitoringEnabled:YES]; // Set this to true to grab battery percentage

	double percentage = (float)[device batteryLevel] * 100; // Multiply by 100 to get a readable float

	NSString *charging; // Create empty string in memory

	UIDeviceBatteryState deviceBatteryState = [UIDevice currentDevice].batteryState; // Get the current state of the battery
	
	if (deviceBatteryState == UIDeviceBatteryStateCharging || deviceBatteryState == UIDeviceBatteryStateFull) {
    
		charging = @"Charging: "; // First part

	} else {

		charging = @"Not charging: "; // First part

	}

	NSString *final = [NSString stringWithFormat:@"%@%.f%%", charging, percentage]; // Final part

	[self setText:final]; // Set the text

}

%end
