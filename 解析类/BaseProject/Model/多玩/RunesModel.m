//
//  RunesModel.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RunesModel.h"

@implementation RunesModel

+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    return  [propertyName firstCharUpper];
}

+ (NSDictionary *)objectClassInArray{
    return @{@"Purple" : [RunesPurpleModel class], @"Yellow" : [RunesPurpleModel class], @"Blue" : [RunesPurpleModel class], @"Red" : [RunesPurpleModel class]};
}
@end

@implementation RunesPurpleModel


+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"img": @"Img", @"name": @"Name", @"recom": @"Recom", @"units": @"Units", @"type": @"Type", @"standby": @"Standby", @"alias": @"Alias", @"prop": @"Prop"};
}

@end



