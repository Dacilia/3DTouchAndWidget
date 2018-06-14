//
//  TodayViewController.m
//  Dm3DTouchExtension
//
//  Created by 李达志 on 2018/6/14.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <Masonry.h>
@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
    NSArray * array=@[@"扫一扫",@"分享",@"付款",@"收款"];
    for (int i=0; i<4; i++) {
        UIButton * scanButton=[[UIButton alloc]initWithFrame:CGRectMake(i*([UIScreen mainScreen].bounds.size.width/4), 0, [UIScreen mainScreen].bounds.size.width/4, 100)];
        [scanButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [scanButton setTitle:array[i] forState:UIControlStateNormal];
        [scanButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        scanButton.tag=i;
        [self.view addSubview:scanButton];
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (@available(iOS 10.0, *)) {//设置按钮状态的蚊子是展开
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    }

}
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize  API_AVAILABLE(ios(10.0)){
    if (@available(iOS 10.0, *)) {
        if (activeDisplayMode == NCWidgetDisplayModeCompact) { self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);

        }
        else {
            self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 500); }
    }

}



-(void)buttonAction:(UIButton*)button{
    NSString * usrlSchem=nil;
    switch (button.tag) {
        case 0:
            usrlSchem=@"TouchDemo://action=GotoScane";
            break;
        case 1:
             usrlSchem=@"TouchDemo://action=GotoShare";
            break;
        case 2:
             usrlSchem=@"TouchDemo://action=GotoPay";
            break;
        default:
             usrlSchem=@"TouchDemo://action=GotoMoney";
            break;
    }
    [self.extensionContext openURL:[NSURL URLWithString:usrlSchem] completionHandler:nil];

}


- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {


    completionHandler(NCUpdateResultNewData);
}

@end
