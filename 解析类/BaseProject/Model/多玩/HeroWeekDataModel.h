//
//  HeroWeekDataModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class HeroWeekDataDataModel,HeroWeekDataDataChartsModel,HeroWeekDataDataChartsRatioDataModel;

@interface HeroWeekDataModel : BaseModel
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) HeroWeekDataDataModel *data;
@property (nonatomic, assign) double code;
@end


@interface HeroWeekDataDataModel : NSObject
@property (nonatomic, strong) NSArray<HeroWeekDataDataChartsModel *> *charts;
@property (nonatomic, assign) double averageWinRatio;
@property (nonatomic, assign) double averageKNum;
@property (nonatomic, assign) double championId;
@property (nonatomic, assign) double averageDNum;
@property (nonatomic, assign) double averageANum;
@property (nonatomic, assign) double rank;
@end

@interface HeroWeekDataDataChartsModel: NSObject
@property (nonatomic, strong) NSString *yAxisTitle;
@property (nonatomic, strong) NSArray *ratioData;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *color;
@end


@interface HeroWeekDataDataChartsRatioDataModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double value;

@end