//
//  HeroVIdeoModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroVIdeoModel.h"

@implementation HeroVIdeoModel

+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"totalPage"] || [propertyName isEqualToString:@"channelId"])
    {
        return propertyName;
    }
    return [propertyName underlineFromCamel];
}

@end



