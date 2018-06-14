//
//  AppDelegate.m
//  Dm3DTouchDemo
//
//  Created by 李达志 on 2018/6/13.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "ChatController.h"
#import "AppDelegate+Extension.h"
#import "ScanViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication].delegate.window.rootViewController=[[MainTabBarController alloc]init];
    [self initShortcutItems];
    sleep(2);
    return YES;
}
//代码方式创建
- (void)initShortcutItems {

    //这个会持续化保存的 除非你手动清空 或者是重装APP
//    if ([UIApplication sharedApplication].shortcutItems.count >= 5)
//        return;
    [UIApplication sharedApplication].shortcutItems=nil;
    NSMutableArray *arrShortcutItem = (NSMutableArray *)[UIApplication sharedApplication].shortcutItems;


    UIApplicationShortcutItem *shoreItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"selectfriend" localizedTitle:@"选中泡友" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove] userInfo:nil];
    [arrShortcutItem addObject:shoreItem1];

    UIApplicationShortcutItem *shoreItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"selectScan" localizedTitle:@"扫一扫" localizedSubtitle:@"" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose] userInfo:nil];
    [arrShortcutItem addObject:shoreItem2];
    UIApplicationShortcutItem *shoreItem3 = [[UIApplicationShortcutItem alloc] initWithType:@"selectmine" localizedTitle:@"选中我的" localizedSubtitle:@"" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose] userInfo:nil];
    [arrShortcutItem addObject:shoreItem3];
    UIApplicationShortcutItem *shoreItem4 = [[UIApplicationShortcutItem alloc] initWithType:@"selectfind" localizedTitle:@"选中发现" localizedSubtitle:@"" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose] userInfo:nil];
    [arrShortcutItem addObject:shoreItem4];

    [UIApplication sharedApplication].shortcutItems = arrShortcutItem;

}
//3Dtouch 触发的方法
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {

        //这里可以获的shortcutItem对象的唯一标识符
        //不管APP在后台还是进程被杀死，只要通过主屏快捷操作进来的，都会调用这个方法
    MainTabBarController*vc=(MainTabBarController*)self.window.rootViewController;
    if ([shortcutItem.type isEqualToString:@"selectmine"]) {
        vc.selectedIndex=3;
    }
    if ([shortcutItem.type isEqualToString:@"selectScan"]) {
        [[AppDelegate shared]pushViewController:[ScanViewController new] animated:YES];
    }
    NSLog(@"name:%@\ntype:%@", shortcutItem.localizedTitle, shortcutItem.type);

}
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
//    switch (button.tag) {
//        case 0:
//            usrlSchem=@"TouchDemo://action=GotoScane";
//            break;
//        case 1:
//            usrlSchem=@"TouchDemo://action=GotoShare";
//            break;
//        case 2:
//            usrlSchem=@"TouchDemo://action=GotoPay";
//            break;
//        default:
//            usrlSchem=@"TouchDemo://action=GotoMoney";
//            break;
//    }
    NSString* prefix = @"TouchDemo://";
    if ([[url absoluteString] rangeOfString:prefix].location != NSNotFound) {
        NSString* action = [[url absoluteString] substringFromIndex:prefix.length];
        NSLog(@"%@",action);
        NSString*title;
        ScanViewController*vc=[ScanViewController new];
        if ([action containsString:@"GotoScane"]) {
            title=@"扫一扫";

        }

        else if([action containsString:@"GotoShare"]) {
            title=@"分享";
        }
        else if([action containsString:@"GotoPay"]) {
            title=@"付款";
        } else if([action containsString:@"GotoMoney"]) {
            title=@"收款";
        }
        vc.navtitle=title;
        [[AppDelegate shared]pushViewController:vc animated:YES];

    }
    return YES;
}


@end
