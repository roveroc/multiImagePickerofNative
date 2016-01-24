//
//  ImagePickerNativeMoudule_ios.m
//  testBridge
//
//  Created by Rover on 24/1/16.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "ImagePickerNativeMoudule_ios.h"
#import "UIImage+XG.h"


@implementation ImagePickerNativeMoudule_ios


RCT_EXPORT_MODULE()     //必须导入Native的该宏，想当于声明这个类要实现自定义模块的功能

#pragma mark - 该方法想当于重写
- (UIView *)view{
	UIActionSheet *sheet;
	sheet.delegate =self;
	
	// 判断是否支持相机
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
		sheet  = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消"otherButtonTitles:@"拍照", @"从相册选", nil];
	}
	else {
		sheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选", nil];
	}
	[sheet showInView:self.view];
	return sheet;
}


RCT_EXPORT_METHOD(showImagePicker:(RCTResponseSenderBlock)cback){
	callback = cback;
	ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
	picker.maximumNumberOfSelection = 10;
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

#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSMutableArray *imageArr = [[NSMutableArray alloc] init];
		for (int i=0; i<assets.count; i++) {
			ALAsset *asset=assets[i];
			UIImage *img = [UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
			
			UIImage *tempImg = [img imageByScalingAndCroppingForSize:CGSizeMake(500, 500)];
			
			NSData *data = UIImageJPEGRepresentation(tempImg, 0.1);
			NSString *myString1 = [data base64Encoding];
			NSLog(@"myString1 = %@",myString1);
			[imageArr addObject:tempImg];
		}
		callback(@[@{@"photos":imageArr}]);
	});
}


@end
