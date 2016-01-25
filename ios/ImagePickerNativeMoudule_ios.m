//
//  ImagePickerNativeMoudule_ios.m
//  testBridge
//
//  Created by Rover on 24/1/16.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "ImagePickerNativeMoudule_ios.h"

@interface ImagePickerNativeMoudule_ios ()

@property (nonatomic, strong) RCTResponseSenderBlock callback;

@end

@implementation ImagePickerNativeMoudule_ios
@synthesize sheet;
@synthesize takePhotoCon;

RCT_EXPORT_MODULE()     //必须导入Native的该宏，想当于声明这个类要实现自定义模块的功能

#pragma mark - action sheet delegte
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
		NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		// 判断是否支持相机
		if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
			switch (buttonIndex) {
				case 0:
					return;
				case 1:{ //相机
					[self takePhoto:self.callback];
				}
					break;
				case 2:{ //相册
					[self pickFromLibribry:self.callback];
				}
					break;
			}
		}
		else {
				if (buttonIndex == 0) {
						return;
				}
				else {
						sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
				}
		}
	[self.sheet removeFromSuperview];
}


RCT_EXPORT_METHOD(showImagePicker:(RCTResponseSenderBlock)cback){
	dispatch_async(dispatch_get_main_queue(), ^{
		self.callback = cback;
		self.sheet.delegate =self;
		// 判断是否支持相机
		if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
		{
			self.sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消"otherButtonTitles:@"拍照", @"从相册选", nil];
		}
		else
		{
			self.sheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选", nil];
		}
		[self.sheet showInView:[UIApplication sharedApplication].windows[0].rootViewController.view];
	});
}

RCT_EXPORT_METHOD(pickFromLibribry:(RCTResponseSenderBlock)cback){
	
	NSLog(@"callbacj = %@",self.callback);
	ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
	picker.maximumNumberOfSelection = 5;  //设置图片最多可选择数量
	picker.assetsFilter = [ALAssetsFilter allPhotos];
	picker.showEmptyGroups=NO;
	picker.delegate = self;
	picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
		if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
			NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
			return duration >= 5;
		} else {
			return YES;
		}
	}];
	
	[[UIApplication sharedApplication].windows[0].rootViewController presentViewController:picker animated:YES completion:NULL];
}

RCT_EXPORT_METHOD(takePhoto:(RCTResponseSenderBlock)cback){
	self.takePhotoCon = [[UIImagePickerController alloc]init];
	self.takePhotoCon.delegate = self;
	self.takePhotoCon.allowsEditing = YES;
	self.takePhotoCon.sourceType = UIImagePickerControllerSourceTypeCamera;
	self.takePhotoCon.videoQuality = UIImagePickerControllerQualityTypeLow ;

	[[UIApplication sharedApplication].windows[0].rootViewController presentViewController:takePhotoCon animated:YES completion:NULL];
}

#pragma mark 照片完成后，相机返回
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
	[self.takePhotoCon dismissViewControllerAnimated:YES completion:nil];
	UIImage *timage=[info objectForKey:UIImagePickerControllerEditedImage];
	NSData *data = UIImageJPEGRepresentation(timage, 0.1);
	NSString *myString1 = [data base64Encoding];
	NSMutableArray *imageArr = [[NSMutableArray alloc] init];
	[imageArr addObject:myString1];

	self.callback(@[@{@"photos":imageArr}]);
}

#pragma mark 照片完成后，图库返回
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSMutableArray *imageArr = [[NSMutableArray alloc] init];
		for (int i=0; i<assets.count; i++) {
			ALAsset *asset=assets[i];
			UIImage *img = [UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
			NSData *data = UIImageJPEGRepresentation(img, 0.1);
			NSString *myString1 = [data base64Encoding];
			[imageArr addObject:myString1];
		}
		self.callback(@[@{@"photos":imageArr}]);
	});
}


@end
