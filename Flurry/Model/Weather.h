//
//  Weather.h
//  Flurry
//
//  Created by Durgesh Gupta on 12/30/15.
//  Copyright © 2015 Durgesh Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Weather : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+ (BOOL)insertWithData:(NSDictionary *)dataDict;
+ (NSArray *)fetchData;
@end

NS_ASSUME_NONNULL_END

#import "Weather+CoreDataProperties.h"
