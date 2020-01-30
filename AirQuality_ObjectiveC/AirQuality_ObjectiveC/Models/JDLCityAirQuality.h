//
//  JDLCityAirQuality.h
//  AirQuality_ObjectiveC
//
//  Created by Jacob LeCheminant on 1/29/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDLWeather;
@class JDLPollution;

NS_ASSUME_NONNULL_BEGIN

@interface JDLCityAirQuality : NSObject

@property (nonatomic, copy, readonly) NSString * city;
@property (nonatomic, copy, readonly) NSString * state;
@property (nonatomic, copy, readonly) NSString * country;
@property (nonatomic, copy, readonly) JDLWeather * weather;
@property (nonatomic, copy, readonly) JDLPollution * pollution;

// (type)name
-(instancetype)initWithCity:(NSString *)city
                      state:(NSString *)state
                    country:(NSString *)country
                    weather:(JDLWeather *)weather
                  pollution:(JDLPollution *)pollution;

@end

@interface JDLCityAirQuality (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
