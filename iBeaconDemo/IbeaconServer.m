//
//  IbeaconServer.m
//  iBeaconDemo
//
//  Created by qianfeng on 14-9-22.
//  Copyright (c) 2014年 fuyanan. All rights reserved.
//

#import "IbeaconServer.h"

@implementation IbeaconServer
-(id)init{
    if (self=[super init]) {
        //设置主频
        CLBeaconMajorValue major=45;
        //设置副频
        CLBeaconMinorValue minor=023;
        //主频和副频范围要设在65535范围内，单一的一个参数，数量是有限的，但是2个参数，结合在一起能设置的参数范围就比较大了。
        //我们需要在pch里面创建一个标识
//        创建UUID
        NSUUID *uuid=[[NSUUID alloc]initWithUUIDString:KUUID];
        //创建发送表示
        CLBeaconRegion *region=[[CLBeaconRegion alloc]initWithProximityUUID:uuid major:major minor:minor identifier:[[NSBundle mainBundle]bundleIdentifier]];
        //
        manager=[[CBPeripheralManager alloc]initWithDelegate:self queue:dispatch_get_main_queue()];
        //保存一个广播信息
        dic=[region peripheralDataWithMeasuredPower:nil];
        
        
        
        
    }
    return self;

}


-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral{

//
    if (peripheral.state==CBPeripheralManagerStatePoweredOn) {
        
        //蓝牙开启
//        这个蓝牙开启只是状态变化，是指用户把蓝牙已经打开，但是是否已经开启ibeacon广播服务，是有程序员使用代码来开启的。
    }else{
        if (peripheral.state==CBPeripheralManagerStatePoweredOff) {
            //蓝牙关闭
            [manager stopAdvertising];
        }
    
    
    }


}
@end
