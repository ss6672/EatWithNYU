//
//  userClass.h
//  NYUDining
//
//  Created by Jesus Leal on 6/6/16.
//  Copyright © 2016 Ross Freeman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userClass : NSObject

@property (strong, nonatomic) NSString *fbFirstName;

@property (strong, nonatomic) NSString *fbLastName;

@property (strong, nonatomic) NSString *likes;

@property (strong, nonatomic) NSString *fbUniqueID;

@property (strong, nonatomic) NSString *gcmID;

@property (strong, nonatomic) NSArray *oldAcceptedReq;

@property (strong, nonatomic) NSArray *pendingReq;



-(id)initWithaID:(NSString *)fname fbLastName:(NSString *)lname likes: (NSString *)like fbUniqueID: (NSString *) fbUID gcmID: (NSString *) agcmID oldAcceptedReq: (NSArray *) oar pendingReq: (NSArray *) per;

@end
