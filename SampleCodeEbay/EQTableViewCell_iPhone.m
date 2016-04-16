//
//  EQTableViewCell_iPhoneTableViewCell.m
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import "EQTableViewCell_iPhone.h"
#import "PureLayout.h"

@implementation EQTableViewCell_iPhone

- (instancetype)init {
    self = [super init];
    if(self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.dateTime = [[UILabel alloc] init];
        self.dateTime.font = [UIFont systemFontOfSize:20.0];
        [self.contentView addSubview:self.dateTime];
        
        self.src = [[UILabel alloc] init];
        self.src.font = [UIFont systemFontOfSize:20.0];
        [self.contentView addSubview:self.src];
        
        self.magnitude = [[UILabel alloc] init];
        self.magnitude.font = [UIFont systemFontOfSize:20.0];
        [self.contentView addSubview:self.magnitude];
        
        self.depth = [[UILabel alloc] init];
        self.depth.font = [UIFont systemFontOfSize:20.0];
        [self.contentView addSubview:self.depth];
        
        [self loadiPhoneLayout];
    }
    return self;
}

- (void) loadiPhoneLayout{
    [_dateTime autoSetDimension:ALDimensionHeight toSize:20.0];
    ALEdgeInsets defInsets = ALEdgeInsetsMake(10,10,10,10);
    [_dateTime autoPinEdgesToSuperviewEdgesWithInsets:defInsets excludingEdge:ALEdgeBottom];
    
    [_src autoSetDimension:ALDimensionHeight toSize:20.0];
    [_src autoPinEdgesToSuperviewEdgesWithInsets:defInsets excludingEdge:ALEdgeTop];
    
    [_magnitude autoSetDimension:ALDimensionHeight toSize:20.0];
    [_magnitude autoPinEdgesToSuperviewEdgesWithInsets:defInsets excludingEdge:ALEdgeLeft];
    
    [_depth autoSetDimension:ALDimensionHeight toSize:20.0];
    [_depth autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [_depth autoAlignAxisToSuperviewMarginAxis:ALAxisVertical];
    
}

- (void) setModel:(EarthQuakeDataModel *) model {
    self.dateTime.text = model.datetime;
    self.src.text = model.src;
    self.magnitude.text = [NSString stringWithFormat:@"%.02f",model.magnitude];
    self.depth.text = [NSString stringWithFormat:@"depth: %.02f",model.depth];
}

@end
