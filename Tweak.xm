@interface SBUICallToActionLabel : UIView {

	NSString* _text;

}
@property (nonatomic, copy, readwrite) NSString * text; 
- (void)setText:(NSString *)arg1 ;
- (NSString *)text;
@end

%hook SBUICallToActionLabel
	
- (void)fadeIn {

	%orig;

	UIDevice *device = [UIDevice currentDevice];

	[device setBatteryMonitoringEnabled:YES];

	double percentage = (float)[device batteryLevel] * 100;

	NSLog(@"%.f", percentage);

	NSString *charging;

	UIDeviceBatteryState deviceBatteryState = [UIDevice currentDevice].batteryState;
	
	if (deviceBatteryState == UIDeviceBatteryStateCharging || deviceBatteryState == UIDeviceBatteryStateFull) {
    
		charging = @"Charging: ";

	} else {

		charging = @"Not charging: ";

	}

	NSString *final = [NSString stringWithFormat:@"%@%.f%%", charging, percentage];

	[self setText:final];

}

/* - (void)didMoveToSuperview {

	%orig;

	NSString *newText = MSHookIvar<NSString *>(self, "_text");

	newText = @"Test";

	self.text = @"Test2";

	//

	UIDevice *device = [UIDevice currentDevice];

	[device setBatteryMonitoringEnabled:YES];

	double percentage = (float)[device batteryLevel] * 100;

	NSLog(@"%.f", percentage);

	NSString *charging;

	UIDeviceBatteryState deviceBatteryState = [UIDevice currentDevice].batteryState;
	
	if (deviceBatteryState == UIDeviceBatteryStateCharging || deviceBatteryState == UIDeviceBatteryStateFull) {
    
		charging = @"Charging: ";

	} else {

		charging = @"Not charging: ";

	}

	NSString *final = [NSString stringWithFormat:@"%@%.f%%", charging, percentage];

	[self setText:final];

} */
	
/* - (void)sizeToFit {

	%orig;

	NSString *newText = MSHookIvar<NSString *>(self, "_text");

	newText = @"Test";

	self.text = @"Test2";

	//

	UIDevice *device = [UIDevice currentDevice];

	[device setBatteryMonitoringEnabled:YES];

	double percentage = (float)[device batteryLevel] * 100;

	NSLog(@"%.f", percentage);

	NSString *charging;

	UIDeviceBatteryState deviceBatteryState = [UIDevice currentDevice].batteryState;
	
	if (deviceBatteryState == UIDeviceBatteryStateCharging || deviceBatteryState == UIDeviceBatteryStateFull) {
    
		charging = @"Charging: ";

	} else {

		charging = @"Not charging: ";

	}

	NSString *final = [NSString stringWithFormat:@"%@%.f%%", charging, percentage];

	[self setText:final];

} */

%end