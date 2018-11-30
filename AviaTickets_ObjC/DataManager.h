//
//  DataManager.h
//  AviaTickets_ObjC
//
//  Created by Илалов Динар on 30/11/2018.
//  Copyright © 2018 Илалов Динар. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"
#import "City.h"
#import "Airport.h"

#define kDataManagerLoadDataDidComplete @"DataManagerLoadDataDidComplete"

NS_ASSUME_NONNULL_BEGIN

typedef enum DataSourceType {
    DataSourceTypeCountry,
    DataSourceTypeCity,
    DataSourceTypeAirport
} DataSourceType;

@interface DataManager : NSObject

@property (nonatomic, strong, readonly) NSArray *countries;
@property (nonatomic, strong, readonly) NSArray *cities;
@property (nonatomic, strong, readonly) NSArray *airports;

+ (instancetype)sharedInstance;
- (void)loadData;

@end

NS_ASSUME_NONNULL_END
