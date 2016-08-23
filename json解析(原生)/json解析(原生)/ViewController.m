//
//  ViewController.m
//  json解析(原生)
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
    
    [self loadData];
}

-(void)loadData{
    //url地址
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    
    //创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        
        if(connectionError == nil && data.length > 0){
            /*
             options
             NSJSONReadingMutableContainers = (1UL << 0),(容器可变)
             NSJSONReadingMutableLeaves = (1UL << 1),(叶子可变)失效
             NSJSONReadingAllowFragments = (1UL << 2)(可以解析不是json格式的字符串)失效
             */
            //反序列化
            id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            
            NSLog(@"%@--的类型为-->%@",result,[result class]);
        }
    }];
}


@end
