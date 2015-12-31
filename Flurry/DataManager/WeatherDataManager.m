//
//  WeatherDataManager.m
//  Flurry
//
//  Created by Durgesh Gupta on 12/30/15.
//  Copyright © 2015 Durgesh Gupta. All rights reserved.
//

#import "WeatherDataManager.h"
#import "BackendUtility.h"
#import "Weather.h"

@implementation WeatherDataManager


+ (instancetype)allocWithZone:(NSZone *)zone
{
    static dispatch_once_t onceQueue;
    static WeatherDataManager *sharedManager = nil;
    dispatch_once(&onceQueue, ^{
        
        if (sharedManager == nil) {
            sharedManager = [super allocWithZone:zone];
        }
    });
    
    return sharedManager;
}

+(instancetype)sharedManager{
    
    static dispatch_once_t once = 0;
    static WeatherDataManager *sharedManager;
    
    if (sharedManager) {
        return sharedManager;
    }
    
    dispatch_once(&once, ^{
        
        if (!sharedManager) {
            sharedManager = [WeatherDataManager new];
        }
    });
    
    return sharedManager;
}

-(void)fetchWeatherWithURLString:(NSString *)urlString CompletionHandler:(CompletionHandler)iHandler{
    
    [BackendUtility requestWithURL:urlString andCompletionBlock:^(id receivedData) {
       
        if ([receivedData isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dataDict = (NSDictionary *)receivedData[@"weatherObservation"];
            dispatch_async(dispatch_get_main_queue(), ^{
                iHandler([Weather insertWithData:dataDict]);
            });
        }
    }];
    
}

@end
