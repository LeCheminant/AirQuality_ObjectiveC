//
//  JDLCityAirQualityController.h
//  AirQuality_ObjectiveC
//
//  Created by Jacob LeCheminant on 1/29/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JDLCityAirQuality;

NS_ASSUME_NONNULL_BEGIN

@interface JDLCityAirQualityController : NSObject

+(void)fetchSupportedCountries:(void (^) (NSArray<NSString *> *_Nullable))completion;

+(void)fetchSupportedStatesInCountry:(NSString *)country
                          completion:(void (^) (NSArray<NSString *> *_Nullable))completion;

+(void)fetchSupportedCitiesInState:(NSString *)state
                           country:(NSString *)country
                        completion:(void (^) (NSArray<NSString *> *_Nullable))completion;

+(void)fetchDataForCity:(NSString *)city
                  state:(NSString *)state
                country:(NSString *)country
             completion:(void (^) (JDLCityAirQuality *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
