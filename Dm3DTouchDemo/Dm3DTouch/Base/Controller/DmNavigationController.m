//
//  DmNavigationController.m
//  Dm3DTouchDemo
//
//  Created by 李达志 on 2018/6/13.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "DmNavigationController.h"

@interface DmNavigationController ()

@end

@implementation DmNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
        //    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed=YES;
    }

    [super pushViewController:viewController animated:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
