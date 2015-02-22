//
//  MarketTableViewCell.h
//  HackInvest
//
//  Created by Lucien on 2015/2/21.
//  Copyright (c) 2015年 Lucien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarketTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *stockNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
