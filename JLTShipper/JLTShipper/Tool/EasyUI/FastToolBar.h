//
//  FastToolBar.h
//  NewWorld
//
//  Created by Sinoservice on 16/3/18.
//  Copyright © 2016年 odg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FastToolBar : UIToolbar
-(instancetype)initWithFrame:(CGRect)frame;
@property(copy,nonatomic)void(^touchCanCel)(void);
@property(copy,nonatomic)void(^touchSure)(void);
@end
