//
//  WeatherDataManager.h
//  Flurry
//
//  Created by Durgesh Gupta on 12/30/15.
//  Copyright © 2015 Durgesh Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompletionHandler)(BOOL success);
@interface WeatherDataManager : NSObject

+(instancetype)sharedManager;

-(void)fetchWeatherWithURLString:(NSString *)urlString CompletionHandler:(CompletionHandler)iHandler;

@end