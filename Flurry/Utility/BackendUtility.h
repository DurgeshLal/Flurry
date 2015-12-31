//
//  BackendUtility.h
//  Flurry
//
//  Created by Durgesh Gupta on 12/30/15.
//  Copyright © 2015 Durgesh Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^receivedData)(id receivedData);

@interface BackendUtility : NSObject

+ (void)requestWithURL:(NSString *)url andCompletionBlock:(receivedData)compblock;

@end
