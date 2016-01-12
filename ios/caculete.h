//
//  caculete.h
//  testBridge
//
//  Created by Rover on 23/12/15.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImageDownloader.h>
#import <SDWebImageManager.h>

@protocol caculeteDelegate <NSObject>

- (void)getSum:(int)n1 num2:(int)n2;

@end


@interface caculete : NSObject<caculeteDelegate,NSURLConnectionDelegate,NSURLConnectionDataDelegate>{
  id<caculeteDelegate> delegate;
  NSURLConnection* connection;
  NSMutableData* data;
}
@property (nonatomic, retain) id<caculeteDelegate> delegate;




- (void)getTowNumberValue:(int)n1 num2:(int)n2;

@end
