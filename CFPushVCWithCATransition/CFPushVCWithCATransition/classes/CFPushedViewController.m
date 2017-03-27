//
//  CFPushedViewController.m
//  CFPushVCTransition
//
//  Created by Peak on 17/3/24.
//  Copyright © 2017年 Peak. All rights reserved.
//

#import "CFPushedViewController.h"
#import "UINavigationController+CATransition.h"

@interface CFPushedViewController ()

@end

@implementation CFPushedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"被push的控制器";
    
    UIImageView *bgImgV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImgV.image = [UIImage imageNamed:@"pushed"];
    [self.view addSubview:bgImgV];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
}

- (void)back
{

    [self.navigationController popViewControllerWithCATransitionType:self.transitionType subType:self.transitionTypeSubType animated:NO];
    
//    [self.navigationController popViewControllerAnimated:YES];
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
