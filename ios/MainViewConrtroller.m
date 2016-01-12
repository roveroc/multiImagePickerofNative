//
//  MainViewConrtroller.m
//  testBridge
//
//  Created by Rover on 24/12/15.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import "MainViewConrtroller.h"

#import "KukuHttpRequst.h"



@interface MainViewConrtroller ()

@end

@implementation MainViewConrtroller
@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
  caculete *ca = [[caculete alloc] init];
  ca.delegate = self;
  [ca getTowNumberValue:1 num2:999];
  NSLog(@"hello");
  
  NSURL *jsCodeLocation;
  jsCodeLocation = [NSURL URLWithString:@"http://192.168.129.35:8090/index.ios.bundle?platform=ios&dev=true"];
  rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"testBridge"
                                               initialProperties:nil
                                                   launchOptions:nil];
  
  rootView.frame = CGRectMake(0, 0, 200, 200);
  [rootView setBackgroundColor:[UIColor redColor]];
  [self.view addSubview:rootView];
  
  
  [self performSelector:@selector(loadImg) withObject:self afterDelay:5.];

}

- (void)loadImg{
  
  
  
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  NSLog(@"接收到服务器返回的数据%@",data);
  
  
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
  NSLog(@"接收到服务器返回的数据121212");
//  [self.bridge.eventDispatcher sendDeviceEventWithName:@"AppOpenedFromNotification" body:@{@"name": @"eventName"}];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
  NSLog(@"接收到服务器返回的数据11111111111Kill Kill Kill");
  
}


- (void)fuck{
  NSString *str = @"http://img3.imgtn.bdimg.com/it/u=4088158233,2289830482&fm=21&gp=0.jpg";
  NSURL *url = [NSURL URLWithString:str];
  
  UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
  

  [imgview sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"power_off.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    
    NSLog(@"图片加载完成后做的事情");
    
  }];
  
  [self.view addSubview:imgview];
}


- (void)getSum:(int)n1 num2:(int)n2{
  NSLog(@"result mainviewController = %d",n1+n2);
}





- (IBAction)btnFun:(id)sender {
//  [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(testtest) userInfo:nil repeats:YES];
  
  [rootView.bridge.eventDispatcher sendDeviceEventWithName:@"AppOpenedFromNotification" body:@{@"name": @"12333",@"name2":@"12321322222"}];
  
}

#pragma mark - 可由OC启动线程在JS端监听，在线程中可发送消息让JS捕获
- (void)testtest{
  [rootView.bridge.eventDispatcher sendDeviceEventWithName:@"AppOpenedFromNotification" body:@{@"name": @"12333",@"name2":@"12321322222"}];  
}

@end
