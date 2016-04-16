//
//  ViewController.m
//  SampleCodeEbay
//
//  Created by jimliao on 2016/4/14.
//  Copyright © 2016年 jimliao. All rights reserved.
//

#import "EQTabieViewController.h"
#import "EQTableView.h"
#import "EQTableViewCell_iPhone.h"
#import "EQTableViewCell_iPad.h"
#import <PureLayout.h>
#import "LibAPI.h"
#import "EarthQuakeDataModel.h"
#import "PersistencyManager.h"
#import "MapViewController.h"

@interface EQTabieViewController ()
{
    NSArray *eqData;
    NSMutableData *receivedData;
}
@end

#define IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

@implementation EQTabieViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Requesting Data
    [[LibAPI sharedInstance] querryEQDataVia:self];
    
    //Setup TableView
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.tableView.frame = screenRect;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.rowHeight = 100;
    
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - TableView Data Source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [eqData count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    EQTableViewCell_iPhone *cell;
    if(IPAD) {
        cell = (EQTableViewCell_iPad *)[tableView dequeueReusableCellWithIdentifier:identifier];
        
        if(!cell) {
            cell = [[EQTableViewCell_iPad alloc] init];
        }
    }
    
    else {
        cell = (EQTableViewCell_iPhone *)[tableView dequeueReusableCellWithIdentifier:identifier];
        
        if(!cell) {
            cell = [[EQTableViewCell_iPhone alloc] init];
        }
    }
    

    NSInteger index = [indexPath row];
    EarthQuakeDataModel *model = eqData[index];
    cell.model = model;
    
    //Mark Mag above 8.0
    if(model.magnitude>=8.0)
        cell.backgroundColor = [UIColor redColor];
    else
        cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma mark - TableView Delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EarthQuakeDataModel *model = eqData[[indexPath row]];
    MapViewController *mapVC = [[MapViewController alloc] init];
    [self presentViewController:mapVC animated:YES completion:^{
        [mapVC locateToPlace:MKCoordinateRegionMake(CLLocationCoordinate2DMake(model.lat, model.lng), MKCoordinateSpanMake(40, 40)) magnitude:model.magnitude];
    }];
}



#pragma mark - NSURLSessionDataDelegate
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler {
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    if (httpResponse.statusCode == 200) {
        
        completionHandler(NSURLSessionResponseAllow);   // continue
        
    } else {
        completionHandler(NSURLSessionResponseCancel);  // stop
    }
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    
    if(!receivedData) {
        receivedData = [[NSMutableData alloc] init];
    }
    [receivedData appendData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    
    if (!error) {
        [self dataToModel:receivedData];
    } else {
        NSLog(@"error:%@",error);
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Server Response Error" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){[alert dismissViewControllerAnimated:YES completion:nil];}];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    [session invalidateAndCancel];
    
}

- (void) dataToModel:(NSData *) data {
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    
    NSArray *eqDatas = jsonDic[@"earthquakes"];
    int i =0;
    PersistencyManager *persistency = [[LibAPI sharedInstance] getPersistencyManager];
    for (NSDictionary *dic in eqDatas) {
        [persistency addEQData:[EarthQuakeDataModel initWithAttributes:dic] atIndex:i++];
    }
    
    eqData = [[LibAPI sharedInstance] getEQData];
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    
}


#pragma mark - System
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
