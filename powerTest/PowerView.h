//
//  PowerView.h
//  powerTest
//
//  Created by ljh on 17/1/6.
//  Copyright © 2017年 ljh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PowerView : UIView

@property(nonatomic,strong) UIView *frontView;
@property(nonatomic,strong) UIView *backView;
@property(nonatomic,assign) float currentNum;
@property(nonatomic,strong) NSString *charging;

-(instancetype)initWithFrame:(CGRect)frame;
-(void)setPowerPercent:(CGFloat)powerPercent;
-(void)setPowerPercent2:(CGFloat)powerPercent;
@end
