//
//  IbeaconClient.h
//  iBeaconDemo
//
//  Created by qianfeng on 14-9-22.
//  Copyright (c) 2014年 fuyanan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface IbeaconClient : NSObject<CLLocationManagerDelegate>
{
    CLLocationManager *manager;
    CLBeaconRegion *beaconRegion;

}
//设置一个数组，用于记录我收到的消息
@property(nonatomic,strong)NSMutableDictionary* beaconDic;
//设置block方法;
@property(nonatomic,copy)void(^myBlock)(NSMutableDictionary*);
//初始化方法
-(id)initWithBlock:(void(^)(NSMutableDictionary*))a;
@end
