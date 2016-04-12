//
//  LocaData.m
//  NewWorld
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import "LocaData.h"
#import "Methods.h"
@interface LocaData()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@implementation LocaData
static LocaData *localData=nil;

static NSString *IsRemberPassWord = @"IsRemberPassWord";
static NSString *IsLogIn = @"IsLogIn";
static NSString *OpenShop = @"OpenShop";
static NSString *IsRefreshData = @"isRefreshData";
static NSString *SystemVersion = @"SystemVersion";
static NSString *LoginName = @"LoginName";
static NSString *LoginPassWord = @"LoginPassWord";
static NSString *NeedPicture2G3G = @"NeedPicture2G3G";
static NSString *UserToken = @"UserToken";
static NSString *UserImageUrl = @"UserImageUrl";
static NSString *UserMoblie = @"UserMoblie";
static NSString *UserID = @"UserID";
static NSString *UserName = @"UserName";
static NSString *UserNicknameName = @"UserNicknameName";
static NSString *UserRellyName = @"UserRellyName";
static NSString *UserCity = @"UserCity";
static NSString *UserEmail = @"UserEmail";
static NSString *SearchHisArray = @"SearchHisArray";
static NSString *ShouShiPaw = @"shouShiPaw";
static NSString *Certification = @"Certification";
static NSString *CerpicZ = @"CerpicZ";
static NSString *CerpicF = @"CerpicF";
static NSString *CellphoneAudit = @"CellphoneAudit";
static NSString *Signature = @"Signature";

static NSString *Latitude = @"Latitude";
static NSString *Longitude = @"Longitude";
static NSString *CurrentRegion = @"CurrentRegion";
static NSString *QQToke = @"QQToke";
static NSString *WeiXinToken = @"WeiXinToken";
static NSString *WeiBoToken = @"WeiBoToken";

static NSString *BankAudit = @"BankAudit";
static NSString *BankAccount = @"BankAccount";
static NSString *Invitcode = @"Invitcode";

static NSString *TotalMoney = @"totalMoney";
static NSString *AvailableFunds = @"availableFunds";
static NSString *Interest = @"interest";
#pragma -mark ------------------------初始化------------------------
+ (LocaData *)shard
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        
        localData = [[self alloc] init];
        
    });
    return localData;
}
-(id)init
{
    if (self = [super init])
    {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
        
              
    }
    return self;
}
#pragma -mark 安全设置 不等于null
-(NSString*)safeForKey:(NSString*)key{
    
    if ([self.userDefaults stringForKey:key]){
        
        return [self.userDefaults stringForKey:key];
    }
    
    return @"";
}
#pragma -mark- =============默认设置=============
-(void)defaultSettings{
    //用户未登录
    [[LocaData shard] setIsLogIn:NO];
    [[LocaData shard] setIsRefreshData:NO];
}
-(void)upBlock:(void (^)(void))upBlock
   normalBlock:(void (^)(void))normalBlock{
    
    //升级
    if (![[LocaData shard].systemVersion isEqualToString:[Methods programInformation:@"CFBundleShortVersionString"]] )
    {
        //纪录版本
        [[LocaData shard] setSystemVersion:[Methods programInformation:@"CFBundleShortVersionString"]];
        [self defaultSettings];
        CLog(@"");
        CLog(@"==============程序安装升级===============");
        CLog(@"");
        CLog(@"版本号:%@",[LocaData shard].systemVersion);
        CLog(@"");
        CLog(@"=======================================");
        CLog(@"");
        
        if (upBlock) {
            upBlock();
        }
    }else{
        if (normalBlock) {
            normalBlock();
        }
    }
    
}
#pragma -mark =======================================
#pragma -mark 是否记住密码
- (BOOL)isRemberPassWord
{
    return [self.userDefaults boolForKey:IsRemberPassWord];
}

- (void)setIsRemberPassWord:(BOOL)isRemberPassWord
{
    [self.userDefaults setBool:isRemberPassWord forKey:IsRemberPassWord];
    [self.userDefaults synchronize];
}

#pragma -mark 用户是否登入
-(BOOL )isLogIn
{
    return [self.userDefaults boolForKey:IsLogIn];
}
-(void)setIsLogIn:(BOOL)isLogIn
{
    [self.userDefaults setBool:isLogIn forKey:IsLogIn];
    [self.userDefaults synchronize];
}
#pragma -mark 用户用户是否已经开过店
-(BOOL )isRefreshData
{
    return [self.userDefaults boolForKey:IsRefreshData];
}
-(void)setIsRefreshData:(BOOL)isRefreshData
{
    [self.userDefaults setBool:isRefreshData forKey:IsRefreshData];
    [self.userDefaults synchronize];
}


