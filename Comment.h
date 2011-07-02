//
//  Comment.h
//  lp
//
//  Created by Christian Torres on 6/12/11.
//  Copyright 2011 clov3r.net. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Comment : NSObject {
@private
    NSString *name;     // Person's name who comments
    NSString *text;     // Comment's text
    NSDate *date;       // Date when comment was sent
    
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSDate *date;

@end
