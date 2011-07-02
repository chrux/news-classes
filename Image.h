//
//  Image.h
//  lp
//
//  Created by Christian Torres on 6/12/11.
//  Copyright 2011 clov3r.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLObject.h"

@class XMLElement;

@interface Image : NSObject <URLObjectDelegate> {
@private
    NSString *url;
    NSString *text;
    UIImage *image;
    
}

@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, copy) UIImage *image;

- (id) initWithLink:(XMLElement *)link;

- (id) initWithLinkStr:(NSString *)link;

- (UIImage *)getImage;

- (void)processDownloadedObject:(NSData *)data;

@end
