//
//  userClass.m
//  NYUDining
//
//  Created by Jesus Leal on 6/6/16.
//  Copyright © 2016 Ross Freeman. All rights reserved.
//

#import "userClass.h"

@implementation userClass

@synthesize fbFirstName, fbLastName, likes, fbUniqueID, gcmID, oldAcceptedR ;

-(id)initWithaID:(NSString *)fname fbLastName:(NSString *)lname likes: (NSString *)like fbUniqueID: (NSString *) fbUID gcmID: (NSString *) agcmID oldAcceptedR: (NSArray *) oar{
    self = [super init];
    if(self){
        self.fbFirstName = fname;
        self.fbLastName = lname;
        self.likes = like;
        self.fbUniqueID = fbUID;
        self.gcmID = agcmID;
        self.oldAcceptedR = oar;
    }
    return self;
}

@end
