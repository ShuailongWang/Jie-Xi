//
//  ViewController.m
//  plist文件解析
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

- (void)loadData {
    //
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/apps.plist"];
    
    //
    NSURLRequest *reques = [NSURLRequest requestWithURL:url];
    
    //
    [NSURLConnection sendAsynchronousRequest:reques queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(connectionError == nil){
            id result = [NSPropertyListSerialization propertyListWithData:data options:0 format:nil error:NULL];
            
            NSLog(@"%@,%@",result,[result class]);
        }
    }];
    
}

@end
