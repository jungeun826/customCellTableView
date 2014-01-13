//
//  ViewController.m
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductCell.h"
#import "Product.h"
#import "ProductCatalog.h"
#import "Cart.h"
#import "CartCell.h"
#import "CartItem.h"
#import "ProductDetailViewController.h"
@interface ProductViewController ()<UITableViewDataSource, UITableViewDelegate, CartDelegate>{
    Cart *_cart;
    ProdctCatalog *_productCatalog;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ProductViewController
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
    NSString *msg = [NSString stringWithFormat:@"%@가 카트에 추가되었습니다.", item.name];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"추가되었습니다." message:msg delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.firstOtherButtonIndex == buttonIndex){
        [self.tabBarController setSelectedIndex:1];
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return [_productCatalog numberOfProducts];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Product";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        Product *item = [_productCatalog productAt:(int)indexPath.row];
        [cell setProductInfo:item];
    
        cell.delegate = self;
        return cell;
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
    _cart = [Cart sharedCart];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
