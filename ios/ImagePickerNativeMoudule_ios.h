//
//  ImagePickerNativeMoudule_ios.h
//  testBridge
//
//  Created by Rover on 24/1/16.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RCTViewManager.h"

#import "QBImagePickerController.h"

@interface ImagePickerNativeMoudule_ios : RCTViewManager<RCTBridgeModule,QBImagePickerControllerDelegate>

@end
