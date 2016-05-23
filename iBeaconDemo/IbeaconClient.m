//
//  IbeaconClient.m
//  iBeaconDemo
//
//  Created by qianfeng on 14-9-22.
//  Copyright (c) 2014年 fuyanan. All rights reserved.
//

#import "IbeaconClient.h"
@implementation IbeaconClient

-(id)initWithBlock:(void (^)(NSMutableDictionary *))a{
    if (self=[super init]) {
        self.myBlock=a;
        
    }
    return self;

}
-(id)init{
    if (self=[super init]) {
        //
        manager=[[CLLocationManager alloc
                  ]init];
        manager.delegate=self;
        //初始化定位数据
        NSUUID *uuid=[[NSUUID alloc]initWithUUIDString:KUUID];
        beaconRegion=[[CLBeaconRegion alloc]initWithProximityUUID:uuid identifier:[[NSBundle mainBundle]bundleIdentifier]];
        //开始搜索ibeacon设备，需要注意的是ibezcon搜索的是服务采用的蓝牙4.0低耗技术，一粒纽扣电池，可以工作半年，
//        蓝牙2.0时代，和4.0时代，需要蓝牙配对，并且iOS使用的事使用的事2.0蓝牙需要MFI认证，一个认证是一个设备，一个认证9万美金
        [manager startMonitoringForRegion:beaconRegion];
        [manager stopRangingBeaconsInRegion:beaconRegion];
        [manager requestStateForRegion:beaconRegion];
        self.beaconDic=[NSMutableDictionary dictionaryWithCapacity:0];
    }
    return self;
    

}



#pragma mark 相关代理
-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region{
    
    //开始搜索
    NSLog(@"开始搜索");
}
-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region{
//检索到ibeacon设备
    NSLog(@"开始检索到ibeacon设备");
    for (CLBeacon *beacon in beacons) {
        NSLog(@"~~~~~~~~~~%d++++++++++%d",[beacon.major intValue],[beacon.minor intValue]);
        //对beacon 进行整理，把相关参数转化为字符串
        [self loadData:beacon];
        //NSLog(@"%@",str );
        
//        [self.beaconDic setObject: forKey:[beacon.minor StringValue]];
    }
    //设置反相传值，通知外面刷新数据
    
}

-(NSString*)loadData:(CLBeacon *)beacon{
//获得标示
    NSString *uuid=beacon.proximityUUID.UUIDString;
    //获得主频
    NSString *major=[beacon.major stringValue];
    //获得辅频
    NSString *minor=[beacon.minor stringValue];
    //获得信号强度
    NSString *rssi=[NSString stringWithFormat:@"%d",beacon.rssi];
    //获得距离
    NSString *prx=[NSString stringWithFormat:@"%f",beacon.accuracy];
    return prx;

}
-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region{
    NSLog(@"你进入一个ibeacon区域");
}


-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region{
NSLog(@"你离开一个ibeacon区域");
}



-(void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error{
NSLog(@"ibeacon开启失败");

}


@end
