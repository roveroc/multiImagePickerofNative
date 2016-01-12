//
//  KukuHttpRequst.h
//  KukuWatch
//
//  Created by ltbl on 7/9/15.
//  Copyright (c) 2015 Rover. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "RCTRootView.h"

@interface KukuHttpRequst : NSObject{
  RCTRootView *rootView;

}
@property (nonatomic, retain) RCTRootView *rootView;


+ (KukuHttpRequst *)shareInstance;


@end
