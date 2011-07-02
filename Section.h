//
//  Section.h
//  lp
//
//  Created by Christian Torres on 6/12/11.
//  Copyright 2011 clov3r.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMLElement;

@interface Section : NSObject {
@private
    NSString *xmlUrl;
    NSString *title;
    NSMutableArray *articles;
}

@property (nonatomic, retain) NSString *xmlUrl;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSMutableArray *articles;

- (id)initWithOutline:(XMLElement *)outline;

@end
