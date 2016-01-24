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
			UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
			NSData *data = UIImageJPEGRepresentation(tempImg, 0.1);
			NSString *myString1 = [data base64Encoding];
			NSLog(@"myString1 = %@",myString1);
			[imageArr addObject:tempImg];
		}
		callback(@[@{@"photos":imageArr}]);
	});
}


@end
