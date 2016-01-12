//
//  MainViewConrtroller.h
//  testBridge
//
//  Created by Rover on 24/12/15.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "caculete.h"

#import <UIImageView+WebCache.h>

#import "RCTEventDispatcher.h"
#import "RCTBridgeModule.h"

#import "RCTRootView.h"

#import "RCTComponent.h"

#import "RoverNativeView.h"

@interface MainViewConrtroller : UIViewController<caculeteDelegate,RCTEvent,RCTBridgeModule>{
  RCTRootView *rootView;
}


- (IBAction)btnFun:(id)sender;


@end
