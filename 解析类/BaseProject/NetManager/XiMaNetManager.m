//
//  XiMaNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaNetManager.h"

@implementation XiMaNetManager

//http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album?device=iPhone&key=ranking%3Aalbum%3Aplayed%3A1%3A2&pageId=2&pageSize=20&position=0&title=排行榜
//http://mobile.ximalaya.com/mobile/others/ca/album/track/3092772/true/1/20?device=iPhone

#define kRankListPath @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album"
#define kAlbumPath @"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/%@/20device=iPhone"
//获取音乐分类列表
+ (id)getRankingListWithPageId:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{@"device":@"iPhone", @"key":@"ranking:album:played:1:2", @"pageId":@(pageId), @"pageSize":@20, @"position":@0, @"title":@"排行榜"};
    return  [self GET:kRankListPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RankingListModel objectWithKeyValues:responseObj], error);
    }];
}

//音乐分类内容
+ (id)getRankListWithID:(NSInteger)ID pageID:(NSInteger)pageID completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path = [NSString stringWithFormat:kAlbumPath, @(ID), @(pageID)];
    return [self GET:path parameters:@{@"device":@"iPhone"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AlbumModel objectWithKeyValues:responseObj], error);
    }];
}

@end
