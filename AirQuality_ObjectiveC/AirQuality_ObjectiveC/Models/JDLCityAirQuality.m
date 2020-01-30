//
//  JDLCityAirQuality.m
//  AirQuality_ObjectiveC
//
//  Created by Jacob LeCheminant on 1/29/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

#import "JDLCityAirQuality.h"
#import "JDLWeather.h"
#import "JDLPollution.h"

@implementation JDLCityAirQuality

- (instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(JDLWeather *)weather pollution:(JDLPollution *)pollution
{
    self = [super init];
    if (self) {
        _city = city;
        _state = state;
        _country = country;
        _weather = weather;
        _pollution = pollution;
    }
    return self;
}

@end

@implementation JDLCityAirQuality (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *city = dictionary[@"city"];
    NSString *state = dictionary[@"state"];
    NSString *country = dictionary[@"country"];
    NSDictionary *current = dictionary[@"current"];
    
    JDLWeather *weather = [[JDLWeather alloc] initWithDictionary:current[@"weather"]];
    JDLPollution *pollution = [[JDLPollution alloc] initWithDictionary:current [@"pollution"]];
    
    return[self initWithCity:city state:state country:country weather:weather pollution:pollution];
}

@end
