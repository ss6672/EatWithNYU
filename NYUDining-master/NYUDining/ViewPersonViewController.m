//
//  ViewPersonViewController.m
//  NYUDining
//
//  Created by Jesus Leal on 6/6/16.
//  Copyright © 2016 Ross Freeman. All rights reserved.
//

#import "ViewPersonViewController.h"

@interface ViewPersonViewController ()

@end

@implementation ViewPersonViewController
NSString *dataUrl = @"http://eatwith.umxb9zewhm.us-east-1.elasticbeanstalk.com/webapi/users";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)requestStudent:(id)sender {
    NSURL *url = [NSURL URLWithString:dataUrl];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    
    // 3
    NSMutableDictionary *dictionary = [NSMutableDictionary
                                       dictionaryWithDictionary:@{@"fbUserId" : [NSNumber numberWithLong:2],@"fbUserId" : [NSNumber numberWithLong:3]} ];
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (!error) {
        // 4
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
            //do stuff with data here
        }];
        
        // 5
        [uploadTask resume];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your request has been sent" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
