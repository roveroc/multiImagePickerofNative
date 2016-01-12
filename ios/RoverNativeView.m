//
//  RoverNativeView.m
//  testBridge
//
//  Created by Rover on 16/12/15.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import "RoverNativeView.h"
#import <MapKit/MapKit.h>

#import "RoverNativeView.h"

#import "ConvertDateNativeToOC.h"


@implementation RoverNativeView
@synthesize v;

RCT_EXPORT_MODULE()

- (UIView *)view
{
  v = [[MKMapView alloc] init];
  NSLog(@"kill you");

  
  return v;
}


- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation
{
  MKPinAnnotationView *pinView = nil;
  
  
  static NSString *defaultPinID = @"com.invasivecode.pin";
  pinView = (MKPinAnnotationView *)[v dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
  if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc]
                                    initWithAnnotation:annotation reuseIdentifier:defaultPinID];
  pinView.pinColor = MKPinAnnotationColorRed;
  pinView.canShowCallout = YES;
  pinView.animatesDrop = YES;
  return pinView;
}


RCT_EXPORT_VIEW_PROPERTY(scrollEnabled, BOOL)

RCT_CUSTOM_VIEW_PROPERTY(region1, RoverCoreLocation, RoverNativeView)
{
  MKCoordinateRegion re = [ConvertDateNativeToOC MKCoordinateRegion:json];
  CLLocationCoordinate2D center = re.center;
  
//  CLLocationCoordinate2D coordinate;
//  coordinate.latitude = 23.134844f;
//  coordinate.longitude = 113.317290f;
  MKPointAnnotation *ann = [[MKPointAnnotation alloc] init];
  ann.coordinate = center;
  [ann setTitle:@"天河城"];
  [ann setSubtitle:@"购物好去处"];
  //触发viewForAnnotation
  [(MKMapView *)view addAnnotation:ann];
}






RCT_EXPORT_METHOD(location:(UIView *)mview num1:(float)n1 num2:(float)n2)
{

}


@end
