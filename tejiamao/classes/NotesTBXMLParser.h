//
//  NotesTBXMLParser.h
//  simple800
//
//  Created by christieheli on 5/15/14.
//  Copyright (c) 2014 christieheli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"
#import "ASIHTTPRequest.h"

@interface NotesTBXMLParser : NSObject

@property (strong, nonatomic) NSMutableArray *notes;

-(void)start:(NSString*)strUrl;
@end
