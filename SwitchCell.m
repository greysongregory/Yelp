//
//  SwitchCell.m
//  Yelp
//
//  Created by Greyson Gregory on 10/27/15.
//  Copyright © 2015 Grey. All rights reserved.
//

#import "SwitchCell.h"



@implementation SwitchCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)onValueChanged:(UISwitch *)sender {
    NSLog(@"Cell value changed");
    [self.delegate switchCell:self valueDidChange:sender.on];
}

@end
