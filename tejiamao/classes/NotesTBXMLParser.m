//
//  NotesTBXMLParser.m
//  simple800
//
//  Created by christieheli on 5/15/14.
//  Copyright (c) 2014 christieheli. All rights reserved.
//

#import "NotesTBXMLParser.h"
#import "ASIHTTPRequest.h"

@implementation NotesTBXMLParser

//开始解析
-(void)start:(NSString*)strUrl
{
    _notes = [NSMutableArray new];
    
//    NSString *strUrl = @"http://ju.tejiamao.com/page/tuiha.xml";
    
    NSURL *url = [NSURL URLWithString:strUrl];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    //    NSLog(@"请求完成");
    NSError *error = [request error];
    
    NSData *data = nil;
    if (!error) {
        data = [request responseData];
    }
    
    
    //    TBXML* tbxml = [[TBXML alloc] initWithXMLFile:@"Notes.xml" error:nil];
    TBXML* tbxml = [[TBXML alloc] initWithXMLData:data error:nil];
    
    TBXMLElement * root = tbxml.rootXMLElement;
    
	// if root element is valid
	if (root) {
        
//		TBXMLElement * noteElement = [TBXML childElementNamed:@"info" parentElement:root];
        TBXMLElement * noteElement = [TBXML childElementNamed:@"item" parentElement:root];
        
        while ( noteElement != nil) {
            
            NSMutableDictionary *dict = [NSMutableDictionary new];
            
            
            TBXMLElement *midElement = [TBXML childElementNamed:@"numiid" parentElement:noteElement];
            if ( midElement != nil) {
                NSString *mid = [TBXML textForElement:midElement];
                NSString *productUrl = @"http://mao.tejiamao.com/app/url.php?id=";
                productUrl = [productUrl stringByAppendingString:mid];
                [dict setValue:mid forKey:@"numiid"];
                [dict setValue:productUrl forKey:@"pUrl"];
            }
            
            /*
            TBXMLElement *urlElement = [TBXML childElementNamed:@"url" parentElement:noteElement];
            if (urlElement != nil) {
                NSString *url = [TBXML textForElement:urlElement];
                NSString *productUrl = @"http://www.tejiabao.com";
                productUrl = [productUrl stringByAppendingString:url];
                [dict setValue:productUrl forKey:@"pUrl"];
            }
             */
            
            TBXMLElement *titleElement = [TBXML childElementNamed:@"title" parentElement:noteElement];
            if ( titleElement != nil) {
                NSString *title = [TBXML textForElement:titleElement];
                NSLog(@"%@", title);
                [dict setValue:title forKey:@"title"];
            }
            
            TBXMLElement *picurlElement = [TBXML childElementNamed:@"picurl" parentElement:noteElement];
            if ( picurlElement != nil) {
                NSString *picurl = [TBXML textForElement:picurlElement];
                [dict setValue:picurl forKey:@"picurl"];
            }
            
            TBXMLElement *priceElement = [TBXML childElementNamed:@"price" parentElement:noteElement];
            if ( priceElement != nil) {
                NSString *price = [TBXML textForElement:priceElement];
                [dict setValue:price forKey:@"price"];
            }
            
            TBXMLElement *xpriceElement = [TBXML childElementNamed:@"xprice" parentElement:noteElement];
            if ( xpriceElement != nil) {
                NSString *xprice = [TBXML textForElement:xpriceElement];
                [dict setValue:xprice forKey:@"xprice"];
            }
            /*
            TBXMLElement *picurlElement = [TBXML childElementNamed:@"img" parentElement:noteElement];
            if ( picurlElement != nil) {
                NSString *picurl = [TBXML textForElement:picurlElement];
                [dict setValue:picurl forKey:@"picurl"];
            }
            
            
            TBXMLElement *priceElement = [TBXML childElementNamed:@"yuanjia" parentElement:noteElement];
            if ( priceElement != nil) {
                NSString *price = [TBXML textForElement:priceElement];
                [dict setValue:price forKey:@"price"];
            }
            
            TBXMLElement *xpriceElement = [TBXML childElementNamed:@"tejia" parentElement:noteElement];
            if ( xpriceElement != nil) {
                NSString *xprice = [TBXML textForElement:xpriceElement];
                [dict setValue:xprice forKey:@"xprice"];
            }
            
            TBXMLElement *zhekouElement = [TBXML childElementNamed:@"zhekou" parentElement:noteElement];
            if ( zhekouElement != nil) {
                NSString *zhekou = [TBXML textForElement:zhekouElement];
                [dict setValue:zhekou forKey:@"zhekou"];
            }
            
            TBXMLElement *xiaoliangElemnt = [TBXML childElementNamed:@"xiaoliang" parentElement:noteElement];
            if (xiaoliangElemnt != nil) {
                NSString *xiaoliang = [TBXML textForElement:xiaoliangElemnt];
                [dict setValue:xiaoliang forKey:@"xiaoliang"];
            }
             */
            
            [_notes addObject:dict];
            
            
//            noteElement = [TBXML nextSiblingNamed:@"info" searchFromElement:noteElement];
            noteElement = [TBXML nextSiblingNamed:@"item" searchFromElement:noteElement];
            
		}
    }
    
    //    NSLog(@"解析完成...");
        NSLog(@"array:%@",_notes);
    
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"reloadViewNotification" object:self.notes userInfo:nil];
    //self.notes = nil;
    
}


@end
