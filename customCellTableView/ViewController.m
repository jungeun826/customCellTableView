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
#import "CarDelegate.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CarDelegate>{
    NSArray *data;
    NSMutableArray *cart;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController
-(void)addItem:(id)sender{
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.table indexPathForCell:cell];
    NSLog(@"%d",(int)indexPath.row);
    Product *item = data[indexPath.row];
    [cart addObject:item];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
        return [data count];
    else
        return [cart count];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return (section ==0) ? @"상품목록":@"카트";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        Product *item = data[indexPath.row];
        
        [cell setProductInfo:item];
    
        cell.delegate = self;
        return cell;
    }else {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
         NSLog(@"cart %d",(int)indexPath.row);
        Product *item = cart[indexPath.row];
        cell.textLabel.text = item.name;
        //NSLog(@"pathrow : %d, %@", ad,item.name);
        return cell;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    data = @[[Product product:@"normalBall" price:@"100" image:@"ball.png"],[Product product:@"redBall" price:@"200" image:@"ball1.png"],[Product product:@"kittyBall" price:@"400" image:@"ball2.png"],[Product product:@"greenBall" price:@"300" image:@"ball3.png"]];
    
    cart = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
