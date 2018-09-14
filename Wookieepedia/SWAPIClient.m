//
//  SWAPIClient.m
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import "SWAPIClient.h"

@implementation SWAPIClient

+ (NSURL *)baseUrl{
    return [[NSURL alloc] initWithString:@"https://swapi.co/api/"];
}

+(void)fetchAllCategoriesWithBlock:(void(^_Nullable)(NSArray<NSDictionary *> *categories))block{
    
    NSLog(@"%@", [SWAPIClient baseUrl]);
    [[[NSURLSession sharedSession] dataTaskWithURL:[SWAPIClient baseUrl] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"NO DATA AVAILABLE");
            block(nil);
            return;
        }
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSMutableArray<NSDictionary *> *categories = [[NSMutableArray alloc] init];
        for (id key in dictionary){
            NSDictionary *categoryDict = [[NSDictionary alloc] initWithObjectsAndKeys:dictionary[key],key, nil];
            [categories addObject:categoryDict];
        }
        block(categories);
        
    }] resume];
}

@end
