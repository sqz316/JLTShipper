//
//  LocaData.h
//  NewWorld
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocaData : NSObject
+ (LocaData *)shard;
-(void)defaultSettings;
-(void)upBlock:(void (^)(void))upBlock
   normalBlock:(void (^)(void))normalBlock;

@property (nonatomic) BOOL isRemberPassWord;//是否记住密码
@property (nonatomic) BOOL isLogIn;//用户是否登录
@property (nonatomic) BOOL isRefreshData;//是否刷新数据

@property (nonatomic) BOOL needPicture2G3G;//23G是否显示照片
@property (nonatomic,copy) NSString *systemVersion;//系统版本

@property (nonatomic,copy) NSString *loginName;//登录名
@property (nonatomic,copy) NSString *loginPassWord;//登录密码
@property (nonatomic,copy) NSString *userToken;//用户Token标识
@property (nonatomic,copy) NSString *userImageUrl; //用户头像地址
@property (nonatomic,copy) NSString *userMoblie; //用户Moblie
@property (nonatomic,copy) NSString *userEmail; //用户Email
@property (nonatomic,copy) NSString *userID; //用户ID
@property (nonatomic,copy) NSString *userName; //用户名字
@property (nonatomic,copy) NSString *userNicknameName; //用户名字
@property (nonatomic,copy) NSString *userRellyName; //用户zhen名字
@property (nonatomic,copy) NSString *userCity; //用户城市

@property (nonatomic,copy) NSString *totalMoney; //总金额
@property (nonatomic,copy) NSString *availableFunds; //用户可以用余额
@property (nonatomic,copy) NSString *interest; //用户累计收益

@property (nonatomic,copy) NSString *latitude; //经纬度
@property (nonatomic,copy) NSString *longitude; //经纬度

@property (nonatomic,copy) NSString *qqToke;//
@property (nonatomic,copy) NSString *weixinToken;//
@property (nonatomic,copy) NSString *weiboToken;//
@property (nonatomic,copy) NSString *cer_picZ;//正面
@property (nonatomic,copy) NSString *cer_picF;//反面
@property (nonatomic,copy) NSString *certification;//实名认证   0未填写 1认证中 2已认证
@property (nonatomic,copy) NSString *cellphone_audit;//手机认证   0未认证 1认证中 2已认证
@property (nonatomic,copy) NSString *bank_audit;//银行卡绑定 0未填写 1绑定中 2已绑定
@property (nonatomic,copy) NSString *bankAccount;//银行卡号
@property (nonatomic,copy) NSString *invitcode;//邀请码
@property (nonatomic,copy) NSString *shouShiPaw;

@property (nonatomic,copy) NSString *currentRegion; //定位地区
@property (nonatomic,copy) NSArray *searchHisArray; //用户本地保存题目
@property (nonatomic,copy) NSString *signature; //登录签名


@end
