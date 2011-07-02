//
//  Section.m
//  lp
//
//  Created by Christian Torres on 6/12/11.
//  Copyright 2011 clov3r.net. All rights reserved.
//

#import "Section.h"
#import "XMLElement.h"


@implementation Section

@synthesize xmlUrl;
@synthesize title;
@synthesize articles;

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

- (id)initWithOutline:(XMLElement *)outline
{
    
    // title
    title = [outline attributeNamed:@"title"];
    // url
    xmlUrl = [outline attributeNamed:@"xmlUrl"];
    
    return self;
    
}

@end
