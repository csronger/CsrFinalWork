//
//  TuWanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanNetManager.h"
#import "TuWanModel.h"

#define kTuWanPath @"http://cache.tuwan.com/app/"
#define kAppid @"appid":@1
#define kAppver @"appver":@2.1
#define kClassMore @"classmore":@"indexpic"

#define kRemoveClassMore(dic) [dic removeObjectForKey:@"classmore"];
#define kSetDtId(string,dic) [dic setObject:string forKey:@"dtid"];
#define kSetClass(string,dic) [dic setObject:string forKey:@"class"];
#define kSetMod(string,dic) [dic setObject:string forKey:@"mod"];

@implementation TuWanNetManager

+ (id)getTuWanInfoWithType:(InfoType)infoType start:(NSInteger)start completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kAppid, kAppver, @"start":@(start), kClassMore}];
    
    switch (infoType) {
        case InfoTypeTouTiao: {
            break;
        }
        case InfoTypeDuJia: {
            kRemoveClassMore(params)
            kSetClass(@"heronews",params)
            kSetMod(@"八卦", params)
            break;
        }
        case InfoTypeAnHei: {
            kSetDtId(@"83623", params)
            break;
        }
        case InfoTypeMoShou: {
            kSetDtId(@"31537", params)
            break;
        }
        case InfoTypeFengBao: {
            kSetDtId(@"31538", params)
            break;
        }
        case InfoTypeLuShi: {
            kSetDtId(@"31528", params)
            break;
        }
        case InfoTypeXingJi: {
            kRemoveClassMore(params)
            kSetDtId(@"91821", params)
            break;
        }
        case InfoTypeShouWang: {
            kRemoveClassMore(params)
            kSetDtId(@"57067", params)
            break;
        }
        case InfoTypeTuPian: {//图片  视频  攻略参数只差type 所以去掉break
            kRemoveClassMore(params)
            kSetDtId(@"83623,31528,31537,31538,57067,91821", params)
            [params setObject:@"pic" forKey:@"type"];
        }
        case InfoTypeShiPin: {
            [params setObject:@"video" forKey:@"type"];
        }
        case InfoTypeGongLve: {
            [params setObject:@"guide" forKey:@"type"];
            break;
        }
        case InfoTypeHuanHua: {
            kRemoveClassMore(params)
            kSetClass(@"heronews",params)
            kSetMod(@"幻化", params)
            break;
        }
        case InfoTypeQuWen: {
            kSetDtId(@"0", params)
            kSetClass(@"heronews",params)
            kSetMod(@"趣闻", params)
            break;
        }
        case InfoTypeCOS: {
            kSetClass(@"cos", params)
            kSetMod(@"cos", params)
            kSetDtId(@"0", params)
            break;
        }
        case InfoTypeMeiNv: {
            kSetClass(@"heronews", params)
            kSetMod(@"美女", params)
            [params setObject:@"cos1" forKey:@"typechild"];
            break;
        }
        default: {
            break;
        }
    }
    
    //中文字转为%号
    NSString *path = [self percentPathWithPath:kTuWanPath params:params];
    
    
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuWanModel objectWithKeyValues:responseObj], error);
    }];
}

@end
