//
//  CartItem.h
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartItem : NSObject

@property (weak, nonatomic) NSString *productName;
@property (weak, nonatomic) NSString *productCode;
@property (nonatomic) NSInteger quantity;

+(id)cartItemWithName:(NSString *)productName code:(NSString *)productCode;
-(BOOL)isEqualItem:(NSString *)productCode;
@end
