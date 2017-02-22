//
//  ViewController.m
//  powerTest
//
//  Created by ljh on 17/1/6.
//  Copyright © 2017年 ljh. All rights reserved.
//

#import "ViewController.h"
#import "PowerView.h"

@interface ViewController ()

@property(nonatomic,strong)PowerView *powerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.powerView = [[PowerView alloc] initWithFrame:CGRectMake(100, 100, 45, 22)];
    
    self.powerView.backgroundColor = [UIColor clearColor];
    
    self.powerView.currentNum = 1;
    
    [self.powerView setPowerPercent:1];
    
    [self.view addSubview:self.powerView];
    
    UILabel *powerlb = [[UILabel alloc]initWithFrame:CGRectMake(150, 100, 40, 20)];
    
    int a = self.powerView.currentNum*100;
    NSString *str1 = [NSString stringWithFormat:@"%d%@",a,@"%"];
    powerlb.text = str1;
    [self.view addSubview:powerlb];
    self.powerView.charging = @"1";
    NSTimer *timer1 =[NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(gogogo) userInfo:nil repeats:YES];
    [timer1 setFireDate:[NSDate distantPast]];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)gogogo
{
//    self.powerView.currentNum = 1.0;
    if (self.powerView.currentNum >1.0) {
        self.powerView.currentNum = 0.1;
    }
    self.powerView.currentNum += 0.02;
  
    [self.powerView setPowerPercent2:self.powerView.currentNum];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
