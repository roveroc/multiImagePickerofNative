//
//  MapNativeModoule_Rover.m
//  testBridge
//
//  Created by Rover on 18/12/15.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import "MapNativeModoule_Rover.h"
#import "RCTPointAnnotation.h"

@implementation MapNativeModoule_Rover{
  MKMapView *mapView_mk;
  NSString *imageUrl;
}



RCT_EXPORT_MODULE()     //必须导入Native的该宏，想当于声明这个类要实现自定义模块的功能

#pragma mark - 该方法想当于重写
- (UIView *)view{
  mapView_mk = [[MKMapView alloc] init];
  mapView_mk.delegate = self;
  return mapView_mk;
}


//- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation
//{
//  MKPinAnnotationView *pinView = nil;
//  static NSString *defaultPinID = @"nativeMapview";
//  pinView = (MKPinAnnotationView *)[mapView_mk dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
//  if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc]
//                                   initWithAnnotation:annotation reuseIdentifier:defaultPinID];
//  pinView.pinColor = MKPinAnnotationColorRed;
////  NSData *imgdata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageUrl]];
////  UIImage *img = [UIImage imageWithData:imgdata];
//  pinView.image = [UIImage imageNamed:@"power_off.png"];
//  pinView.canShowCallout = YES;
//  pinView.animatesDrop = YES;
//  return pinView;
//}

//- (void)mapView:(RCTMap *)mapView regionDidChangeAnimated:(BOOL)animated
//{
//  MKCoordinateRegion region = mapView.region;
//  NSDictionary *event = @{
////                          @"target": mapView.reactTag,
//                          @"region": @{
//                              @"latitude": @(region.center.latitude),
//                              @"longitude": @(region.center.longitude),
//                              @"latitudeDelta": @(region.span.latitudeDelta),
//                              @"longitudeDelta": @(region.span.longitudeDelta),
//                              }
//                          };
//  [self.bridge.eventDispatcher sendInputEventWithName:@"topChange" body:event];
//}

- (MKAnnotationView *)mapView:(__unused MKMapView *)mapView viewForAnnotation:(RCTPointAnnotation *)annotation
{
  MKPinAnnotationView *pinView = nil;
  static NSString *defaultPinID = @"nativeMapview";
  pinView = (MKPinAnnotationView *)[mapView_mk dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
  if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc]
                                   initWithAnnotation:annotation reuseIdentifier:defaultPinID];
  pinView.pinColor = MKPinAnnotationColorRed;
//  NSData *imgdata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageUrl]];
  UIImage *img = [UIImage imageNamed:@"power_off.png"];
  pinView.image = img;
  pinView.canShowCallout = YES;
  pinView.animatesDrop = YES;
  pinView.pinColor = MKPinAnnotationColorGreen;
  NSLog(@"load image");
  return pinView;

}

#pragma mark - 提供给JS使用，地图能不能滑动
RCT_EXPORT_VIEW_PROPERTY(scrollEnabled, BOOL)


#pragma mark - 提供给JS使用，在地图上标记锚点
RCT_CUSTOM_VIEW_PROPERTY(setAnnomation, ConvertDateNativeToOC, MapNativeModoule_Rover){
  MKCoordinateRegion re = [ConvertDateNativeToOC MKCoordinateRegion:json];  //解析数据
  imageUrl = [ConvertDateNativeToOC AnnotationImage:json];
  CLLocationCoordinate2D center = re.center;
  MKPointAnnotation *ann = [[MKPointAnnotation alloc] init];
  ann.coordinate = center;
  [ann setTitle:@"天河城"];
  [ann setSubtitle:@"购物好去处"];
  [(MKMapView *)view addAnnotation:ann];
}




@end
