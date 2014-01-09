//
//  NSObject+CartCatalog.m
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "NSObject+CartCatalog.h"
#import "Product.h"

@implementation CartCatalog{
    NSArray *data;
}

static CartCatalog *_instance = nil;
+(id)defaultCartCatalog{
    if(_instance == nil)
        _instance = [[CartCatalog alloc]init];
    return _instance;
}

-(id)init{
    self = [super init];
    if(self){
        data = @[[Product product:@"normalBall" price:@"100" image:@"ball.png"],[Product product:@"redBall" price:@"200" image:@"ball1.png"],[Product product:@"kittyBall" price:@"400" image:@"ball2.png"],[Product product:@"greenBall" price:@"300" image:@"ball3.png"]];
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
