//
//  NSObject+CartCatalog.h
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartCatalog : NSObject
+(id)defaultCartCatalog;

-(id)productAt:(int)index;
-(int)numberOfProducts;
@end
