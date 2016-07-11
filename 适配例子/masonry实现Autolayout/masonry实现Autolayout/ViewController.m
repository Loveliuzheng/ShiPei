//
//  ViewController.m
//  masonry实现Autolayout
//
//  Created by pangrenmeng on 16/6/15.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"

@interface ViewController ()
{
    UIView *redview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  //  [self baseUse];
    
  //  [self layoutFourBlock];
    
  //  [self layoutEqualWidth];
    
    [self masonryAnimation];
    
}

-(void)masonryAnimation{

    redview = [[UIView alloc]init];
    redview.backgroundColor = [UIColor redColor];
    [self.view addSubview:redview];
    
    [redview mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(@50);
        make.top.equalTo(@100);
        
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        
        make.height.equalTo(@200);
        
    }];

    
  
   

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    [redview mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@1);
        
    }];
    
     [UIView animateWithDuration:5 animations:^{
        
        [self.view layoutIfNeeded];
        
    }];
   
}



-(void)layoutEqualWidth{

    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];


    float padding = 10;
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(padding);
        make.centerY.equalTo(self.view);
        make.height.equalTo(@150);
        make.width.equalTo(blueView);
        
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.view.mas_right).offset(-padding);
        make.centerY.equalTo(self.view);
        make.height.equalTo(@150);
        make.width.equalTo(redView);
        make.left.equalTo(redView.mas_right).offset(padding);
    }];
    
    
}




-(void)layoutFourBlock{


    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];


    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    
    UIView *greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:greenView];
    
    UIView *orangeView = [[UIView alloc]init];
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5);
        
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(redView.mas_right);
        make.top.equalTo(redView.mas_top);
        
        make.width.and.height.equalTo(redView);
        
        
    }];
    
}





-(void)baseUse{

    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    //添加新约束
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //设置左边距
        make.left.equalTo(self.view.mas_left);
        
        //设置顶边距
        make.top.equalTo(self.view.mas_top);
        //确定宽高
        make.width.equalTo(@100);
        make.height.equalTo(@100);
        
    }];
    
    //更改约束
    
    [view1 mas_updateConstraints:^(MASConstraintMaker *make) {
        
        //  make.center.equalTo([NSValue valueWithCGPoint:self.view.center]);
        
        
    }];
    
    //清楚约束并重新添加
    
    [view1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        //        make.center.equalTo(self.view);
        //
        //        make.width.equalTo(@50);
        //        make.height.equalTo(@50);
        
        make.edges.equalTo([NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)]);
        
        
    }];


}

@end
