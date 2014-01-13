
//
//  CartViewController.m
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 13..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "CartViewController.h"
#import "Cart.h"
#import "CartDelegate.h"
#import "CartCell.h"
@interface CartViewController ()<UITableViewDataSource, UITableViewDelegate, CartDelegate>{
    Cart *_cart;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation CartViewController
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_cart numberOfCartItems];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Items in Cart";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        CartItem *item = [_cart cartAt:(int)indexPath.row];
        cell.delegate = self;
        [cell setCartItem:item];
        //NSLog(@"pathrow : %d, %@", ad,item.name);
        return cell;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _cart = [Cart sharedCart];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)incQuantity:(NSString *)productCode{
    [_cart incQuantity:productCode];    
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.table setNeedsDisplay];
}
-(void)decQuantity:(NSString *)productCode{
    [_cart decQuantity:productCode];
    
    NSIndexSet *indexSet= [NSIndexSet indexSetWithIndex:0];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
