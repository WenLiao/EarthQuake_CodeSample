//
//  LibAPI.h
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersistencyManager.h"

@interface LibAPI : NSObject

+ (LibAPI *) sharedInstance;
- (void) querryEQDataVia:(NSObject<NSURLSessionDataDelegate> *) vc;
- (NSArray *) getEQData;
- (PersistencyManager *) getPersistencyManager;

@end
