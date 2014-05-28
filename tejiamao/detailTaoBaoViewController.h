//
//  detailTaoBaoViewController.h
//  tejiamao
//
//  Created by christieheli on 5/24/14.
//  Copyright (c) 2014 christieheli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailTaoBaoViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) NSString *url;

@end
