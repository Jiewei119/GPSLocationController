//
//  ViewController.m
//  GPSLocationControllerDemo
//
//  Created by hjw119 on 2017/2/27.
//  Copyright © 2017年 hjw. All rights reserved.
//

#import "ViewController.h"
#import "GPSLocationController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (![GPSLocationController locationServicesEnabled]) {
        NSLog(@"定位服务不可用");
    }
    else {
        
        [[GPSLocationController sharedInstance] registerGPSLocationResultBlock:^(BOOL success, NSString *msg) {
            if (success) {
                NSLog(@"定位成功：%@",[GPSLocationController getLocation]);
                NSLog(@"%@",[GPSLocationController getLocationCity]);
            }
            else {
                NSLog(@"定位失败：%@",msg);
                NSLog(@"缓存的定位位置：%@",[GPSLocationController getLocation]);
                NSLog(@"缓存的定位城市：%@",[GPSLocationController getLocationCity]);
            }
        }];
        
        NSLog(@"开始定位");
        [[GPSLocationController sharedInstance] startLocation];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
