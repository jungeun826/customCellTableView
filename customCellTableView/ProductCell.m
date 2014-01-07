//
//  ProductCell.m
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductCell.h"
@interface ProductCell()
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;

@end
@implementation ProductCell
-(void)setProductInfo:(Product *)item{
    self.productName.text = item.name;
    self.productImage.image = [UIImage imageNamed:item.imageName];
    self.productPrice.text = item.price;
    
    
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)addCart:(id)sender {
    [self.delegate addItem:self];
}

@end
