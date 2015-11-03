//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuoWanModel.h"

//http://lolbox.duowan.com/phone/apiHeroes.php?type=free&v=140&OSType=iOS9.1

typedef NS_ENUM(NSUInteger, HeroType)
{
    HeroTypeFree,
    HeroTypeAll,
};


@interface DuoWanNetManager : BaseNetManager

+ (id)getHeroWithType:(HeroType)heroType kCompletionHandle;

//英雄皮肤
+ (id)getHeroSkinsWithHeroName:(NSString *)heroName kCompletionHandle;
//英雄配音
+ (id)getHeroSoundWithHeroName:(NSString *)heroName kCompletionHandle;
//英雄视频
+ (id)getHeroVideoWithPage:(NSInteger)page tag:(NSString *)enName kCompletionHandle;
//英雄出装
+ (id)getHeroCZWithHeroName:(NSString *)enName kCompletionHandle;
@end
