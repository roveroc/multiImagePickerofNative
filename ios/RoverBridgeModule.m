//
//  RoverBridgeModule.m
//  testBridge
//
//  Created by Rover on 16/12/15.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import "RoverBridgeModule.h"

#import "KukuHttpRequst.h"

#import "RCTLog.h"

#import "Pingpp.h"

@implementation RoverBridgeModule
  
//  RCTResponseSenderBlock *callback1;


RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(testBB)
{
  RCTLogInfo(@"Pretending KKKKKK");
}



RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
  RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}


RCT_EXPORT_METHOD(pay:(id)goodsInfo)
{
  NSLog(@"the result = %@",goodsInfo);
  dispatch_async(dispatch_get_main_queue(), ^{
    
    
    [Pingpp setDebugMode:YES];
    [Pingpp createPayment:nil
           viewController:nil
             appURLScheme:nil
           withCompletion:^(NSString *result, PingppError *error) {
             if ([result isEqualToString:@"success"]) {
               NSLog(@"支付成功");
               
               [[KukuHttpRequst shareInstance].rootView.bridge.eventDispatcher
                                                      sendDeviceEventWithName:@"PayNotification"
                                                                         body:@{@"result": @"支付成功"}];
             } else {
               NSLog(@"支付失败：Error: code=%lu msg=%@", error.code, [error getMsg]);
               
               [[KukuHttpRequst shareInstance].rootView.bridge.eventDispatcher
                                                      sendDeviceEventWithName:@"PayNotification"
                                                                         body:@{@"result": @"支付失败"}];
             }
           }];
  });
}





- (void)countNumber{
  NSLog(@"here is running on main thead");
  [[KukuHttpRequst shareInstance].rootView.bridge.eventDispatcher
                                          sendDeviceEventWithName:@"AppOpenedFromNotification"
                                                             body:@{@"name": @"12333",@"name2":@"12321322222"}];
}






@end
