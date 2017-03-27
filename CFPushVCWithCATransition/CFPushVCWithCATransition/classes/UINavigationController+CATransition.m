//
//  UINavigationController+CATransition.m
//  CFPushVCTransition
//
//  Created by Peak on 17/3/24.
//  Copyright © 2017年 Peak. All rights reserved.
//

#import "UINavigationController+CATransition.h"
#import <objc/runtime.h>

#define kTransitionDuration 0.8

NSString *getCATransitionTypeStringWithCATransitionType(CATransitionType type) {
    switch (type) {
        case CATransitionTypeFade:
            return kCATransitionFade;  // 淡化
            break;
        case CATransitionTypeMoveIn:
            return kCATransitionMoveIn;  // 覆盖
            break;
        case CATransitionTypePush:
            return kCATransitionPush;  // push
            break;
        case CATransitionTypeReveal:
            return kCATransitionReveal;   // 揭开
            break;
        case CATransitionTypeCube:
            return @"cube";         // 3D立方
            break;
        case CATransitionTypeSuckEffect:
            return @"suckEffect";  // 吮吸
            break;
        case CATransitionTypeOglFlip:
            return @"oglFlip";  // 翻转
            break;
        case CATransitionTypeRippleEffect:
            return @"rippleEffect";   // 波纹
            break;
        case CATransitionTypePageCurl:
            return @"pageCurl";  // 翻页
            break;
        case CATransitionTypePageUnCurl:
            return @"pageUnCurl";  // 反翻页
            break;
        case CATransitionTypeCameraIrisHollowOpen:
            return @"cameraIrisHollowOpen";  // 开镜头
            break;
        case CATransitionTypeCameraIrisHollowClose:
            return @"cameraIrisHollowClose";   // 关镜头
            break;
     default:
            return @"";
            break;
    }
}




NSString *getCATransitionSubType(CATransitionSubType subType) {
    switch (subType) {
        case CATransitionSubTypeFromRight:
            return kCATransitionFromRight;
            break;
        case CATransitionSubTypeFromLeft:
            return kCATransitionFromLeft;
            break;
        case CATransitionSubTypeFromTop:
            return kCATransitionFromTop;
            break;
        case CATransitionSubTypeFromBottom:
            return kCATransitionFromBottom;
            break;
            
        default:
            return @"";
            break;
    }
}

@implementation UINavigationController (CATransition)


- (void)pushViewController:(UIViewController *)viewController withCATransitionTypeString:(NSString *)typeString subTypeString:(NSString *)subTypeString animated:(BOOL)animated
{
    CATransition *transition = [CATransition animation];
    transition.duration = kTransitionDuration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = typeString;
    transition.subtype = subTypeString;
    
    [self.view.layer addAnimation:transition forKey:@"animation"];

    [self pushViewController:viewController animated:animated];
    
}

- (void)popViewControllerWithCATransitionTypeString:(NSString *)typeString subTypeString:(NSString *)subTypeString animated:(BOOL)animated
{
    CATransition *transition = [CATransition animation];
    transition.duration = kTransitionDuration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = typeString;
    transition.subtype = subTypeString;
    
    [self.view.layer addAnimation:transition forKey:@"animation"];
    
    
    [self popViewControllerAnimated:animated];
}


- (void)pushViewController:(UIViewController *)viewController withCATransitionType:(CATransitionType)type subType:(CATransitionSubType)subType animated:(BOOL)animated
{
    NSString *typeString = getCATransitionTypeStringWithCATransitionType(type);
    NSString *subTypeString = getCATransitionSubType(subType);
    
    [self pushViewController:viewController withCATransitionTypeString:typeString subTypeString:subTypeString animated:animated];
}


- (void)popViewControllerWithCATransitionType:(CATransitionType)type subType:(CATransitionSubType)subType animated:(BOOL)animated
{
    NSString *typeString = getCATransitionTypeStringWithCATransitionType(type);
    NSString *subTypeString = getCATransitionSubType(subType);
    
    [self popViewControllerWithCATransitionTypeString:typeString subTypeString:subTypeString animated:animated];
}

@end
