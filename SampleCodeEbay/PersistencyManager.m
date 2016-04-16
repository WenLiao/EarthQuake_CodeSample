//
//  PersistencyManager.m
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import "PersistencyManager.h"
#import "EarthQuakeDataModel.h"

@interface PersistencyManager () {
    NSMutableArray *EQData;
}
@end

@implementation PersistencyManager

- (NSArray *) getEQData {
    return EQData;
}

- (void) addEQData:(EarthQuakeDataModel *) eqData atIndex:(int) index {
    if(!EQData) EQData = [[NSMutableArray alloc] init];
    if(EQData.count >= index)
        [EQData insertObject:eqData atIndex:index];
    else
        [EQData addObject:eqData];
}

@end
