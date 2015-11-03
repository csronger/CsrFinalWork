//
//  XiMaNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "RankingListModel.h"
#import "AlbumModel.h"

@interface XiMaNetManager : BaseNetManager

//获取音乐分类列表
+ (id)getRankingListWithPageId:(NSInteger)pageId kCompletionHandle;

//音乐分类内容
+ (id)getRankListWithID:(NSInteger)ID pageID:(NSInteger)pageID kCompletionHandle;
@end
