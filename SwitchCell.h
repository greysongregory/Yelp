//
//  SwitchCell.h
//  Yelp
//
//  Created by Greyson Gregory on 10/27/15.
//  Copyright © 2015 Grey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchCell;

@protocol SwitchCellDelegate <NSObject>

- (void)switchCell:(SwitchCell *)switchCell valueDidChange:(BOOL) value;

@end

@interface SwitchCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UISwitch *cellSwitch;

@property (nonatomic, weak) id<SwitchCellDelegate> delegate;
@end



