//
//  BaseNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

static AFHTTPSessionManager *manager = nil;

@implementation BaseNetManager

+ (AFHTTPSessionManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", nil];
    });
    return manager;
}

//http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1
/*
 URL的结构是 ？之前是地址，？号之后是参数
 path:http://cache/tuwan.com/app/
 params:@{@"appid":@1, @"class":@"heronews", @"mod":@"八卦", @"appver":@2.1};
 */
/*习惯
 for（int i = 0;i < parmas.allkeys.count;i ++)
 假如for循环循环1000次，params.allkeys实际上调用的[params allkeys]，会调用allKeys 1000次。
 OC语言特性是runtime，实际上我们调用一个方法，底层操作是，在一个方法列表中搜索你调用的方法所在的地址，然后调用完毕之后，把这个方法名转移到常用方法列表。所以如果再次执行某个方法就在常用方法列表中搜索调用，效率更高
 */
+ (NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params
{
    NSMutableString *percentPath = [NSMutableString stringWithString:path];
    NSArray *keys = params.allKeys;
    NSInteger count = keys.count;//尽量减少搜索过程
    for (int i = 0; i < count;i ++)
    {
        if (i == 0)
        {
            [percentPath appendFormat:@"?%@=%@", keys[i], params[keys[i]]];
        }else
        {
            [percentPath appendFormat:@"&%@=%@", keys[i], params[keys[i]]];
        }
    }
    //把字符串中的中文转为%号形式
    return [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
//方法作用：把path和params拼接起来，把字符串中的中文转化为  百分号  形式。因为有的服务器不接受中文编码
+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    //转中文编码为百分号形式
    path = [self percentPathWithPath:path params:params];
    //打印网络请求， DDLog  与  NSLog 功能一样
    DDLogVerbose(@"Request Path: %@, Params:%@", path, params);
    return [[self sharedAFManager] GET:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        complete(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    return [[self sharedAFManager] POST:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        [self handleError:error];
        complete(nil, error);
    }];
}

+ (void)handleError:(NSError *)error{
    [[self new] showErrorMsg:error]; //弹出错误信息
}

@end
