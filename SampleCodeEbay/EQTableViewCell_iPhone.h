//
//  EQTableViewCell_iPhoneTableViewCell.h
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EarthQuakeDataModel.h"

@interface EQTableViewCell_iPhone : UITableViewCell

@property(nonatomic, strong) UILabel *dateTime;
@property(nonatomic, strong) UILabel *depth;
@property(nonatomic, strong) UILabel *src;
@property(nonatomic, strong) UILabel *magnitude;
@property(nonatomic, strong) EarthQuakeDataModel *model;
@end
