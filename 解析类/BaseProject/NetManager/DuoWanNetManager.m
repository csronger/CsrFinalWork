//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
#import "DuoWanRequestsPath.h"

//很多具有共同点的东西可以统一宏定义，比如
//凡是自己写的宏定义，都需要用k开头，编码习惯
//#define kOSType   @"OSType":@:"iOS9.1"//当前手机系统版本。需要到info文件中去取
#define kOSType    @"OSType":[@"iOS" stringByAppendingString:[UIDevice currentDevice].systemVersion]//获取系统当前版本号
#define kVersionName  @"versionName":@"2.4.0"
#define kV   @"v":@140
//把path写到文件头部，使用宏定义形式，方便后期维护

@implementation DuoWanNetManager

//免费+全部英雄
+ (id)getHeroWithType:(HeroType)heroType completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kOSType, kV}];
    switch (heroType)
    {
        case HeroTypeFree: {
            [params setObject:@"free" forKey:@"type"];
            break;
        }
        case HeroTypeAll: {
            [params setObject:@"all" forKey:@"type"];
            break;
        }
        default: {
            NSAssert1(NO, @"%s:type类型不正确",__func__);
            break;
        }
    }
    
    //判断是哪种英雄还是所有
    return [self GET:kHeroPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        switch (heroType) {
            case HeroTypeFree: {
                completionHandle([FreeHeroModel objectWithKeyValues:responseObj], error);
                break;
            }
            case HeroTypeAll: {
                completionHandle([AllHeroModel objectWithKeyValues:responseObj],error);
                break;
            }
            default: {
                completionHandle(nil, error);
                break;
            }
        }
    }];
}

//皮肤
+ (id)getHeroSkinsWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroSkinPath parameters:@{kOSType, kV, kVersionName, @"hero":heroName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroSkinModel objectWithKeyValues:responseObj], error);
    }];
}

//配音
+ (id)getHeroSoundWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroSoundPath parameters:@{kOSType, kV, kVersionName, @"hero":heroName} completionHandler:^(id responseObj, NSError *error) {
        //json数据是标准数组，不需要解析
        completionHandle(responseObj, error);
    }];
}

//视频
+ (id)getHeroVideoWithPage:(NSInteger)page tag:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroVideoPath parameters:@{kOSType, kV, @"action":@"l", @"p":@(page), @"src":@"letv", @"tag":enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroVIdeoModel objectWithKeyValues:responseObj], error);
    }];
}

//出装
+ (id)getHeroCZWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroCZPath parameters:@{kOSType, kV, @"championName":enName, @"limit":@7} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroCZModel objectWithKeyValues:responseObj], error);
    }];
}
@end












































