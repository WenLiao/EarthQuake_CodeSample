//
//  EarthQuakeData.h
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EarthQuakeDataModel : NSObject

@property(nonatomic, copy) NSString *datetime;
@property(nonatomic, copy) NSString *src;
@property(nonatomic, copy) NSString *quid;
@property(nonatomic, assign) double magnitude;
@property(nonatomic, assign) double lat;
@property(nonatomic, assign) double depth;
@property(nonatomic, assign) double lng;

+ (instancetype) initWithAttributes:(NSDictionary *) attrDic;

@end
