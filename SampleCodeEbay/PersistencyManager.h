//
//  PersistencyManager.h
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EarthQuakeDataModel.h"
@interface PersistencyManager : NSObject<NSURLSessionDataDelegate>

- (NSArray *) getEQData;
- (void) addEQData:(EarthQuakeDataModel *) eqData atIndex:(int) index;


@end
