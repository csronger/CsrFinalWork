//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

//只要共用一个解析类的请求，就可以合起来写， 只需要使用枚举变量，来决定不同的请求地址即可
//可以参考汽车之家接口

typedef NS_ENUM(NSUInteger, InfoType)
{
    InfoTypeTouTiao,//头条
    InfoTypeDuJia,//独家
    InfoTypeAnHei,//暗黑
    InfoTypeMoShou,//魔兽
    InfoTypeFengBao,//风暴
    InfoTypeLuShi,//炉石
    InfoTypeXingJi,//星际
    InfoTypeShouWang,//守望
    InfoTypeTuPian,//图片
    InfoTypeShiPin,//视频
    InfoTypeGongLve,//攻略
    InfoTypeHuanHua,//幻化
    InfoTypeQuWen,//趣闻
    InfoTypeCOS,//COS
    InfoTypeMeiNv,//美女
};

@interface TuWanNetManager : BaseNetManager

//取类型，start值
+ (id)getTuWanInfoWithType:(InfoType)infoType start:(NSInteger)start kCompletionHandle;

@end



























