//
//  hhlViewController.h
//  tejiamao
//
//  Created by christieheli on 5/23/14.
//  Copyright (c) 2014 christieheli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGPSegmentedController.h"
#import "detailTaoBaoViewController.h"
#import "ASIHTTPRequest.h"
#import "TableViewGoodsCell.h"
#import "TBXML.h"
#import "MBProgressHUD.h"

@interface hhlViewController : UITableViewController <YGPSegmentedControllerDelegate, UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray *listData;
@property (strong, nonatomic) NSMutableArray *xmlNotes;

//开始请求Web Service
-(void)startRequest:(NSString*)strUrl;

@end