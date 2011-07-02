//
//  Article.h
//  lp
//
//  Created by Christian Torres on 6/12/11.
//  Copyright 2011 clov3r.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMLElement;

@interface Article : NSObject {
@private
    NSDate *date;           // Save date and time
    NSString *section;      // Section's name
    NSString *subholder;    // This part comes before title, Spanish "antetitulo"
    NSString *title;        // Article title
    NSString *subtitle;     // This part comes after title
    NSString *intro;        // This part comes before body
    NSString *summary;      // This part is a summary
    NSString *link;
    NSString *urlNITF;      // HTML body
    NSMutableArray *nitf;
    
    NSString *firstImage;
    NSMutableDictionary *images;
    NSMutableArray *comments;
    
}

@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) NSString *section;
@property (nonatomic, retain) NSString *subholder;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) NSString *intro;
@property (nonatomic, retain) NSString *summary;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *urlNITF;
@property (nonatomic, retain) NSMutableArray *nitf;

@property (nonatomic, retain) NSString *firstImage;
@property (nonatomic, retain) NSDictionary *images;
@property (nonatomic, retain) NSArray *comments;

- (id) initWithEntry:(XMLElement *)entry;

- (NSArray *) getImgs:(int)limit;

- (void)loadNITF;

@end
