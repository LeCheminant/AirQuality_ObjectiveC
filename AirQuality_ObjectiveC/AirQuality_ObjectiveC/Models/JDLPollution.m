//
//  JDLPollution.m
//  AirQuality_ObjectiveC
//
//  Created by Jacob LeCheminant on 1/29/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

#import "JDLPollution.h"

@implementation JDLPollution

- (instancetype)initWithInt:(NSInteger)aqi
{
    self = [super init];
    if (self)
    {
        _airQualityIndex = aqi;
    }
    return self;
}

@end

@implementation JDLPollution (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger aqi = [dictionary[@"aquis"] intValue];
    
    return [self initWithInt:aqi];
}

@end
