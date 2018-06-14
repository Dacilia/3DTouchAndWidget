//
//  TouchPushController.m
//  Dm3DTouchDemo
//
//  Created by 李达志 on 2018/6/14.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "TouchPushController.h"

@interface TouchPushController ()
@property (nonatomic,strong) UILabel * label;
@end

@implementation TouchPushController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
    self.view.backgroundColor=[UIColor whiteColor];
    self.label.text=[NSString stringWithFormat:@"%ld",self.row];
}

-(UILabel *)label{
    if (!_label) {
        _label=[[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 200)];
        _label.center=self.view.center;
    }
    return _label;
}
#pragma mark - 3D Touch 预览Action代理
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {

    NSMutableArray *arrItem = [NSMutableArray array];

    UIPreviewAction *previewAction0 = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {

        NSLog(@"didClickCancel");
    }];

    UIPreviewAction *previewAction1 = [UIPreviewAction actionWithTitle:@"替换该元素" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {

            //把下标为index的元素替换成preview


    }];
    UIPreviewAction *previewAction2 = [UIPreviewAction actionWithTitle:@"置顶" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
            //把下标为index的元素替换成preview
            //        [self replaceItem];

    }];
    [arrItem addObjectsFromArray:@[previewAction0 ,previewAction1,previewAction2]];

    return arrItem;
}
@end
