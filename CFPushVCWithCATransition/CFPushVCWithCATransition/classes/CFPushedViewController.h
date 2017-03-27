//
//  CFPushedViewController.h
//  CFPushVCTransition
//
//  Created by Peak on 17/3/24.
//  Copyright © 2017年 Peak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+CATransition.h"

@interface CFPushedViewController : UIViewController

@property (nonatomic, assign) CATransitionType transitionType;

@property (nonatomic, assign) CATransitionSubType transitionTypeSubType;

@end
