//
//  ViewController.m
//  autolayouts
//
//  Created by Otatime on 8/18/15.
//  Copyright (c) 2015 Cao Phuoc Thanh. All rights reserved.
//

#import "ViewController.h"
#import "AnswerView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *pobupview;
@property (weak, nonatomic) IBOutlet UIButton *a1;
@property (weak, nonatomic) IBOutlet UIButton *a2;
@property (weak, nonatomic) IBOutlet UIButton *a3;
@property (weak, nonatomic) IBOutlet UIButton *a4;
@property (weak, nonatomic) IBOutlet UIButton *aa;
@property (weak, nonatomic) IBOutlet AnswerView *answer;

@end

@implementation ViewController


-(void)didTouchButton:(UIButton *)button ratingDidChange:(float)index{
    NSLog(@"didTouchButton: %@: %f",button,index);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.answer.delegate=self;
    
    NSLog(@"all:%@",self.pobupview.constraints);
    NSLog(@"a1: %@",self.a1.constraints);
    NSLog(@"a2: %@",self.a2.constraints);
    NSLog(@"a3: %@",self.a3.constraints);
    NSLog(@"a4: %@",self.a4.constraints);
    NSLog(@"aa: %@",self.aa.constraints);
     self.aa.layer.cornerRadius=self.a1.layer.cornerRadius=self.a2.layer.cornerRadius= self.a3.layer.cornerRadius=self.a4.layer.cornerRadius=self.a1.frame.size.height/5;
    [self  addShadownButton:self.aa.layer];
    [self  addShadownButton:self.a1.layer];
    [self  addShadownButton:self.a2.layer];
    [self  addShadownButton:self.a3.layer];
    [self  addShadownButton:self.a4.layer];
    [self addShadownView:self.pobupview.layer];

}

-(void)addShadownView:(CALayer*)layyer{
    layyer.masksToBounds = NO;
    //layyer.cornerRadius = 8; // if you like rounded corners
    layyer.shadowOffset = CGSizeMake(0, -2);
    layyer.shadowRadius = 1;
    layyer.shadowOpacity = 0.3;
    layyer.shadowColor=[[UIColor blackColor] CGColor];
}

-(void)addShadownButton:(CALayer*)layyer{
    layyer.masksToBounds = NO;
    layyer.cornerRadius = 8; // if you like rounded corners
    layyer.shadowOffset = CGSizeMake(8, 8);
    layyer.shadowRadius = 0;
    layyer.shadowOpacity = 0.3;
    layyer.shadowColor=[[UIColor darkGrayColor] CGColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
