//
//  JDLPollution.h
//  AirQuality_ObjectiveC
//
//  Created by Jacob LeCheminant on 1/29/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDLPollution : NSObject

@property (nonatomic, readonly) NSInteger airQualityIndex;

-(instancetype)initWithAirQualityIndex:(NSInteger) aqi;

@end

@interface JDLPollution (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary <NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
