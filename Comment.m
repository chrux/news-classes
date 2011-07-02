//
//  Comment.m
//  lp
//
//  Created by Christian Torres on 6/12/11.
//  Copyright 2011 clov3r.net. All rights reserved.
//

#import "Comment.h"


@implementation Comment

@synthesize name;
@synthesize date;
@synthesize text;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
