//
//  fynViewController.m
//  iBeaconDemo
//
//  Created by qianfeng on 14-9-22.
//  Copyright (c) 2014年 fuyanan. All rights reserved.
//

#import "fynViewController.h"
#import "IbeaconClient.h"
#import "IbeaconServer.h"
@interface fynViewController ()
{
    IbeaconClient*client;
    IbeaconServer *server;

}
@end

@implementation fynViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //测试ibeacon需要真机
	client=[[IbeaconClient alloc]initWithBlock:^(NSMutableDictionary *dataArray) {
       //获取所有的key
        NSArray *allkey=[dataArray allKeys];
        //每个元素是副频的字符串
//        以每个副频寻找在self.view上得tag值的textView；
        int i=self.view.subviews.count;
        for (NSString *num  in allkey) {
            //寻找textView；
            UITextView *textView=(UITextView *)[self.view viewWithTag:[num intValue]];
            if (textView) {
                //如果textView存在就刷新数据
                textView.text=dataArray[num];
                
            }else {
            
            //如果不存在就创建
                UITextView *view=[[UITextView alloc]initWithFrame:CGRectMake(i%3*100,i/3*100 , 90, 90)];
                i++;
                
                //设置背景色黑色
                view.backgroundColor=[UIColor blackColor];
                view.textColor=[UIColor whiteColor];
                //赋值
                view.text=dataArray[num];
                //最总要的设置tag值
                view.tag=[num intValue]; 
                [self.view addSubview:view];
            
            }
        }
        
        
    }];
    server=[[IbeaconServer alloc]init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
