//
//  NSObject+CartCatalog.m
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductCatalog.h"
#import "Product.h"

@implementation ProdctCatalog{
    NSArray *data;
}

static ProdctCatalog *_instance = nil;
+(id)defaultProductCatalog{
    if(_instance == nil)
        _instance = [[ProdctCatalog alloc]init];
    return _instance;
}

-(id)init{
    self = [super init];
    if(self){
        data = @[[Product productWithName:@"normalBall" code:@"normalBall" price:@"$100" image:@"ball.png"],
                 [Product productWithName:@"redBall" code:@"redBall" price:@"$200" image:@"ball1.png"],
                 [Product productWithName:@"kittyBall" code:@"kittyBall" price:@"$400" image:@"ball2.png"],
                 [Product productWithName:@"greenBall" code:@"greenBall" price:@"$300" image:@"ball3.png"]];
    }
    return self;
}

-(id)productAt:(int)index{
    return [data objectAtIndex:index];
}

-(int)numberOfProducts{
    return (int)[data count];
}
@end
