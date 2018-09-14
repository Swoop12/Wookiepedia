//
//  Person.m
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    if (self){
        _name = dictionary[@"name"];
        _homeworldURL = dictionary[@"homeworld"];
        _massString = dictionary[@"mass"];
        _heightString = dictionary[@"height"];
        _species = dictionary[@"species"];
    }
    return self;
}

@end
