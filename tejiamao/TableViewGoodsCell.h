//
//  TableViewGoodsCell.h
//  tejiamao
//
//  Created by christieheli on 5/24/14.
//  Copyright (c) 2014 christieheli. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "StrikeThroughLabel.h"

@interface TableViewGoodsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *goodImage;
@property (weak, nonatomic) IBOutlet UILabel *goodTitle;
@property (weak, nonatomic) IBOutlet UILabel *goodZhePrice;
@property (weak, nonatomic) IBOutlet UILabel *goodPrice;
@property (weak, nonatomic) IBOutlet UILabel *goodZhekou;

@end
