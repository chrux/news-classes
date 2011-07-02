//
//  Article.m
//  lp
//
//  Created by Christian Torres on 6/12/11.
//  Copyright 2011 clov3r.net. All rights reserved.
//

#import "Article.h"
#import "XMLDocument.h"
#import "XMLElement.h"
#import "Image.h"
#import "Paragraph.h"
#import "Pref.h"


@implementation Article

@synthesize date;
@synthesize section;
@synthesize subholder;
@synthesize title;
@synthesize subtitle;
@synthesize intro;
@synthesize summary;
@synthesize urlNITF;
@synthesize link;
@synthesize nitf;

@synthesize firstImage;
@synthesize images;
@synthesize comments;

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
    [date release];
    [section release];
    [subholder release];
    [title release];
    [subtitle release];
    [intro release];
    [summary release];
    [urlNITF release];
    [link release];
    [nitf release];
    
    [images release];
    [comments release];
    [super dealloc];
}

- (id) initWithEntry:(XMLElement *)entry
{
    
    // Pool
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // title
    title = [[NSString alloc] initWithString:[[entry valueWithPath:@"title"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    
    // date
    NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    [df setDateFormat:dateFormat];
    date = [(NSDate *)[df dateFromString:[entry valueWithPath:@"updated"]] retain];

    // links
    for (XMLElement *_link in [entry childrenNamed:@"link"]) {
        if ( [[_link attributeNamed:@"type"] isEqualToString:@"image/jpeg"] ) {
            
            Image *img = [[Image alloc] initWithLink:_link];
            // images
            if ( !images ) {
                images = [[NSMutableDictionary alloc] init];
                firstImage = [[_link attributeNamed:@"href"] lastPathComponent];
            }
            [images setObject:img forKey:[[_link attributeNamed:@"href"] lastPathComponent]];
            
        } else if ( !link ) {
            // link
            link = [_link attributeNamed:@"href"];
        }
    }
    
    // section
    XMLElement *_section = [[entry childrenNamed:@"category"] objectAtIndex:0];
    section = [_section attributeNamed:@"label"];
    
    // summary
    if ( [entry valueWithPath:@"summary"] != nil )
        summary = [[NSString alloc] initWithString:[[entry valueWithPath:@"summary"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    
    XMLElement *content = (XMLElement *)[[entry childrenNamed:@"content"] objectAtIndex:0];
    if ( content.attributes != nil ) {
        urlNITF = [content attributeNamed:@"src"];
    }
    
    [pool drain];
    return self;

}

- (id) getImgs:(int)limit
{
    int index = 0;
    NSMutableArray *arrImg;
    if ( limit < 1) {
        return nil;
    } else {
        arrImg = [[[NSMutableArray alloc] init] autorelease];
    }
    for ( id key in images ) {
        index++;
        if ( limit == 1 ) {
            return [images objectForKey:key];
        } else {
            [arrImg addObject:[images objectForKey:key]];
        }
    }
    
    return [NSArray arrayWithArray:arrImg];
    
}

- (void)loadNITF
{
    if ( urlNITF ) {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        
        XMLDocument *doc = [[[XMLDocument alloc] initWithURLStringSync:urlNITF] autorelease];
        XMLElement *content = [[[[doc.root childrenNamed:@"body"] objectAtIndex:0] childrenNamed:@"body.content"] objectAtIndex:0];
        
        for (XMLElement *element in [content children]) {
            if ( !nitf ) nitf = [[NSMutableArray alloc] init];
            if ( ( [element.name isEqualToString:@"hl2"] || [element.name isEqualToString:@"p"] ) && [element value] ) {
                Paragraph *p = [Paragraph alloc];
                p.text = [[NSString alloc] initWithString:[element value]];
                if ( [element.name isEqualToString:@"hl2"] ) {
                    p.pType = SubHeadline;
                } else {
                    p.pType = ParagraphSimple;
                }
                [nitf addObject:p];
            } else if ( [element.name isEqualToString:@"media"] ) {
                Image *i = [[Image alloc] initWithLinkStr:[[[element childrenNamed:@"media-reference"] objectAtIndex:0] attributeNamed:@"source"]];
                // images
                if ( !images ) {
                    images = [[NSMutableDictionary alloc] init];
                }
                [i setText:[[[element childrenNamed:@"media-caption"] objectAtIndex:0] value]]; 
                [images setObject:i forKey:[[[[element childrenNamed:@"media-reference"] objectAtIndex:0] attributeNamed:@"source"] lastPathComponent]];
                [nitf addObject:i];
            }
        }
        
        [pool drain];
    }
}

@end
