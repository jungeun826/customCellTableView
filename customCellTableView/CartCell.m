//
//  CartCell.m
//  customCellTableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "CartCell.h"
#import "CartItem.h"
@interface CartCell()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *quantity;

@end

@implementation CartCell

-(IBAction)plusClicked:(id)sender{
    [self.delegate incQuantity:self.productCode];
    NSLog(@"plus Click");
}

-(IBAction)minusClicked:(id)sender{
    [self.delegate decQuantity:self.productCode];
    NSLog(@"minus Click");
}

-(void)setCartItem:(CartItem *)item{
    self.productCode = item.productCode;
    
    self.name.text = item.productCode;
    self.quantity.text = [NSString stringWithFormat:@"%d 개",(int)item.quantity];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
