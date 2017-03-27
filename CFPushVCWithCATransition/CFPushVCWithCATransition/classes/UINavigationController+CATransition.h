//
//  UINavigationController+CATransition.h
//  CFPushVCTransition
//
//  Created by Peak on 17/3/24.
//  Copyright © 2017年 Peak. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CATransitionType) {
    CATransitionTypeFade = 1,      // 淡化
    CATransitionTypeMoveIn,        // 覆盖
    CATransitionTypePush,          // push
    CATransitionTypeReveal,         // 揭开
    
    CATransitionTypeCube,         // 3D立方
    CATransitionTypeSuckEffect,   // 吮吸
    CATransitionTypeOglFlip,      // 翻转
    CATransitionTypeRippleEffect,  // 波纹
    
    CATransitionTypePageCurl,      // 翻页
    CATransitionTypePageUnCurl,        // 反翻页
    CATransitionTypeCameraIrisHollowOpen,      // 开镜头
    CATransitionTypeCameraIrisHollowClose,     //  关镜头
    
    
    
};

typedef NS_ENUM(NSInteger, CATransitionSubType) {
    
    CATransitionSubTypeFromRight = 1,
    CATransitionSubTypeFromLeft,
    CATransitionSubTypeFromTop,
    CATransitionSubTypeFromBottom
};


@interface UINavigationController (CATransition)

// 传枚举
// push
- (void)pushViewController:(UIViewController *)viewController withCATransitionType:(CATransitionType)type subType:(CATransitionSubType)subType animated:(BOOL)animated;
// pop
- (void)popViewControllerWithCATransitionType:(CATransitionType)type subType:(CATransitionSubType)subType animated:(BOOL)animated;


// 传字符串
// push
- (void)pushViewController:(UIViewController *)viewController withCATransitionTypeString:(NSString *)typeString subTypeString:(NSString *)subTypeString animated:(BOOL)animated;
// pop
- (void)popViewControllerWithCATransitionTypeString:(NSString *)typeString subTypeString:(NSString *)subTypeString animated:(BOOL)animated;



@end
