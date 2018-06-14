//
//  AppDelegate+ESExtension.m
//  EasyShop
//
//  Created by 脉融iOS开发 on 16/4/20.
//  Copyright © 2016年 wcz. All rights reserved.
//

#import "AppDelegate+Extension.h"

@implementation AppDelegate (Extension)

+(AppDelegate *)shared{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void(^)(void))completion{
    [self.topVC presentViewController:viewController animated:YES completion:completion];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self.curNav isKindOfClass:[UINavigationController class]]) {
        [self.curNav pushViewController:viewController animated:YES];
    }
}

- (void)popToRootViewControllerAnimated:(BOOL)animated{
    if ([self.curNav isKindOfClass:[UINavigationController class]]) {
        [self.curNav popToRootViewControllerAnimated:NO];
    }
}

-(UIViewController *)topVC{
    if ([self.curNav isKindOfClass:[UINavigationController class]]) {
        return self.curNav.topViewController;
    }
    return nil;
}

-(UINavigationController *)curNav{
    return [self recursiveViewController:self.window.rootViewController];
}

- (UINavigationController *)recursiveViewController:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self recursiveViewController:[(UINavigationController *)vc visibleViewController]];
    }
    if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self recursiveViewController:[(UITabBarController *)vc selectedViewController]];
    }
    if (vc.presentedViewController) {
        return [self recursiveViewController:vc.presentedViewController];
    }
    if ([vc isKindOfClass:[UISearchController class]]) {
        UIViewController *presentingViewController = vc.presentingViewController;
        if ([presentingViewController isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)presentingViewController;
        } else {
            return presentingViewController.navigationController;
        }
    }
    return vc.navigationController;
}

@end
