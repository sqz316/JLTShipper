//
//  BaseTabVC.m
//  JLT
//
//  Created by sinoservices on 16/4/8.
//  Copyright © 2016年 sinoservices. All rights reserved.
//

#import "BaseTabVC.h"

@interface BaseTabVC ()<UINavigationControllerDelegate>
@property(assign,nonatomic)NSUInteger  viewCount;
//键盘监听
@property(strong,nonatomic)UITapGestureRecognizer *keyTap;
@property(assign,nonatomic)BOOL isneedKey;


@end

@implementation BaseTabVC
#pragma -mark ======================通知栏控制======================
#pragma -mark 页面即将载入
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.isCurrentPage=YES;
    //    [MobClick beginLogPageView: self.navigationItem.title];
}
#pragma -mark 页面载入
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.viewCount=self.navigationController.viewControllers.count;
}
#pragma -mark 页面即将消失
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.isCurrentPage=NO;
    //    [MobClick endLogPageView: self.navigationItem.title];
}
#pragma -mark 页面消失
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSUInteger nowcount=self.navigationController.viewControllers.count;
    if (nowcount<self.viewCount) {
        // CLog(@"页面推出");
        [self cancelRequset];
    }
    
}


#pragma -mark 页面载入
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=kSystemBgColor;
    self.leftButton.hidden=NO;
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBarTintColor:RGB(60, 190, 188, 1)];
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.extendedLayoutIncludesOpaqueBars=NO;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    if (IsIOS8) {
        self.navigationController.hidesBarsOnSwipe=NO;
    }
    
    page=@"1";
}

#pragma -mark- ======================控件始化======================
#pragma -mark 左边按钮
-(UIButton *)leftButton{
    
    if (!_leftButton) {
        //左边按钮
        _leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [_leftButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
        [_leftButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateHighlighted];
        _leftButton.frame=CGRectMake(0, 0, 40, 40);
        [_leftButton setTitle:@"返回" forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        _leftButton.titleLabel.font=QuickFont(15);
        [_leftButton addTarget:self action:@selector(touchLeftBnt:) forControlEvents:UIControlEventTouchUpInside];
//        _leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        UIBarButtonItem *leftSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                   target:nil
                                                                                   action:nil];
        
        leftSpacer.width = -10;
        UIBarButtonItem*leftBar=[[UIBarButtonItem alloc]initWithCustomView:_leftButton];
        self.navigationItem.leftBarButtonItems=@[leftSpacer, leftBar];
        
    }return _leftButton;
}


#pragma -mark 右边按钮初始化
-(UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame=CGRectMake(0, 0, 40, 40);
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        _rightButton.titleLabel.font=QuickFont(15);
        [_rightButton addTarget:self action:@selector(touchRightBnt:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *rightSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                    target:nil
                                                                                    action:nil];
        
        rightSpacer.width = -10;
        UIBarButtonItem *rightBar= [[UIBarButtonItem alloc]initWithCustomView:_rightButton];
        self.navigationItem.rightBarButtonItems=@[rightSpacer,rightBar];
    }return _rightButton;
}

#pragma -mark 右边按钮事件
-(void)touchRightBnt:(UIButton *)sender{
    
    
}

#pragma -mark左边按钮事件
-(void)touchLeftBnt:(UIButton *)sender{
    
    //默认当成返回 因为几乎都是推出 如果不是 别调用[super touchLeftBnt:sender]  子类自定义
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

#pragma -mark 取消请求数组初始化
-(NSMutableArray *)afNetArray{
    if (!_afNetArray) {
        _afNetArray=[[NSMutableArray alloc]init];
    }return _afNetArray;
}

#pragma -mark 取消请求
-(void)cancelRequset{
    
    
    for (int i=0; i<self.afNetArray.count; i++) {
        
        NSURLSessionDataTask *post=[self.afNetArray objectAtIndex:i];
        
        if (post.state==NSURLSessionTaskStateRunning) {
            
            [post cancel];
            
            CLog(@"执行===>取消请求");
            
        }
        
    }
    
    
}
#pragma -mark- ======================进度条设置======================
#pragma -mark 菊花初始化
-(UIActivityIndicatorView *)activity{
    if (!_activity) {
        
        
        _activity= [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activity.center = CGPointMake(ScreenWidth/2, ScreenHeight/2);
        _activity.color = RGB(0, 0, 0, 1);
        [_activity setHidesWhenStopped:YES]; //当旋转结束时隐藏
        [self.view addSubview:_activity];
        
        
    }return _activity;
}
#pragma -mark 加载中图片
-(UIImageView *)loadImageV{
    if (!_loadImageV) {
        _loadImageV=[[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth-56)/2, (ScreenHeight-66)/2-25, 55, 55)];
        NSArray *aa=@[QuickImage(@"zhen1"),QuickImage(@"zhen2")];
        _loadImageV.animationImages=[NSArray arrayWithArray:aa];
        _loadImageV.contentMode=UIViewContentModeCenter;
        _loadImageV.backgroundColor=[UIColor clearColor];
        [self.view addSubview:_loadImageV];
    }
    return _loadImageV;
}
#pragma -mark 无数据图片
-(UIImageView *)nodataImageV{
    if (!_nodataImageV) {
        _nodataImageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        _nodataImageV.center=self.view.center;
        _nodataImageV.image=QuickImage(@"");
        _nodataImageV.backgroundColor=[UIColor clearColor];
        [self.view addSubview:_nodataImageV];
    }
    return _nodataImageV;
}

#pragma -mark - ======================监听键盘======================
#pragma mark 添加监听
-(void)addKeyNotification
{
    
    self.keyTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lostKey)];
    self.isneedKey=YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
#pragma mark 键盘即将出现
- (void)keyboardWillShow:(NSNotification *)notification
{
    
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    
    [UIView animateKeyframesWithDuration:animationDuration
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionLayoutSubviews
                              animations:^{
                                  self.view.frame=CGRectMake(0, 64, ScreenWidth, ScreenHeight-keyboardRect.size.height-64);
                                  
                              } completion:^(BOOL finished) {
                                  
                                  [self.view addGestureRecognizer:self.keyTap];
                                  if (self.keyCome) {
                                      self.keyCome();
                                  }
                                  
                              }];
}

#pragma mark 键盘即将隐藏
- (void)keyboardWillHide:(NSNotification *)notification
{
    
    NSDictionary *userInfo = [notification userInfo];
    
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    [UIView animateWithDuration:animationDuration animations:^{
        
        //self.tabY.constant=keyboardRect.size.height;
        self.view.frame=CGRectMake(0, 64, ScreenWidth, ScreenHeight);
        
    } completion:^(BOOL finished)
     {
         [self.view removeGestureRecognizer:self.keyTap];
         if (self.keyHide) {
             self.keyHide();
         }
         
     }];
    
}
-(void)lostKey{
    
    [self.view endEditing:YES];
    
}
-(void)dealloc{
    if (self.isneedKey) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIKeyboardWillShowNotification
                                                      object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIKeyboardWillHideNotification
                                                      object:nil];
        
    }
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
