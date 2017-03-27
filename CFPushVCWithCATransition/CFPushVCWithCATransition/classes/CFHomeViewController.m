//
//  CFHomeViewController.m
//  CFPushVCTransition
//
//  Created by Peak on 17/3/24.
//  Copyright © 2017年 Peak. All rights reserved.
//

#import "CFHomeViewController.h"
#import "CFPushedViewController.h"
#import "UINavigationController+CATransition.h"


#define kViewTagOffset 999


@interface CFHomeViewController ()

@property (nonatomic, strong) NSArray *leftBtnTitleArr;

@property (nonatomic, strong) NSArray *rightBtnTitleArr;

@property (nonatomic, strong) NSArray *leftPushTypeArr;
@property (nonatomic, strong) NSArray *rightPushTypeArr;

@property (nonatomic, strong) NSArray *pushSubTypeArr;

/*  */
@property (nonatomic, assign) NSInteger direction;

@end



@implementation CFHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
   
    UIImageView *bgImgV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImgV.image = [UIImage imageNamed:@"home"];
    [self.view addSubview:bgImgV];
    
    self.leftBtnTitleArr = @[
                             @"淡化效果--push",
                             @"覆盖效果--push",
                             @"Push效果--push",
                             @"揭开效果--push",
                             
                             @"3D立方效果--push",
                             @"吮吸效果--push",
                             @"翻转效果--push",
                             @"波纹效果--push",
                             
                             ];
    
    self.rightBtnTitleArr = @[
                             @"翻页效果--push",
                             @"反翻页效果--push",
                             @"开镜头效果--push",
                             @"关镜头效果--push",
                             
                             ];
    
    self.leftPushTypeArr = @[
                        @(CATransitionTypeFade),
                        @(CATransitionTypeMoveIn),
                        @(CATransitionTypePush),
                        @(CATransitionTypeReveal),
                        
                        @(CATransitionTypeCube),
                        @(CATransitionTypeSuckEffect),
                        @(CATransitionTypeOglFlip),
                        @(CATransitionTypeRippleEffect)
                        ];
    
    self.rightPushTypeArr = @[
                              @(CATransitionTypePageCurl),
                              @(CATransitionTypePageUnCurl),
                              @(CATransitionTypeCameraIrisHollowOpen),
                              @(CATransitionTypeCameraIrisHollowClose),
                             ];
    
    
    self.pushSubTypeArr = @[
                           @(CATransitionSubTypeFromRight),
                           @(CATransitionSubTypeFromLeft),
                           @(CATransitionSubTypeFromTop),
                           @(CATransitionSubTypeFromBottom),
                          
                           ];
    
    // 左列
    CGFloat leftBtnX = 30;
    CGFloat leftBtnY = 0;
    CGFloat leftBtnW = 120;
    CGFloat leftBtnH = 30;
    
    for (NSInteger i=0; i<self.leftBtnTitleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor colorWithRed:51.0/255 green:204.0/255 blue:255.0/255 alpha:0.8];
        btn.tag = i+kViewTagOffset;
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        leftBtnY = 64 + 40*(i+1);
        btn.frame = CGRectMake(leftBtnX, leftBtnY, leftBtnW, leftBtnH);
        [btn setTitle:self.leftBtnTitleArr[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    // 右列
    CGFloat rightBtnX = [UIScreen mainScreen].bounds.size.width-30-120;
    CGFloat rightBtnY = 0;
    CGFloat rightBtnW = 120;
    CGFloat rightBtnH = 30;
    for (NSInteger i=0; i<self.rightBtnTitleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor colorWithRed:51.0/255 green:204.0/255 blue:255.0/255 alpha:0.8];
        btn.tag = i+kViewTagOffset+kViewTagOffset;
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        rightBtnY = 64 + 40*(i+1);
        btn.frame = CGRectMake(rightBtnX, rightBtnY, rightBtnW, rightBtnH);
        [btn setTitle:self.rightBtnTitleArr[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    
}

- (void)btnClick:(UIButton *)btn
{
    CFPushedViewController *vc = [CFPushedViewController new];
   
   
    NSInteger tag = 0;
    CATransitionType type;
    // 右列
    if (btn.tag-kViewTagOffset-kViewTagOffset>=0) {
        tag = btn.tag-kViewTagOffset-kViewTagOffset;
        type = [self.rightPushTypeArr[tag] intValue];
    } else {
        // 左列
        tag = btn.tag-kViewTagOffset;
        type = [self.leftPushTypeArr[tag] intValue];
    }
    

    
    self.direction++;
    if (self.direction>3) {
        self.direction = 0;
    }
    
    CATransitionSubType subType = [self.pushSubTypeArr[self.direction] intValue];
    
    vc.transitionType = type;
    vc.transitionTypeSubType = subType;
    
    // 建议animated 传no 使用自己的转场动画 而非系统的动画
    [self.navigationController pushViewController:vc withCATransitionType:type subType:subType animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