#pragma -mark needPicture2G3G
-(BOOL )needPicture2G3G
{
    return [self.userDefaults boolForKey:NeedPicture2G3G];
}
-(void)setNeedPicture2G3G:(BOOL)needPicture2G3G
{
    [self.userDefaults setBool:needPicture2G3G forKey:NeedPicture2G3G];
    [self.userDefaults synchronize];
}
#pragma -mark 登录签名
-(NSString*)signature
{
    return [self safeForKey:Signature];
}
-(void)setSignature:(NSString *)signature
{
    [self.userDefaults setObject:signature forKey:Signature];
    [self.userDefaults synchronize];
}
#pragma -mark 系统版本
-(NSString*)systemVersion
{
    return [self safeForKey:SystemVersion];
}
-(void)setSystemVersion:(NSString *)systemVersion
{
    [self.userDefaults setObject:systemVersion forKey:SystemVersion];
    [self.userDefaults synchronize];
}
#pragma -mark 用户登录名
-(NSString*)loginName
{
    return [self safeForKey:LoginName];
}
-(void)setLoginName:(NSString *)loginName
{
    
    
    [self.userDefaults setObject:loginName forKey:LoginName];
    [self.userDefaults synchronize];
}
#pragma -mark 用户登录密码
-(NSString*)loginPassWord
{
    return [self safeForKey:LoginPassWord];
}
-(void)setLoginPassWord:(NSString *)loginPassWord
{
    [self.userDefaults setObject:loginPassWord forKey:LoginPassWord];
    [self.userDefaults synchronize];
}

