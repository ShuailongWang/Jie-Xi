//
//  ViewController.m
//  打印数组和字典时会自动调用这个方法,在分类中重写这个方法时
//
//  Created by czbk on 16/7/10.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *name = @"哈哈哈哈";
    NSLog(@"%@",name);
    
    
    NSArray *arr = @[@"啪啪啪",@"么么哒"];
    NSLog(@"%@",arr);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
