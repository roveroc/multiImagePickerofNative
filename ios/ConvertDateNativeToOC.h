//
//  RoverCoreLocation.h
//  testBridge
//
//  Created by Rover on 17/12/15.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import "RCTConvert.h"
#import "RCTConvert+CoreLocation.h"
#import <MapKit/MapKit.h>

@interface ConvertDateNativeToOC : RCTConvert


+ (CLLocationCoordinate2D)CLLocationCoordinate2D:(id)json;

+ (MKCoordinateSpan)MKCoordinateSpan:(id)json;
+ (MKCoordinateRegion)MKCoordinateRegion:(id)json;

+ (NSString *)AnnotationImage:(id)json;


@end
