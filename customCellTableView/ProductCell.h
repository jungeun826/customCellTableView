//
//  ProductCell.h
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "CarDelegate.h"
@interface ProductCell : UITableViewCell
@property (weak) id<CarDelegate> delegate;
-(void)setProductInfo:(Product *)item;
@end
