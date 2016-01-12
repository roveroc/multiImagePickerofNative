//
//  KukuHttpRequst.m
//  KukuWatch
//
//  Created by ltbl on 7/9/15.
//  Copyright (c) 2015 Rover. All rights reserved.
//

#import "KukuHttpRequst.h"

@implementation KukuHttpRequst
@synthesize rootView;


+ (KukuHttpRequst *)shareInstance{
    static KukuHttpRequst *gInstance = NULL;
    @synchronized(self){
        if (!gInstance){
            gInstance = [self new];
        }
    }
    return(gInstance);
}



@end
