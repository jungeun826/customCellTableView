//
//  CartCell.h
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarDelegate.h"
#import "CartItem.h"
@interface CartCell : UITableViewCell
@property (weak, nonatomic) id<CarDelegate> delegate;
@property (copy, nonatomic) NSString *productCode;

-(void)setCartItem:(CartItem *)item;
@end
