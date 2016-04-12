//
//  RootTabBarVC.m
//  JLT
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import "RootTabBarVC.h"
#import "UIImage+Color.h"
#import "BaseVC.h"
#import "LocaData.h"
#import "HomeVC.h"
@interface RootTabBarVC ()<UITabBarControllerDelegate>

@end
#pragma -mark- =====================系统样式=====================
#define NOSelectTheColor  RGB(140,147,155,1)
#define SelectTheColor RGB(60, 190, 188, 1)
#pragma -mark- =====================默认=====================
@implementation RootTabBarVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //系统设定
    [self makeTabInitializationSystem];
    //设置承载页面
    [self setAllViewController];
    [self.childViewControllers enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL *stop) {
        switch (idx) {
            case 0:{
                obj.tabBarItem.title=@"首页";
                obj.tabBarItem.image =QuickOriginalImage(@"tab_index_grey");
                obj.tabBarItem.selectedImage = QuickOriginalImage(@"tab_index_green");
                
            }
                break;
            case 1:{
                obj.tabBarItem.title=@"消息";
                obj.tabBarItem.image =QuickOriginalImage(@"tab_msg_grey");
                obj.tabBarItem.selectedImage = QuickOriginalImage(@"tab_msg_green");
            }
                
                break;
            case 2:{
                obj.tabBarItem.title=@"我的";
                obj.tabBarItem.image = QuickOriginalImage(@"tab_mine_grey");
                obj.tabBarItem.selectedImage =QuickOriginalImage(@"tab_mine_green");
            }
                
                break;
                
            default:
                break;
        }
    }];
    
//    UIImage *image=QuickOriginalImage(@"shouye_sel");
//    
//    UIView *homeView=[[UIView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-[UIScreen mainScreen].bounds.size.width/3)/2, -20,[UIScreen mainScreen].bounds.size.width/3, 72)];
//    
//    self.homeImageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/3, image.size.height)];
//    self.homeImageV.image=image;
//    self.homeImageV.contentMode=UIViewContentModeCenter;
//    
//    [homeView addSubview:self.homeImageV];
//    
//    self.homeLab=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.homeImageV.frame)+2, [UIScreen mainScreen].bounds.size.width/3, 13)];
//    self.homeLab.text=@"首页";
//    self.homeLab.font=QuickFont(11);
//    self.homeLab.textColor=SelectTheColor;
//    self.homeLab.backgroundColor=[UIColor clearColor];
//    self.homeLab.textAlignment = NSTextAlignmentCenter;
//    
//    [homeView addSubview:self.homeLab];
//    
//    
//    self.homeBnt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(homeView.frame), CGRectGetHeight(homeView.frame))];
//    
//    [self.homeBnt addTarget:self action:@selector(selectImagePicker:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [homeView addSubview:self.homeBnt];
//    [homeView bringSubviewToFront:self.homeBnt];
//    
//    
//    [self.tabBar addSubview:homeView];
//    [self.tabBar bringSubviewToFront:homeView];
    
    self.sselectedIndex=0;
//    self.homeBnt.selected=YES;
}
- (void)selectImagePicker:(UIButton *)button{
    if (!button.selected) {
        self.sselectedIndex=1;
        button.selected=YES;
    }
    
}

-(void)makeTabInitializationSystem{
    
    
    //tabBar字体的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : NOSelectTheColor,
                                                        NSFontAttributeName:QuickFont(11)}
                                             forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName :SelectTheColor,
                                                        NSFontAttributeName:QuickFont(11)}
                                             forState:UIControlStateSelected];
    
    //tabar背景
    UIImage *bgImg = [UIImage imageNamed:@"tab_bg"];
    UIColor *color = [[UIColor alloc] initWithPatternImage:bgImg];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UITabBar appearance]setBackgroundImage:bgImg];
    
    
    //tabar图片的选中颜色
    [[UITabBar appearance] setTintColor:SelectTheColor];
    
    
    self.tabBar.barTintColor = color;
    
    [self.tabBar  setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    self.tabBar.backgroundImage =bgImg;//去除黑线
    
}
#pragma -mark 设置控制器
-(void)setAllViewController{
    
    //--------------------第1页--------------------
    
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    HomeVC * home = [sb instantiateViewControllerWithIdentifier:@"HomeVC"];
    HomeVC *home =[[HomeVC alloc] init];

    self.oneNav=[[UINavigationController alloc]initWithRootViewController:home];
    //one.navigationController.navigationBarHidden=YES;
    //系统自带返回
    home.navigationController.interactivePopGestureRecognizer.delegate = nil;
    
    
    
    
    //--------------------第2页--------------------
//    BaseVC *two=[[BaseVC alloc]initWithNibName:@"Root2ViewController" bundle:nil];
    BaseVC * two = [[BaseVC alloc]init];
    self.twoNav=[[UINavigationController alloc]initWithRootViewController:two];
    //系统自带返回
    two.navigationController.interactivePopGestureRecognizer.delegate = nil;
    
    //--------------------第3页--------------------
    
//    BaseVC *three=[[BaseVC alloc]initWithNibName:@"Root3ViewController" bundle:nil];
    BaseVC * three = [[BaseVC alloc]init];
    self.threeNav=[[UINavigationController alloc]initWithRootViewController:three];
    //系统自带返回
    three.navigationController.interactivePopGestureRecognizer.delegate = nil;
    
    
    
    
    
    NSArray*arry  =@[self.oneNav,self.twoNav,self.threeNav];
    [self setViewControllers:arry animated:NO];
    
    
    self.delegate=self;
    
    
}

//#pragma -mark- =====================点击协议=====================
//-(void)setSselectedIndex:(NSUInteger)sselectedIndex{
//    self.selectedIndex=sselectedIndex;
//    self.tabBar.hidden=NO;
//    
//    if (sselectedIndex==1) {
//        self.homeBnt.selected=YES;
//        self.homeLab.textColor=SelectTheColor;
//        self.homeImageV.image=QuickOriginalImage(@"shouye_sel");
//    }else{
//        self.homeBnt.selected=NO;
//        self.homeLab.textColor=NOSelectTheColor;
//        self.homeImageV.image=QuickOriginalImage(@"shouye");
//    }
//}
//- (BOOL)tabBarController:(UITabBarController *)tbc shouldSelectViewController:(UIViewController *)vc {
//    UIViewController *tbSelectedController = tbc.selectedViewController;
//    if (![LocaData shard].isLogIn) {
//        
//        //重复点击
//        if (vc==self.oneNav||vc==self.threeNav) {
//            
//            
//            [self puchLogin];
//            
//            return NO;
//        }
//        
//        self.homeBnt.selected=NO;
//        self.homeLab.textColor=NOSelectTheColor;
//        self.homeImageV.image=QuickOriginalImage(@"shouye");
//        
//        return YES;
//        
//        
//    }else{
//        
//        
//        if ([tbSelectedController isEqual:vc]) {
//            //重复点击
//            CLog(@"%@",[tbSelectedController class]);
//            return NO;
//        }
//        self.homeBnt.selected=NO;
//        self.homeLab.textColor=NOSelectTheColor;
//        self.homeImageV.image=QuickOriginalImage(@"shouye");
//        
//        return YES;
//        
//    }
//    
//    
//}
//-(void)puchLogin{
////    LoginViewController *login=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
////    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:login];
////    [self presentViewController:nav animated:YES completion:nil];
//}



@end
