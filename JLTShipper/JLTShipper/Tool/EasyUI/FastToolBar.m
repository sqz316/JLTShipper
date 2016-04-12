//
//  FastToolBar.m
//  NewWorld
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import "FastToolBar.h"

@implementation FastToolBar
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        [self defaultView];
        [self setTool];
    }return self;
}
-(void)defaultView{
    
    //     [self setBackgroundImage:[Methods imageWithColor:BaseColor] forToolbarPosition:0 barMetrics:0];
    //    self.backgroundColor=[UIColor whiteColor];
    //    self.barStyle=UIBarStyleDefault;
    self.tintColor=BaseColor;
    //    self.barTintColor=BaseColor;
    //    self.translucent=NO;
}
-(void)setTool{
    
    
    UIBarButtonItem *cancel= [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(cancel)];
    
    UIBarButtonItem *line= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *sure= [[UIBarButtonItem alloc] initWithTitle:@"确定"
                                                            style:UIBarButtonItemStylePlain
                                                           target:self
                                                           action:@selector(sure)];
    
    [self setItems:@[cancel,line,sure] animated:YES];
}
-(void)cancel{
    if (self.touchCanCel) {
        self.touchCanCel();
    }
    
}
-(void)sure{
    if (self.touchSure) {
        self.touchSure();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
