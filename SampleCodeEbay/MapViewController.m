//
//  MapViewController.m
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/15.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () {
    MKMapView *map;
}
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    map = [[MKMapView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    map.zoomEnabled = YES;
    map.scrollEnabled = YES;
    [self.view addSubview:map];
    
    //Back Button
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 10, 50, 50);
    [btn setTitle:@"Back" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(done) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
}

- (void) locateToPlace:(MKCoordinateRegion) region magnitude:(double) mag{
    [map setRegion:region animated:YES];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:region.center];
    [annotation setTitle:[NSString stringWithFormat:@"Earth Quake Center   Mag:%0.2f",mag]];
    [map addAnnotation:annotation];
}

- (void) done {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
