//
//  HeroCZModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroCZModel.h"

@implementation HeroCZModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    //驼峰命名转化为带下划线的
    return [propertyName underlineFromCamel];
}

@end
