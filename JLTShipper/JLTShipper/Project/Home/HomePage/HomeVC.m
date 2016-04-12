//
//  HomeVC.m
//  JLT
//
//  Created by sinoservices on 16/4/10.
//  Copyright © 2016年 sinoservices. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()<UISearchBarDelegate>

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNaview];
    // Do any additional setup after loading the view.
}
//配置导航基础控件
-(void)initNaview
{
    
    [self.rightButton setTitle:@"搜索" forState:UIControlStateNormal];
  
//    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,ScreenWidth-115, 35)];//allocate titleView
//    [titleView setBackgroundColor:[UIColor clearColor]];
//    
//    UISearchBar *searchBar = [[UISearchBar alloc] init];
//    searchBar.delegate = self;
//    searchBar.frame = CGRectMake(0, 0, ScreenWidth-115, 35);
//    [titleView addSubview:titleView];
//    searchBar.placeholder = @"搜索订单号";
//   
//    //Set to titleView
//    self.navigationItem.titleView = titleView;

    
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
