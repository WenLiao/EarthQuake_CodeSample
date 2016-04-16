//
//  API.h
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API : NSObject


- (void) getEQLists:(NSObject<NSURLSessionDataDelegate>*) controller;

@end
