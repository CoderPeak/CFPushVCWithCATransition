# CFPushVCWith-CATransition
### 利用CATransition-给push控制器添加丰富的动画效果

### 简书地址 (http://www.jianshu.com/p/15f5dd0e7604)

##### demo展示 - 由于网络原因, 可能gif效果图会展示的比较卡, 可以下载运行查看demo---简单使用代码

### 效果图集

![](/效果展示.gif) 

![](/3d立方效果.gif) 




### 把我这个项目中的UINavigationController+CATransition这个分类拖到要使用的项目中, 自此, 只要想用自定义的转场动画 做项目中的push控制器的动画 只要调用分类中的

```
// 传枚举(建议)
// push
- (void)pushViewController:(UIViewController *)viewController withCATransitionType:(CATransitionType)type subType:(CATransitionSubType)subType animated:(BOOL)animated;
// pop
- (void)popViewControllerWithCATransitionType:(CATransitionType)type subType:(CATransitionSubType)subType animated:(BOOL)animated;

// 传字符串
// push
- (void)pushViewController:(UIViewController *)viewController withCATransitionTypeString:(NSString *)typeString subTypeString:(NSString *)subTypeString animated:(BOOL)animated;
// pop
- (void)popViewControllerWithCATransitionTypeString:(NSString *)typeString subTypeString:(NSString *)subTypeString animated:(BOOL)animated;
```

### 这几个方法即可...
