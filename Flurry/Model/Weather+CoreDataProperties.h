//
//  Weather+CoreDataProperties.h
//  Flurry
//
//  Created by Durgesh Gupta on 12/30/15.
//  Copyright © 2015 Durgesh Gupta. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Weather.h"

NS_ASSUME_NONNULL_BEGIN

@interface Weather (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *icao;
@property (nullable, nonatomic, retain) NSString *clouds;
@property (nullable, nonatomic, retain) NSString *cloudsCode;
@property (nullable, nonatomic, retain) NSString *countryCode;
@property (nullable, nonatomic, retain) NSString *dateTime;
@property (nullable, nonatomic, retain) NSString *dewPoint;
@property (nullable, nonatomic, retain) NSString *elevation;
@property (nullable, nonatomic, retain) NSString *humidity;
@property (nullable, nonatomic, retain) NSString *lat;
@property (nullable, nonatomic, retain) NSString *lng;
@property (nullable, nonatomic, retain) NSString *observation;
@property (nullable, nonatomic, retain) NSString *stationName;
@property (nullable, nonatomic, retain) NSString *temperature;
@property (nullable, nonatomic, retain) NSString *weatherCondition;
@property (nullable, nonatomic, retain) NSString *weatherConditionCode;
@property (nullable, nonatomic, retain) NSString *windDirection;
@property (nullable, nonatomic, retain) NSString *windspeed;

@end

NS_ASSUME_NONNULL_END
