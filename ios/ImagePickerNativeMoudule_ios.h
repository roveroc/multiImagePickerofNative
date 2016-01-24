//
//  ImagePickerNativeMoudule_ios.h
//  testBridge
//
//  Created by Rover on 24/1/16.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RCTViewManager.h"

#import "ZYQAssetPickerController.h"

@interface ImagePickerNativeMoudule_ios : RCTViewManager<RCTBridgeModule,ZYQAssetPickerControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>{
		RCTResponseSenderBlock callback;
		UIActionSheet *sheet;
	UIImagePickerController *takePhotoCon;
}
@property (nonatomic, retain) UIActionSheet *sheet;
@property (nonatomic, retain) UIImagePickerController *takePhotoCon;

@end
