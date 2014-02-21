//
//  ViewController.h
//  Countdown
//
//  Created by Nick on 2/21/14.
//  Copyright (c) 2014 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;

- (IBAction)startCountdown:(id)sender;
@end
