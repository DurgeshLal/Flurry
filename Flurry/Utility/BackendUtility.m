//
//  BackendUtility.m
//  Flurry
//
//  Created by Durgesh Gupta on 12/30/15.
//  Copyright © 2015 Durgesh Gupta. All rights reserved.
//

#import "BackendUtility.h"

@implementation BackendUtility

+ (void)requestWithURL:(NSString *)url andCompletionBlock:(receivedData)compblock
{
    
    NSString *urlString =[NSString stringWithFormat:@"%@",url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setHTTPMethod:@"GET"];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
        // handle response
        if (data == nil) {
            return;
        }
        NSError *jsonError;
        
        id dict =
        [NSJSONSerialization JSONObjectWithData:data
                                        options:NSJSONReadingAllowFragments
                                          error:&jsonError];
        
        
        
        if (!jsonError )
        {
            compblock(dict);
        }
        else
        {
            compblock(dict);
        }
    }] resume];
    
    
}

@end
