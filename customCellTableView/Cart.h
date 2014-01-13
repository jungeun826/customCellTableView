//
//  Cart.h
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "CartItem.h"
@interface Cart : NSObject
-(void)addProduct:(Product *)item;
-(void)incQuantity:(NSString *)itemCode;
-(void)decQuantity:(NSString *)itemCode;
-(CartItem *)searchCartItemWithCode:(NSString *)productCode;
-(int)numberOfCartItems;
-(CartItem *)cartAt:(int)index;
+(id)sharedCart;
@end
