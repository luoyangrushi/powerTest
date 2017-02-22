//
//  PowerView.m
//  powerTest
//
//  Created by ljh on 17/1/6.
//  Copyright © 2017年 ljh. All rights reserved.
//

#import "PowerView.h"

@implementation PowerView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self refeshUI];
    
    }
    
    return self;
}

-(void)refeshUI
{
//    [self removeFromSuperview];
    if (_currentNum > 0.2 && _currentNum < 1.0) {
        self.backView = [self creatViewWithImage:@"电量.png"];
        [self initfrontViewWithColor:[UIColor colorWithRed:123/255.0 green:123/255.0 blue:123/255.0 alpha:1]];
    }else if (_currentNum < 0.2 && _currentNum > 0)
    {
        self.backView = [self creatViewWithImage:@"低电警告.png"];
        [self initfrontViewWithColor:[UIColor colorWithRed:255/255.0 green:154/255.0 blue:0/255.0 alpha:1]];

    }else
    {
        self.backView = [self creatViewWithImage:@"充满电.png"];
        [self initfrontViewWithColor:[UIColor colorWithRed:0/255.0 green:186/255.0 blue:53/255.0 alpha:1]];
    }
    
    
    

   
//    self.frontView = [self initfrontViewWithColor:[UIColor greenColor]];
   
    [self addSubview:self.backView];
}
-(void)refeshUI2
{

    self.backView = [self creatViewWithImage:@"充满电.png"];
    [self initfrontViewWithColor:[UIColor colorWithRed:0/255.0 green:186/255.0 blue:53/255.0 alpha:1]];

    [self addSubview:self.backView];
}
-(UIView*)creatViewWithImage:(NSString*)imageName
{
    UIView *bgview = [[UIView alloc]initWithFrame:self.bounds];
    bgview.clipsToBounds = YES;
    bgview.backgroundColor = [UIColor whiteColor];


    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    [bgview addSubview:imageView];

    
    return bgview;
}

-(void)initfrontViewWithColor:(UIColor*)bgcolor
{
    self.frontView = [[UIView alloc]initWithFrame:CGRectMake(4, 4, 34, 14)];
    self.frontView.backgroundColor = bgcolor;
    [self.backView addSubview:self.frontView];
   
}
-(void)layoutSubviews
{
    
    [super layoutSubviews];
 
    if ([_charging isEqualToString:@"1"])
    {
        [self refeshUI2];
    }else
    {
        [self refeshUI];

    }
    printf("self.backView--->retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(self.backView)));
    printf("self.frontView--->retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(self.frontView)));
//    NSLog("retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(self.backView));
    __weak PowerView *weakSelf = self;
    
    CGFloat animationTimeInterval = 0.2;
    
    [UIView animateWithDuration:animationTimeInterval animations:^{
        weakSelf.frontView.frame = CGRectMake(4, 4, 34*_currentNum, 14);
    }];
}

-(void)setPowerPercent:(CGFloat)powerPercent
{
//    if (_currentNum == powerPercent) {
//        return;
//    }
    
    if (_currentNum < 0) {
        _currentNum = 0;
    }else if (_currentNum > 1)
    {
       _currentNum = 1;
    }else
    {
        _currentNum = powerPercent;
    }
    
    [self setNeedsLayout];
}

-(void)setPowerPercent2:(CGFloat)powerPercent
{
   
    _currentNum = powerPercent;
    
    [self setNeedsLayout];
}
@end
