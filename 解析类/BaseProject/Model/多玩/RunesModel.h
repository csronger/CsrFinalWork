//
//  RunesModel.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"


@class RunesPurpleModel;
@interface RunesModel : BaseModel

@property (nonatomic, strong) NSArray<RunesPurpleModel *> *purple;

@property (nonatomic, strong) NSArray<RunesPurpleModel *> *blue;

@property (nonatomic, strong) NSArray<RunesPurpleModel *> *yellow;

@property (nonatomic, strong) NSArray<RunesPurpleModel *> *red;

@end


@interface RunesPurpleModel : NSObject
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *recom;
@property (nonatomic, strong) NSString *lev3;
@property (nonatomic, strong) NSString *lev2;
@property (nonatomic, assign) double iplev3;
@property (nonatomic, strong) NSString *standby;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *units;
@property (nonatomic, strong) NSString *lev1;
@property (nonatomic, strong) NSString *iplev2;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSString *prop;
@property (nonatomic, strong) NSString *iplev1;
@end


