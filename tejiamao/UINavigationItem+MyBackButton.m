//
//  UINavigationItem+MyBackButton.m
//  tejiamao
//
//  Created by christieheli on 5/26/14.
//  Copyright (c) 2014 christieheli. All rights reserved.
//

#import "UINavigationItem+MyBackButton.h"

@implementation UINavigationItem (MyBackButton)

- (UIBarButtonItem *)backBarButtonItem
{
    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

@end