#pragma -mark  userToken
-(NSString*)userToken
{
    return [self safeForKey:UserToken];
}
-(void)setUserToken:(NSString *)userToken
{
    [self.userDefaults setObject:userToken forKey:UserToken];
    [self.userDefaults synchronize];
}
#pragma -mark 用户头像地址
-(NSString*)userImageUrl
{
    return [self safeForKey:UserImageUrl];
}
-(void)setUserImageUrl:(NSString *)userImageUrl
{
    [self.userDefaults setObject:userImageUrl forKey:UserImageUrl];
    [self.userDefaults synchronize];
}
#pragma -mark 用户Latitude
-(NSString*)latitude
{
    return [self safeForKey:Latitude];
}
-(void)setLatitude:(NSString *)latitude
{
    [self.userDefaults setObject:latitude forKey:Latitude];
    [self.userDefaults synchronize];
}
#pragma -mark 用户实名认证
-(NSString*)certification
{
    return [self safeForKey:Certification];
}
-(void)setCertification:(NSString *)certification
{
    [self.userDefaults setObject:certification forKey:Certification];
    [self.userDefaults synchronize];
}
#pragma -mask 身份证
- (NSString *)cer_picZ{
    return [self safeForKey:CerpicZ];
}
- (void)setCer_picZ:(NSString *)cer_picZ{
    [self.userDefaults setObject:cer_picZ forKey:CerpicZ];
    [self.userDefaults synchronize];
}
- (NSString *)cer_picF{
    return [self safeForKey:CerpicF];
    
}
- (void)setCer_picF:(NSString *)cer_picF{
    [self.userDefaults setObject:cer_picF forKey:CerpicF];
    [self.userDefaults synchronize];
}
#pragma -mark 用户手机认证
-(NSString*)cellphone_audit
{
    return [self safeForKey:CellphoneAudit];
}
-(void)setCellphone_audit:(NSString *)cellphone_audit
{
    [self.userDefaults setObject:cellphone_audit forKey:CellphoneAudit];
    [self.userDefaults synchronize];
}
#pragma -mark 用户Latitude
-(NSString*)longitude
{
    return [self safeForKey:Longitude];
}
-(void)setLongitude:(NSString *)longitude
{
    [self.userDefaults setObject:longitude forKey:Longitude];
    [self.userDefaults synchronize];
}
#pragma -mark 用户定位地区
-(NSString*)currentRegion
{
    return [self safeForKey:CurrentRegion];
}
-(void)setCurrentRegion:(NSString *)currentRegion
{
    [self.userDefaults setObject:currentRegion forKey:CurrentRegion];
    [self.userDefaults synchronize];
}
#pragma -mark 用户QQ
-(NSString*)qqToke
{
    return [self safeForKey:QQToke];
}
-(void)setQqToke:(NSString *)qqToke
{
    [self.userDefaults setObject:qqToke forKey:QQToke];
    [self.userDefaults synchronize];
}
#pragma -mark 用户weixin
-(NSString*)weixinToken
{
    return [self safeForKey:WeiXinToken];
}
-(void)setWeixinToken:(NSString *)weixinToken
{
    [self.userDefaults setObject:weixinToken forKey:WeiXinToken];
    [self.userDefaults synchronize];
}
#pragma -mark 用户weibo
-(NSString*)weiboToken
{
    return [self safeForKey:WeiBoToken];
}
-(void)setWeiboToken:(NSString *)weiboToken
{
    [self.userDefaults setObject:weiboToken forKey:WeiBoToken];
    [self.userDefaults synchronize];
}
#pragma -mark 用户银行卡绑定
-(NSString*)bank_audit
{
    return [self safeForKey:BankAudit];
}
-(void)setBank_audit:(NSString *)bank_audit
{
    [self.userDefaults setObject:bank_audit forKey:BankAudit];
    [self.userDefaults synchronize];
}
#pragma -mark 邀请码
-(NSString*)invitcode
{
    return [self safeForKey:Invitcode];
}
- (void)setInvitcode:(NSString *)invitcode
{
    [self.userDefaults setObject:invitcode forKey:Invitcode];
    [self.userDefaults synchronize];
}
#pragma -mark 用户银行卡卡号
-(NSString*)bankAccount
{
    return [self safeForKey:BankAccount];
}
-(void)setBankAccount:(NSString *)bankAccount
{
    [self.userDefaults setObject:bankAccount forKey:BankAccount];
    [self.userDefaults synchronize];
}
#pragma -mark 用户Moblie
-(NSString*)userMoblie
{
    return [self safeForKey:UserMoblie];
}
-(void)setUserMoblie:(NSString *)userMoblie
{
    [self.userDefaults setObject:userMoblie forKey:UserMoblie];
    [self.userDefaults synchronize];
}
#pragma -mark 用户userEmail
-(NSString*)userEmail
{
    return [self safeForKey:UserEmail];
}
-(void)setUserEmail:(NSString *)userEmail
{
    [self.userDefaults setObject:userEmail forKey:UserEmail];
    [self.userDefaults synchronize];
}
#pragma -mark 用户ID
-(NSString*)userID
{
    return [self safeForKey:UserID];
}
-(void)setUserID:(NSString *)userID
{
    [self.userDefaults setObject:userID forKey:UserID];
    [self.userDefaults synchronize];
}
#pragma -mark 用户userNeickName
-(NSString*)userNicknameName
{
    return [self safeForKey:UserNicknameName];
}
-(void)setUserNicknameName:(NSString *)userNicknameName
{
    [self.userDefaults setObject:userNicknameName forKey:UserNicknameName];
    [self.userDefaults synchronize];
}
#pragma -mark 用户userName
-(NSString*)userName
{
    return [self safeForKey:UserName];
}
-(void)setUserName:(NSString *)userName
{
    [self.userDefaults setObject:userName forKey:UserName];
    [self.userDefaults synchronize];
}
#pragma -mark 用户userRellyName
-(NSString*)userRellyName
{
    return [self safeForKey:UserRellyName];
}
-(void)setUserRellyName:(NSString *)userRellyName
{
    [self.userDefaults setObject:userRellyName forKey:UserRellyName];
    [self.userDefaults synchronize];
}

#pragma -mark 用户userCity
-(NSString*)userCity
{
    return [self safeForKey:UserCity];
}
-(void)setUserCity:(NSString *)userCity
{
    [self.userDefaults setObject:userCity forKey:UserCity];
    [self.userDefaults synchronize];
}


#pragma -mark  searchHisArray
-(NSArray*)searchHisArray
{
    return [self.userDefaults arrayForKey:SearchHisArray];
}
-(void)setSearchHisArray:(NSString *)searchHisArray
{
    [self.userDefaults setObject:searchHisArray forKey:SearchHisArray];
    [self.userDefaults synchronize];
}

#pragma -mark 用户TotalMoney
-(NSString*)totalMoney
{
    return [self safeForKey:TotalMoney];
}
-(void)setTotalMoney:(NSString *)totalMoney
{
    [self.userDefaults setObject:totalMoney forKey:TotalMoney];
    [self.userDefaults synchronize];
}

#pragma -mark 用户AvailableFunds
-(NSString*)availableFunds
{
    return [self safeForKey:AvailableFunds];
}
-(void)setAvailableFunds:(NSString *)availableFunds
{
    [self.userDefaults setObject:availableFunds forKey:AvailableFunds];
    [self.userDefaults synchronize];
}

#pragma -mark 用户Interest
-(NSString*)interest
{
    return [self safeForKey:Interest];
}
-(void)setInterest:(NSString *)interest
{
    [self.userDefaults setObject:interest forKey:Interest];
    [self.userDefaults synchronize];
}


@end
