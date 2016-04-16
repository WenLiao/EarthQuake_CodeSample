//
//  API.m
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import "API.h"
#import "LibAPI.h"

@implementation API



- (void) getEQLists:(NSObject<NSURLSessionDataDelegate>*) controller {
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:controller delegateQueue:[[NSOperationQueue alloc] init]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.geonames.org/earthquakesJSON?formatted=true&north=44.1&south=-9.9&east=-22.4&west=55.2&username=mkoppelman"]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
    
    [task resume];
}




@end
