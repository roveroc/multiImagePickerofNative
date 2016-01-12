//
//  RoverCoreLocation.m
//  testBridge
//
//  Created by Rover on 17/12/15.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import "ConvertDateNativeToOC.h"


@implementation ConvertDateNativeToOC

+ (CLLocationCoordinate2D)CLLocationCoordinate2D:(id)json
{
  json = [self NSDictionary:json];
  NSLog(@"latitude = %f",[self CLLocationDegrees:json[@"latitude"]]);
  NSLog(@"longitude = %f",[self CLLocationDegrees:json[@"longitude"]]);
  return (CLLocationCoordinate2D){
    [self CLLocationDegrees:json[@"latitude"]],
    [self CLLocationDegrees:json[@"longitude"]]
  };
}


+ (MKCoordinateSpan)MKCoordinateSpan:(id)json
{
  json = [self NSDictionary:json];
  return (MKCoordinateSpan){
    [self CLLocationDegrees:json[@"latitudeDelta"]],
    [self CLLocationDegrees:json[@"longitudeDelta"]]
  };
}

+ (MKCoordinateRegion)MKCoordinateRegion:(id)json
{
  return (MKCoordinateRegion){
    [self CLLocationCoordinate2D:json],
    [self MKCoordinateSpan:json]
  };
}


+ (NSString *)AnnotationImage:(id)json{
  json = [self NSDictionary:json];
  return json[@"imageUrl"];
}

@end
