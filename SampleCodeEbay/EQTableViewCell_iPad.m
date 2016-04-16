//
//  EQTableViewCell_iPad.m
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import "EQTableViewCell_iPad.h"
#import "PureLayout.h"
@implementation EQTableViewCell_iPad

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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
        
        self.lat = [[UILabel alloc] init];
        self.lat.font = [UIFont systemFontOfSize:20.0];
        [self.contentView addSubview:self.lat];
        
        self.lng = [[UILabel alloc] init];
        self.lng.font = [UIFont systemFontOfSize:20.0];
        [self.contentView addSubview:self.lng];
        
        [self loadiPhoneLayout];
    }
    return self;
}

- (void) loadiPhoneLayout{
    [self.dateTime autoSetDimension:ALDimensionHeight toSize:20.0];
    ALEdgeInsets defInsets = ALEdgeInsetsMake(10,10,10,10);
    [self.dateTime autoPinEdgesToSuperviewEdgesWithInsets:defInsets excludingEdge:ALEdgeBottom];
    
    [self.src autoSetDimension:ALDimensionHeight toSize:20.0];
    [self.src autoPinEdgesToSuperviewEdgesWithInsets:defInsets excludingEdge:ALEdgeTop];
    
    [self.magnitude autoSetDimension:ALDimensionHeight toSize:20.0];
    [self.magnitude autoPinEdgesToSuperviewEdgesWithInsets:defInsets excludingEdge:ALEdgeLeft];
    
    [self.depth autoSetDimension:ALDimensionHeight toSize:20.0];
    [self.depth autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [self.depth autoAlignAxisToSuperviewMarginAxis:ALAxisVertical];
    
    [self.lat autoSetDimension:ALDimensionHeight toSize:20.0];
    [self.lat autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [self.lat autoAlignAxisToSuperviewMarginAxis:ALAxisVertical];
    
    [self.lng autoSetDimension:ALDimensionHeight toSize:20.0];
    [self.lng autoAlignAxisToSuperviewMarginAxis:ALAxisHorizontal];
    [self.lng autoAlignAxisToSuperviewMarginAxis:ALAxisVertical];
    
    
}

- (void) setModel:(EarthQuakeDataModel *) model {
    self.dateTime.text = model.datetime;
    self.src.text = model.src;
    self.magnitude.text = [NSString stringWithFormat:@"%.02f",model.magnitude];
    self.depth.text = [NSString stringWithFormat:@"Depth: %.02f",model.depth];
    self.lng.text = [NSString stringWithFormat:@"Longitude: %.02f",model.lng];
    self.lat.text = [NSString stringWithFormat:@"Latitude: %.02f",model.lat];
}


@end
