//
//  TestViewController.m
//  image
//
//  Created by 韩占森 on 2018/4/27.
//  Copyright © 2018年 韩占森. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, copy) NSString* test;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    self.test = @"胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服";
    self.label.text = self.test;
    
    CGSize size = [self.label sizeThatFits:CGSizeMake(self.label.frame.size.width, 0)];
    
    NSLog(@"%@", NSStringFromCGSize(size));
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    self.test = @"胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服胜多负少防辐射服";
    self.label.text = self.test;
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width - 30;
    CGFloat s = self.label.frame.size.width;
    
    CGSize size = [self.label sizeThatFits:CGSizeMake(self.label.frame.size.width, 0)];
    
    NSLog(@"%@", NSStringFromCGSize(size));
}




@end
