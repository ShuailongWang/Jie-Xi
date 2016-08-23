//
//  ViedsModel.h
//  sax解析XML
//
//  Created by czbk on 16/7/11.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViedsModel : NSObject

@property (nonatomic,copy) NSString *videoId;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *length;
@property (nonatomic,copy) NSString *videoURL;
@property (nonatomic,copy) NSString *imageURL;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *teacher;

@end
