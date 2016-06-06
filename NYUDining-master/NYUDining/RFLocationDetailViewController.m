//
//  LocationDetailViewController.m
//  NYUDining
//
//  Created by Ross Freeman on 9/24/15.
//  Copyright © 2015 Ross Freeman. All rights reserved.
//

#import "RFLocationDetailViewController.h"
#import "RFHoursTableViewController.h"

@interface RFLocationDetailViewController ()

@end

@implementation RFLocationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _location.name;
    
    _hoursLabel.lineBreakMode = NSLineBreakByClipping;
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)getHoursString {
    
    NSMutableString *hoursString = [[NSMutableString alloc] init];
    NSString *todaysHours;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dayOfWeek = [dateFormatter stringFromDate:[NSDate date]];
    
    if([dayOfWeek isEqualToString:@"Sunday"]) {
        todaysHours = _location.hours[0];
    }
    else if([dayOfWeek isEqualToString:@"Monday"]) {
        todaysHours = _location.hours[1];
    }
    else if([dayOfWeek isEqualToString:@"Tuesday"]) {
        todaysHours = _location.hours[2];
    }
    else if([dayOfWeek isEqualToString:@"Wednesday"]) {
        todaysHours = _location.hours[3];
    }
    else if([dayOfWeek isEqualToString:@"Thursday"]) {
        todaysHours = _location.hours[4];
    }
    else if([dayOfWeek isEqualToString:@"Friday"]) {
        todaysHours = _location.hours[5];
    }
    else
        todaysHours = _location.hours[6];
    
    hoursString = [[todaysHours stringByReplacingOccurrencesOfString:@"," withString:@"\n"] mutableCopy];
    
    
    return hoursString;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showMenu"]) {
        RFMenuBrowserViewController *dest = (RFMenuBrowserViewController *)[segue destinationViewController];
        dest.location = _location;
    }
    
    else {
        RFHoursTableViewController *dest = (RFHoursTableViewController *)[segue destinationViewController];
        dest.diningLocation = _location;
    }
}

@end
