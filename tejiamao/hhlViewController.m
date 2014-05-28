//
//  hhlViewController.m
//  tejiamao
//
//  Created by christieheli on 5/23/14.
//  Copyright (c) 2014 christieheli. All rights reserved.
//

#import "hhlViewController.h"

@interface hhlViewController ()<MBProgressHUDDelegate>
{
    YGPSegmentedController * _ygp;
    MBProgressHUD *HUD;
}
@end

@implementation hhlViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.title = @"特价猫";
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tejiamao_appicon.png"]];

    
    //初始化数据
    NSArray *TitielArray = [NSArray arrayWithObjects:@"全部",
                                                    @"女装",
                                                    @"男装",
                                                    @"饰品",
                                                    @"内衣",
                                                    @"女鞋",
                                                    @"男鞋",
                                                    @"箱包",
                                                    @"运动",
                                                    @"母婴",
                                                    @"数码",
                                                    @"家电",
                                                    @"办公",
                                                    @"美妆",
                                                    @"美食",
                                                    @"养生",
                                                    @"百货",
                                                    @"家居",
                                                    @"车品", nil];

    _ygp = [[YGPSegmentedController alloc]initContentTitle:TitielArray CGRect:CGRectMake(0, 0, 320, 44)];
    
    [_ygp setDelegate:self];
    self.tableView.tableHeaderView = _ygp;
//    [self.view addSubview:_ygp];

    //开始请求
    [self startRequest:@"http://www.tejiamao.com/e/web/?type=xml&classid=1"];
//    [self startRequest:@"http://ju.tejiamao.com/page/tuiha.xml"];

}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


-(void)segmentedViewController:(YGPSegmentedController *)segmentedControl touchedAtIndex:(NSUInteger)index
{
    NSArray *menuUrlArray = [NSArray arrayWithObjects:@"http://www.tejiamao.com/e/web/?type=xml&classid=1",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=2",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=3",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=4",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=5",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=6",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=7",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=8",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=9",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=10",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=11",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=12",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=13",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=14",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=15",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=16",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=17",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=18",
                             @"http://www.tejiamao.com/e/web/?type=xml&classid=19", nil];
    
    /*
    NSArray *menuUrlArray = [NSArray arrayWithObjects:@"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml",
                             @"http://ju.tejiamao.com/page/tuiha.xml", nil];
     */
    //开始解析
    [self startRequest:[menuUrlArray objectAtIndex:index]];
    self.listData = self.xmlNotes;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"juzhekouCell";
    TableViewGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[TableViewGoodsCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    NSInteger row = [indexPath row];
    NSDictionary *dict = [self.listData objectAtIndex:row];
    
    cell.goodTitle.lineBreakMode = NSLineBreakByCharWrapping;
    cell.goodTitle.numberOfLines = 0;
    cell.goodTitle.text = [dict objectForKey:@"title"];
    
    NSURL *imageUrl = [NSURL URLWithString:[dict objectForKey:@"picurl"]];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
    cell.goodImage.image = image;
    
    cell.goodPrice.text = [@"￥" stringByAppendingString:[dict objectForKey:@"price"]];
//    cell.goodPrice.strikeThroughEnabled = YES;
    
    cell.goodZhePrice.text = [dict objectForKey:@"xprice"];
    cell.goodZhekou.text = [[dict objectForKey:@"zhekou"] stringByAppendingString:@"折"];

    cell.accessoryType = UITableViewCellStyleDefault;
    
    return cell;

}


//选择表视图行时候触发
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetail"])
    {
        detailTaoBaoViewController *detailTaoBaoVC = segue.destinationViewController;
        
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        NSDictionary *dict = [self.listData objectAtIndex:selectedIndex];
        
        detailTaoBaoVC.url = [dict objectForKey:@"pUrl"];
        
        NSString *name = [dict objectForKey:@"title"];
        detailTaoBaoVC.title = name;
    }
}

//请求接口数据
-(void)startRequest:(NSString*)strUrl
{
    //加载的提示
    HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    HUD.labelText = @"正在请求...";
    HUD.delegate = self;
    
    
    NSURL *url = [NSURL URLWithString:strUrl];
    //异步请求
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setTimeOutSeconds:30];
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(requestSuccess:)];
    [request setDidFailSelector:@selector(requestError:)];
    [request startAsynchronous];
}

//成功回调方法
- (void)requestSuccess:(ASIHTTPRequest *)request
{
    [HUD hide:YES];
    
    self.xmlNotes = [NSMutableArray new];
    NSData *data = nil;
    //接口数据
    data = [request responseData];
//    TBXML* tbxml = [[TBXML alloc] initWithXMLData:data error:nil];
    
    //gbk转utf8编码
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *xmlData = [[NSString alloc] initWithData:data encoding:gbkEncoding];
    TBXML* tbxml = [[TBXML alloc] initWithXMLString:xmlData error:nil];
    TBXMLElement * root = tbxml.rootXMLElement;
    
	// if root element is valid
	if (root) {
            TBXMLElement * noteElement = [TBXML childElementNamed:@"info" parentElement:root];
//        TBXMLElement * noteElement = [TBXML childElementNamed:@"item" parentElement:root];
        
        while ( noteElement != nil) {
            NSMutableDictionary *dict = [NSMutableDictionary new];
            
            /*
            TBXMLElement *midElement = [TBXML childElementNamed:@"numiid" parentElement:noteElement];
            if ( midElement != nil) {
                NSString *mid = [TBXML textForElement:midElement];
                NSString *productUrl = @"http://mao.tejiamao.com/app/url.php?id=";
                productUrl = [productUrl stringByAppendingString:mid];
                [dict setValue:mid forKey:@"numiid"];
                [dict setValue:productUrl forKey:@"pUrl"];
            }
             */
            
            /*
            TBXMLElement *titleElement = [TBXML childElementNamed:@"title" parentElement:noteElement];
            if ( titleElement != nil) {
                NSString *title = [TBXML textForElement:titleElement];
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
             */
            
            TBXMLElement *titleElement = [TBXML childElementNamed:@"title" parentElement:noteElement];
            if ( titleElement != nil) {
                NSString *title = [TBXML textForElement:titleElement];
                [dict setValue:title forKey:@"title"];
            }
            
            TBXMLElement *productUrlElemnt = [TBXML childElementNamed:@"taokeurl" parentElement:noteElement];
            if (productUrlElemnt != nil) {
                NSString * productUrl = [TBXML textForElement:productUrlElemnt];
                [dict setValue:productUrl forKeyPath:@"pUrl"];
            }
            
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
            
            
            [self.xmlNotes addObject:dict];
            
            
            noteElement = [TBXML nextSiblingNamed:@"info" searchFromElement:noteElement];
//            noteElement = [TBXML nextSiblingNamed:@"item" searchFromElement:noteElement];
		}
    }
     self.listData = self.xmlNotes;
    [self reloadView:self.xmlNotes];
}

//失败回调方法
- (void)requestError:(ASIHTTPRequest *)request
{
    [HUD hide:YES];
    NSError *error = [request error];
    NSLog(@"%@", [error localizedDescription]);
    NSString *errorStr = @"获取数据失败";
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"错误信息"
                                                        message:errorStr
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
    [alertView show];
}

//重新加载表视图
-(void)reloadView:(NSMutableArray*)res
{
    if (res != nil) {
        [self.tableView reloadData];
    } else {
        NSString *errorStr = @"获取数据失败";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"错误信息"
                                                            message:errorStr
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
        [alertView show];
    }
}


@end
