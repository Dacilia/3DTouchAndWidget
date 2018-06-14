//
//  MainTabBarController.m
//  Dm3DTouchDemo
//
//  Created by 李达志 on 2018/6/13.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "MainTabBarController.h"
#import "DmNavigationController.h"
#import "ChatController.h"
#import "FriendController.h"
#import "MineController.h"
#import "FindController.h"
@implementation MainTabBarController
-(void)viewDidLoad{
    [super viewDidLoad];

    [self initController];
    
}
-(void)initController{
    ChatController*chatVc=[[ChatController alloc]init];


    DmNavigationController*chatNav=[[DmNavigationController alloc]initWithRootViewController:chatVc];
    chatNav.tabBarItem.title=@"泡聊";
    FriendController*friendVc=[[FriendController alloc]init];
    DmNavigationController*friendNav=[[DmNavigationController alloc]initWithRootViewController:friendVc];
    friendNav.tabBarItem.title=@"泡友";
    FindController*fineVc=[[FindController alloc]init];
    DmNavigationController*findNav=[[DmNavigationController alloc]initWithRootViewController:fineVc];
    findNav.tabBarItem.title=@"发现";
    MineController*mineVc=[[MineController alloc]init];
    DmNavigationController*mineNav=[[DmNavigationController alloc]initWithRootViewController:mineVc];
    mineNav.tabBarItem.title=@"我的";
    self.viewControllers=@[chatNav,friendNav,findNav,mineNav];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor purpleColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];

        // 选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:17]} forState:UIControlStateSelected];
}
@end
