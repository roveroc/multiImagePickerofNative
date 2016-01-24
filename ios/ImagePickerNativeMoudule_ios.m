//
//  ImagePickerNativeMoudule_ios.m
//  testBridge
//
//  Created by Rover on 24/1/16.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "ImagePickerNativeMoudule_ios.h"

@implementation ImagePickerNativeMoudule_ios


RCT_EXPORT_MODULE()     //必须导入Native的该宏，想当于声明这个类要实现自定义模块的功能

RCT_EXPORT_METHOD(showImagePicker){
	QBImagePickerController *imagePickerController = [[QBImagePickerController alloc] init];
	imagePickerController.delegate = self;
	imagePickerController.allowsMultipleSelection = YES;
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:imagePickerController];
	[[UIApplication sharedApplication].windows[0].rootViewController presentViewController:navigationController animated:YES completion:NULL];

}


@end
