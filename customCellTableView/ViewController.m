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
#import "ProductCatalog.h"
#import "Cart.h"
#import "CartCell.h"
#import "CartItem.h"
#import "ProductDetailViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CartDelegate>{
    Cart *_cart;
    ProdctCatalog *_productCatalog;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ProductDetailViewController * detailVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *selectedProduct = [_productCatalog productAt:(int)indexPath.row];
    
    detailVC.productCode = selectedProduct.code;
}
-(void)addItem:(id)sender{
    UITableViewCell *cell = (UITableViewCell *)sender;
    
    NSIndexPath *indexPath = [self.table indexPathForCell:cell];
    NSLog(@"%d",(int)indexPath.row);
    Product *item = [_productCatalog productAt:(int)indexPath.row];
    
    [_cart addProduct:item];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
        return [_productCatalog numberOfProducts];
    else
        return [_cart numberOfCartItems];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return (section ==0) ? @"Product":@"Items in Cart";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        Product *item = [_productCatalog productAt:(int)indexPath.row];
        [cell setProductInfo:item];
    
        cell.delegate = self;
        return cell;
    }else {
        CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        CartItem *item = [_cart cartAt:(int)indexPath.row];
        cell.delegate = self;
        [cell setCartItem:item];
        //NSLog(@"pathrow : %d, %@", ad,item.name);
        return cell;
    }
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _productCatalog = [ProdctCatalog defaultProductCatalog];
    _cart = [[Cart alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)incQuantity:(NSString *)productCode{
    [_cart incQuantity:productCode];
    
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.table setNeedsDisplay];
}
-(void)decQuantity:(NSString *)productCode{
    [_cart decQuantity:productCode];
    
    
    NSIndexSet *indexSet= [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}


@end
