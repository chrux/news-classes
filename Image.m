//
//  Image.m
//  lp
//
//  Created by Christian Torres on 6/12/11.
//  Copyright 2011 clov3r.net. All rights reserved.
//

#import "Image.h"
#import "XMLElement.h"
#import "URLObject.h"

@implementation Image

@synthesize url;
@synthesize text;
@synthesize image;

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
    url = nil;
    text = nil;
    image = nil;
    [super dealloc];
}

- (id)initWithLink:(XMLElement *)link
{
    // Pool
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    url = [link attributeNamed:@"href"];
    text = @"";
    
    [self getImage];
    
    [pool drain];
    return self;
    
}

- (id)initWithLinkStr:(NSString *)link
{
    
    url = [[NSString alloc] initWithString:link];
    text = @"";
    
    [self getImage];
    
    return self;
    
}

- (UIImage *)getImage
{
    if ( image==nil ) {
        URLObject *file = [[[URLObject alloc] initWithString:url andAgent:@""] autorelease];
        [file setDelegate:self];
        [file setSynchronously:YES];
        image = [[UIImage alloc] initWithData:[file load]];
    }
    return image;
}

@end
