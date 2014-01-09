//
//  ViewController.m
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Product.h"
#import "NSObject+CartCatalog.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CarDelegate>{
    NSMutableArray *_cartItems;
    CartCatalog *_cartCatalog;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0)
        return UITableViewCellEditingStyleNone;
    else
        return UITableViewCellEditingStyleDelete;
}
//밀어서 셀 삭제
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1){
        //데이터 삭제
        [_cartItems removeObjectAtIndex:indexPath.row];
        //테이블 셀 삭제
        NSArray *rows = [NSArray arrayWithObject:indexPath];
        [tableView deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
-(void)addItem:(id)sender{
    UITableViewCell *cell = (UITableViewCell *)sender;
    
    NSIndexPath *indexPath = [self.table indexPathForCell:cell];
    NSLog(@"%d",(int)indexPath.row);
    Product *item = [_cartCatalog productAt:(int)indexPath.row];
    
    [_cartItems addObject:item];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
        return [_cartCatalog numberOfProducts];
    else
        return [_cartItems count];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return (section ==0) ? @"Product":@"Items in Cart";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        Product *item = [_cartCatalog productAt:(int)indexPath.row];
        [cell setProductInfo:item];
    
        cell.delegate = self;
        return cell;
    }else {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
         NSLog(@"cart %d",(int)indexPath.row);
        Product *item = _cartItems[indexPath.row];
        cell.textLabel.text = item.name;
        //NSLog(@"pathrow : %d, %@", ad,item.name);
        return cell;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _cartCatalog = [CartCatalog defaultCartCatalog];
    _cartItems = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
