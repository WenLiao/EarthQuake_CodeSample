//
//  EarthQuakeData.m
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import "EarthQuakeDataModel.h"

@implementation EarthQuakeDataModel

+ (instancetype) initWithAttributes:(NSDictionary *) attrDic {
    
    EarthQuakeDataModel *eqModel = [[EarthQuakeDataModel alloc] init];
    eqModel.datetime = attrDic[@"datetime"];
    eqModel.src = attrDic[@"src"];
    eqModel.quid = attrDic[@"quid"];
    eqModel.magnitude = [attrDic[@"magnitude"] doubleValue];
    eqModel.lat = [attrDic[@"lat"] doubleValue];
    eqModel.depth = [attrDic[@"depth"] doubleValue];
    eqModel.lng = [attrDic[@"lng"] doubleValue];
    
    return eqModel;
}


@end
