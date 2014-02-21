//
//  ViewController.m
//  Countdown
//
//  Created by Nick on 2/21/14.
//  Copyright (c) 2014 Nick. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startCountdown:(id)sender {
    //Remove the time component from the datePicker.  We care only about the date
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSUInteger preservedComponents = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit);
    self.datePicker.date = [calendar dateFromComponents:[calendar components:preservedComponents fromDate:self.datePicker.date]];

    //Set up a timer that calls the updateTime method every second to update the label
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateTime)
                                           userInfo:nil
                                            repeats:YES];
}

-(void)updateTime
{
    //Get the time left until the specified date
    NSInteger ti = ((NSInteger)[self.datePicker.date timeIntervalSinceNow]);
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600) % 24;
    NSInteger days = (ti / 86400);
    
    //Update the lable with the remaining time
    self.countdownLabel.text = [NSString stringWithFormat:@"%02i days %02i hrs %02i min %02i sec", days, hours, minutes, seconds];
}

@end
