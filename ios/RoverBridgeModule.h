//
//  RoverBridgeModule.h
//  testBridge
//
//  Created by Rover on 16/12/15.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>




#import "RCTBridgeModule.h"
#import "RCTEventDispatcher.h"

@interface RoverBridgeModule : NSObject<RCTBridgeModule,RCTEvent,UIAlertViewDelegate>
{
  RCTResponseSenderBlock callback1;
  NSTimer *timer;
}

@end
