//
//  LocationDetailViewController.m
//  NYUDining
//
//  Created by Ross Freeman on 9/24/15.
//  Copyright © 2015 Ross Freeman. All rights reserved.
//

#import "RFLocationDetailViewController.h"
#import "RFHoursTableViewController.h"
#import "ViewPersonViewController.h"

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
// add a no one has checked in :( for when there is no one checked in
//pop up for click here to be the first to check in

#pragma mark - Navigation

- (IBAction)CheckIn:(id)sender {
    
    
}

-(NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == _peopleTableView){
        return [self.people count];
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    
    if(tableView == _peopleTableView) {
        
        NSString *fc = [self.people objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@"];
    }
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ViewFriendSegue"]){
        UITableViewCell *cell = (UITableViewCell *)sender;
        UITableView *tableView = self.peopleTableView;
        
        if(self.peopleTableView) {
            
            NSIndexPath *ip = [tableView indexPathForCell:cell];
            
            NSString *f1 = [self.people objectAtIndex:ip.row];
            
            ViewPersonViewController *vf = (ViewPersonViewController *)segue.destinationViewController;
            
            vf.info = f1;
        }
    }
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
