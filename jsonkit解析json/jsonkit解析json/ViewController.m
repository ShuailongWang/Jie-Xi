//
//  ViewController.m
//  jsonkit解析json
//
//  Created by czbk on 16/7/10.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "ViewController.h"
#import "JSONKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadData];
}
-(void)loadData{
    //
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    
    //
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //
        if(nil == connectionError){
            id result = [[JSONDecoder decoder] objectWithData:data];
            
            NSLog(@"%@,%@",result,[result class]);
        }
        
    }];
}


@end
