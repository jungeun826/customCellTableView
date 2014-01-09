//
//  Product.m
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Product.h"
@interface Product()
@end

@implementation Product
+(id)productWithName:(NSString *)name code:(NSString *)code price:(NSString *)price image:(NSString *)image{
    Product *item = [[Product alloc]init];
    item.name = name;
    item.price = price;
    item.imageName = image;
    item.code = code;
    
    return item;
}
-(BOOL)isEqualProduct:(NSString *)code{
    return [self.code isEqualToString:code];
}
@end
