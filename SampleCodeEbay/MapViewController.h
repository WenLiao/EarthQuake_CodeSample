//
//  MapViewController.h
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController

- (void) locateToPlace:(MKCoordinateRegion) region magnitude:(double) mag;

@end
