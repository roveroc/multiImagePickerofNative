//
//  RoverNativeView.h
//  testBridge
//
//  Created by Rover on 16/12/15.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import "RCTViewManager.h"

#import "RCTBridgeModule.h"
#import <MapKit/MapKit.h>


@interface RoverNativeView : RCTViewManager<RCTBridgeModule>{
  
  MKMapView *v;
  
  
}

@property (nonatomic, retain) MKMapView *v;


@end
