//
//  LibAPI.m
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import "LibAPI.h"
#import "PersistencyManager.h"
#import "API.h"

@interface LibAPI () {
    PersistencyManager *persistencyManager;
    API *api;
}

@end

@implementation LibAPI 

- (id) init
{
    self = [super init];
    if (self) {
        persistencyManager = [[PersistencyManager alloc] init];
        api = [[API alloc] init];
    }
    return self;
}


+ (LibAPI *) sharedInstance {
    static LibAPI *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibAPI alloc] init];
    });
    return _sharedInstance;
}

- (void) querryEQDataResultHandler:(NSObject<NSURLSessionDataDelegate> *) vc{
    [api getEQLists:vc];
}

- (void) appendingEQData:(NSArray *) eqData {
    int i=0;
    for (NSDictionary *dic in eqData) {
        [persistencyManager addEQData:[EarthQuakeDataModel initWithAttributes:dic] atIndex:i++];
        /*If we need to sync to server
         API sync
         */
    }
}

- (NSArray *) getEQData {
    return [persistencyManager getEQData];
}



@end
