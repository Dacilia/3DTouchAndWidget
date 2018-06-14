//
//  MineController.m
//  Dm3DTouchDemo
//
//  Created by 李达志 on 2018/6/13.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "MineController.h"
#import "TouchPushController.h"
@interface MineController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title=@"我的";
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.tableView];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;

    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * const KID=@"KID";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:KID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KID];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
        //注册3D Touch
        //只有在6s及其以上的设备才支持3D Touch,我们可以通过UITraitCollection这个类的UITraitEnvironment协议属性来判断
    /**
     UITraitCollection是UIViewController所遵守的其中一个协议，不仅包含了UI界面环境特征，而且包含了3D Touch的特征描述。
     从iOS9开始，我们可以通过这个类来判断运行程序对应的设备是否支持3D Touch功能。
     UIForceTouchCapabilityUnknown = 0,     //未知
     UIForceTouchCapabilityUnavailable = 1, //不可用
     UIForceTouchCapabilityAvailable = 2    //可用
     */
    if ([self respondsToSelector:@selector(traitCollection)]) {

        if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)]) {

            if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {

                [self registerForPreviewingWithDelegate:(id)self sourceView:cell];

            }
        }
    }
    return cell;
}
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0) {

    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)[previewingContext sourceView]];

        //创建要预览的控制器
    TouchPushController *presentationVC = [[TouchPushController alloc] init];
    presentationVC.row=indexPath.row;
        //指定当前上下文视图Rect
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    previewingContext.sourceRect = rect;

    return presentationVC;
}
#pragma mark pop(push)
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0) {

    [self showViewController:viewControllerToCommit sender:self];
}
@end
