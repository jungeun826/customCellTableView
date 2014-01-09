//
//  CartItem.m
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "CartItem.h"
@interface CartItem()

@end

@implementation CartItem
+(id)cartItemWithName:(NSString *)productName code:(NSString *)productCode{
    CartItem *cartItem = [[CartItem alloc]init];
    cartItem.productCode = productCode;
    cartItem.productName = productName;
    cartItem.quantity = 1;
    
    return cartItem;
}
-(BOOL)isEqualItem:(NSString *)productCode{
    return [self.productCode isEqualToString:productCode];
}
@end
