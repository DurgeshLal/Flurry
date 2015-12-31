//
//  Weather.m
//  Flurry
//
//  Created by Durgesh Gupta on 12/30/15.
//  Copyright © 2015 Durgesh Gupta. All rights reserved.
//

#import "Weather.h"
#import "Constant.h"

@implementation Weather

// Insert code here to add functionality to your managed object subclass

+ (BOOL)insertWithData:(NSDictionary *)dataDict
{
    // Delete any any existing data
    [Weather deleteData];
    
    NSAssert([NSThread isMainThread], @"This method must run in the main thread");
    [APP_DELEGATE.managedObjectContext performBlockAndWait:^{
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Weather"inManagedObjectContext:APP_DELEGATE.managedObjectContext];;
        Weather *iObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:APP_DELEGATE.managedObjectContext];
        
        iObject.icao = dataDict[@"ICAO"];
        iObject.clouds = dataDict[@"clouds"];
        iObject.cloudsCode = dataDict[@"cloudsCode"];
        iObject.countryCode = dataDict[@"countryCode"];
        iObject.dateTime = dataDict[@"datetime"];
        iObject.dewPoint = dataDict[@"dewPoint"];
        iObject.elevation = [NSString stringWithFormat:@"%@",dataDict[@"elevation"]];
        iObject.humidity = [NSString stringWithFormat:@"%@",dataDict[@"humidity"]];
        iObject.lat = [NSString stringWithFormat:@"%@",dataDict[@"lat"]];
        iObject.lng = [NSString stringWithFormat:@"%@",dataDict[@"lng"]];
        iObject.observation = dataDict[@"observation"];
        iObject.stationName = dataDict[@"stationName"];
        iObject.temperature = dataDict[@"temperature"];
        iObject.weatherCondition = dataDict[@"weatherCondition"];
        iObject.weatherConditionCode = dataDict[@"weatherConditionCode"];
        iObject.windDirection = [NSString stringWithFormat:@"%@",dataDict[@"windDirection"]];
        iObject.windspeed = [NSString stringWithFormat:@"%@",dataDict[@"windSpeed"]];
    }];
    
    NSError *error = nil;
    return [APP_DELEGATE.managedObjectContext save:&error];
}


+ (NSArray *)fetchData
{
    
    __block NSArray *array;
    [APP_DELEGATE.managedObjectContext performBlockAndWait:^{
        NSError *error = nil;
        NSFetchRequest *request = [NSFetchRequest new];
        request.entity = [NSEntityDescription entityForName:@"Weather" inManagedObjectContext:APP_DELEGATE.managedObjectContext];
        array = [APP_DELEGATE.managedObjectContext executeFetchRequest:request error:&error];
    }];
    return IS_EMPTY_ARRAY(array) ? @[] : array;

}

+ (void)deleteData
{
   
    NSArray *dataArray = [Weather fetchData];
    [APP_DELEGATE.managedObjectContext performBlockAndWait:^{
        for (Weather *iObject in dataArray) {
            [APP_DELEGATE.managedObjectContext deleteObject:iObject];
        }
    }];
    NSError *error = nil;
    [APP_DELEGATE.managedObjectContext save:&error];
}

@end
