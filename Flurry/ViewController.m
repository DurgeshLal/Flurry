//
//  ViewController.m
//  Flurry
//
//  Created by Durgesh Gupta on 12/30/15.
//  Copyright © 2015 Durgesh Gupta. All rights reserved.
//


#import "WeatherDataManager.h"
#import "ViewController.h"
#import "Weather.h"

#import "Constant.h"

@interface ViewController (){
    NSArray *dataArray;
}

@property (strong, nonatomic) IBOutlet UITextView *txtWeather;
@end

@implementation ViewController


- (void)apiCall
{
    
    __block ViewController *weakSelf = self;
    [[WeatherDataManager sharedManager]fetchWeatherWithURLString:WEATHER_API CompletionHandler:^(BOOL success) {
        
        if (success) {
            dataArray = [Weather fetchData];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf updateUI];
            });
        }
        
    }];
}

-(void)updateUI
{
    // Early exit if data array is empty.
    if (IS_EMPTY_ARRAY(dataArray)) {
        return;
    }
    Weather *weatherObject = (Weather *)dataArray[0];

    self.txtWeather.text = [NSString stringWithFormat:@"ICAO: %@ \nClouds: %@ \nCloudsCode: %@ \nDateTime: %@ \nDewPoind: %@ \nElevation: %@ \nHumidity: %@ \nLat: %@\nLong: %@\nObservation: %@\nStationName: %@\nTemprature: %@\nWeatherCondition: %@\nWeatherConditionCode: %@\nWindDirection:  %@\nWindSpeed:  %@" ,weatherObject.icao, weatherObject.clouds,weatherObject.cloudsCode, weatherObject.dateTime,weatherObject.dewPoint,weatherObject.elevation,weatherObject.humidity,weatherObject.lat,weatherObject.lng,weatherObject.observation,weatherObject.stationName,weatherObject.temperature,weatherObject.weatherCondition,weatherObject.weatherConditionCode,weatherObject.windDirection,weatherObject.windspeed];
}
-(void)setUPCacheData
{
   dataArray = [Weather fetchData];
    [self updateUI];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUPCacheData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self apiCall];
}

@end
