//
//  Paragraph.h
//  lp
//
//  Created by Christian Torres on 6/25/11.
//  Copyright 2011 clov3r.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TAD.h"

@interface Paragraph : NSObject {
    ParagraphType pType;
    NSString *text;
}

@property (nonatomic,assign) ParagraphType pType;
@property (nonatomic,retain) NSString *text;

@end
