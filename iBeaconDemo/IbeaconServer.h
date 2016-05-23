//
//  IbeaconServer.h
//  iBeaconDemo
//
//  Created by qianfeng on 14-9-22.
//  Copyright (c) 2014年 fuyanan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>
@interface IbeaconServer : NSObject<CLLocationManagerDelegate,CBPeripheralManagerDelegate>
{
    NSMutableDictionary *dic;
    CBPeripheralManager *manager;

}

@end
