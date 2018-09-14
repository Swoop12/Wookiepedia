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
    
    //1) Contruct your URL
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
        
        //for (key, value) in dictionary
        for (id key in dictionary){
            NSDictionary *categoryDict = [[NSDictionary alloc] initWithObjectsAndKeys:dictionary[key],key, nil];
            [categories addObject:categoryDict];
        }
        block(categories);
        
    }] resume];
}

+(void)fetchAllEntitiesForCategory:(NSDictionary *)category withBlock:(void(^_Nullable)(NSArray<Person *> *_Nullable people))block{
    
    //1) Contruct the URL
    NSURL *url = [[NSURL alloc] initWithString:category.allValues.firstObject];
    
    NSLog(@"🤯   %@   🤯", url);
    
    //2) DataTask, Serialization, resume.
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
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
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *peopleDictionaries = jsonDictionary[@"results"];
        
        NSMutableArray *peopleArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *personDict in peopleDictionaries){
            Person * person = [[Person alloc] initWithDictionary:personDict];
            [peopleArray addObject:person];
        }
        block(peopleArray);
    }] resume];
    
    
}


+(void)searchForPeopleWithSearchTerm:(NSString *)searchTerm withBlock:(void (^ _Nullable)(NSArray<Person *> *_Nullable people))block{
    
    //1) Contruct the URL
    NSURL *url = [[SWAPIClient baseUrl] URLByAppendingPathComponent:@"people"];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:YES];
    NSURLQueryItem *querryItem = [[NSURLQueryItem alloc] initWithName:@"search" value:searchTerm];
    components.queryItems = [[NSArray alloc] initWithObjects: querryItem, nil];
    NSURL *finishedUrl = components.URL;
    
    NSLog(@"%@", finishedUrl);
    
    //2) DataTask, Serialzation, completion, and resume
    [[[NSURLSession sharedSession] dataTaskWithURL:finishedUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
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
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *peopleDictionaries = jsonDictionary[@"results"];
        
        NSMutableArray *peopleArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *personDict in peopleDictionaries){
            Person * person = [[Person alloc] initWithDictionary:personDict];
            [peopleArray addObject:person];
        }
        block(peopleArray);
        
    }] resume];
}

@end
