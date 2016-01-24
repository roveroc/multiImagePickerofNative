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
//	[[UIApplication sharedApplication].windows[0].rootViewController presentViewController:navigationController animated:YES completion:NULL];


}

- (void)imagePickerController:(QBImagePickerController *)imagePickerController didFinishPickingMediaWithInfo:(id)info
{
	if(imagePickerController.allowsMultipleSelection) {
		NSArray *mediaInfoArray = (NSArray *)info;
		
		NSLog(@"Selected %d photos", mediaInfoArray.count);
	} else {
		NSDictionary *mediaInfo = (NSDictionary *)info;
		NSLog(@"Selected: %@", mediaInfo);
	}
	
	[[UIApplication sharedApplication].windows[0].rootViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController
{
	NSLog(@"Cancelled");
	
	[[UIApplication sharedApplication].windows[0].rootViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (NSString *)descriptionForSelectingAllAssets:(QBImagePickerController *)imagePickerController
{
	return @"すべての写真を選択";
}

- (NSString *)descriptionForDeselectingAllAssets:(QBImagePickerController *)imagePickerController
{
	return @"すべての写真の選択を解除";
}

- (NSString *)imagePickerController:(QBImagePickerController *)imagePickerController descriptionForNumberOfPhotos:(NSUInteger)numberOfPhotos
{
	return [NSString stringWithFormat:@"写真%d枚", numberOfPhotos];
}

- (NSString *)imagePickerController:(QBImagePickerController *)imagePickerController descriptionForNumberOfVideos:(NSUInteger)numberOfVideos
{
	return [NSString stringWithFormat:@"ビデオ%d本", numberOfVideos];
}

- (NSString *)imagePickerController:(QBImagePickerController *)imagePickerController descriptionForNumberOfPhotos:(NSUInteger)numberOfPhotos numberOfVideos:(NSUInteger)numberOfVideos
{
	return [NSString stringWithFormat:@"写真%d枚、ビデオ%d本", numberOfPhotos, numberOfVideos];
}


@end
