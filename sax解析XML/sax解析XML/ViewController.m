//
//  ViewController.m
//  sax解析XML
//
//  Created by czbk on 16/7/11.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "ViewController.h"
#import "ViedsModel.h"

@interface ViewController ()<NSXMLParserDelegate>

@property (strong,nonatomic) ViedsModel *currentModel;  //model

@property (copy,nonatomic) NSMutableString *strM;

@property (strong,nonatomic) NSMutableArray *arrList;

@end

@implementation ViewController

-(NSMutableString *)strM{
    if(nil == _strM){
        _strM = [NSMutableString string];
    }
    return _strM;
}
-(NSMutableArray *)arrList{
    if(nil == _arrList){
        _arrList = [NSMutableArray array];
    }
    return _arrList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadXML];
}

- (void)loadXML {
    //url
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/one.XML"];
    
    //
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //
        if(nil == connectionError){
            //创建NSXMLParser对象
            NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
            
            //设置代理
            parser.delegate = self;
            
            //执行代理方法
            [parser parse];
        }
    }];
}

#pragma mark -NSXMLParser代理方法
//1,开始解析XML文档
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"开始解析XML文档");
}

//2,开始找节点
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    //NSLog(@"开始找节点");
    
    //判断查找的是哪个节点,然后根据节点去做处相应的动作
    
    if([elementName isEqualToString:@"videos"]){
    
    }else if([elementName isEqualToString:@"video"]){
        //创建模型
        self.currentModel = [[ViedsModel alloc]init];
        
        //赋值
        self.currentModel.videoId = attributeDict[@"videoId"];
        
    }else{
        
        //开始走属性的时候,先把字符串设置为空,要不还是上次保存的东西
        [self.strM setString:@""];
    }
    
}

//3,开始找节点之间的内容
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    //NSLog(@"开始找节点之间的内容");
    
    
    //读取字符串,只是读取一部分,必须拼接字符串
    [self.strM appendString:string];
}

//4,结束找节点
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    //NSLog(@"结束找节点");
    
    //当到结束找节点的时候,保存所读取的数据
    
    if([elementName isEqualToString:@"videos"]){
        
    }else if([elementName isEqualToString:@"video"]){
        
        //把模型添加到数组中
        [self.arrList addObject:self.currentModel];
    }else{
        //kvc,这个是保存读取的属性数据,strM字符串
        [self.currentModel setValue:self.strM.copy forKey:elementName];
        
    }
}

//5,结束解析文档
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"结束解析文档");
    NSLog(@"%@",self.arrList);
}

//6,监听解析是否出错
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"监听解析是否出错");
}

@end
