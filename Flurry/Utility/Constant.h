//
//  Constant.h
//  Flurry
//
//  Created by Durgesh Gupta on 12/30/15.
//  Copyright © 2015 Durgesh Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface Constant : NSObject

#define WEATHER_API @"http://api.geonames.org/weatherIcaoJSON?ICAO=KSFO&username=sdkteam"

#define APP_DELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define IS_VALID_OBJECT(x) ((x) != nil && [(x) class] != [NSNull class])
#define IS_VALID_ARRAY(x) (IS_VALID_OBJECT(x) && (x).count > 0)
#define IS_EMPTY_ARRAY(x) (!IS_VALID_ARRAY(x))

@end
