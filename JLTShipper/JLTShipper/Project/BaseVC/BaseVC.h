//
//  BaseVC.h
//  JLT
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
#import "WParametersModel.h"
@interface BaseVC : UIViewController
{
    NSString *page;
    NSString *maxCount;
    
}

//导航栏基本UI+事件
@property (strong, nonatomic)  UIButton *leftButton;
@property (strong, nonatomic)  UIButton *rightButton;
-(void)touchRightBnt:(UIButton *)sender;
-(void)touchLeftBnt:(UIButton *)sender;

//AF请求
@property(strong ,nonatomic)NSMutableArray *afNetArray;//保存请求数据
-(void)cancelRequset;//取消当前请求




//基本数据
@property(assign,nonatomic)BOOL isCurrentPage;//是否当前页面



//进度条
@property (strong, nonatomic)UIActivityIndicatorView *activity;
//加载中图片
@property(strong ,nonatomic)UIImageView *loadImageV;
//没有数据的图片
@property(strong ,nonatomic)UIImageView *nodataImageV;




//键盘事件
-(void)addKeyNotification;
@property(copy,nonatomic)void(^keyCome)(void);
@property(copy,nonatomic)void(^keyHide)(void);



-(void)touchMoreShare;//分享
-(void)touchMyShare:(WParametersModel*)model
            andData:(NSArray*)data
         successful:(void (^)(void))block
            failure:(void (^)(void))noblock;

@end
