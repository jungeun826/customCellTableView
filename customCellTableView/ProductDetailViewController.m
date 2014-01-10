//
//  ProductDetailViewController.m
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "ProductCatalog.h"
#import "Product.h"
@interface ProductDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productDescription;
@end

@implementation ProductDetailViewController
-(void)viewWillAppear:(BOOL)animated{
    ProdctCatalog *productCatalog = [ProdctCatalog defaultProductCatalog];
    Product *product = [productCatalog productWithCode:self.productCode];
    self.productImageView.image = [UIImage imageNamed:product.imageName];
    self.productName.text = product.name;
    self.productPrice.text = product.price;
    self.productDescription.text = product.name;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
