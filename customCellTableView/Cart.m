//
//  Cart.m
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Cart.h"
#import "CartItem.h"
@interface Cart(){
    NSMutableArray *items;
}

@end
@implementation Cart
-(id)init{
    self = [super init];
    if(self){
        items = [[NSMutableArray alloc]init];
    }
    return self;
}
-(void)addProduct:(Product *)item{
    if([self searchCartItemWithCode:item.code] == nil){
        CartItem *cartItem = [CartItem cartItemWithName:item.name code:item.code];
        [items addObject:cartItem];
    }else{
        [self incQuantity:item.code];
    }
}
-(void)incQuantity:(NSString *)itemCode{
    CartItem *item = [self searchCartItemWithCode:itemCode];
    item.quantity++;
}
-(void)decQuantity:(NSString *)itemCode{
    CartItem *item = [self searchCartItemWithCode:itemCode];
    item.quantity--;
    
    if(item.quantity == 0)
        [items removeObject:item];
}
-(CartItem *)searchCartItemWithCode:(NSString *)productCode{
    for(CartItem *item in items){
        if([item isEqualItem:productCode])
            return item;
    }
    return nil;
}
-(int)numberOfCartItems{
    return (int)[items count];
}
-(CartItem *)cartAt:(int)index{
    return items[index];
}
@end
