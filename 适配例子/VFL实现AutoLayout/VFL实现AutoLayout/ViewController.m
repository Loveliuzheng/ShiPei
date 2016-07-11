//
//  ViewController.m
//  VFL实现AutoLayout
//
//  Created by pangrenmeng on 16/6/15.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    /*
     * VFL需要了解的内容
     *
     * 1、苹果推出的用代码写AutoLayout的语言
     * 2、需要对横竖两个方向进行约束
     * 3、使用之前要禁用视图的autoResing
     * 4、给视图添加约束之前要确保视图在父视图上面
     */
    
    UIView *myView = [[UIView alloc]init];
    myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myView];
    
    //1.禁用autoResing
    myView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //2.绑定视图
    
    NSDictionary *dict = NSDictionaryOfVariableBindings(myView);
    
    //3.生成约束数组
    
    NSArray *constrainH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[myView]-30-|" options:nil metrics:nil views:dict];
    
    NSArray *constrainV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[myView]-100-|" options:nil metrics:nil views:dict];
    
    //4.将生成的约束添加到视图上面
    
    [self.view addConstraints:constrainH];
    [self.view addConstraints:constrainV];
    
}



@end
