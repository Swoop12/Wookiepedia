//
//  SWAPIClient.h
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface SWAPIClient : NSObject

+(void)fetchAllCategoriesWithBlock:(void(^_Nullable)(NSArray<NSDictionary *> *categories))block;
+(void)fetchAllEntitiesForCategory:(NSDictionary *)category withBlock:(void(^_Nullable)(NSArray<Person *> * _Nullable people))block;
+(void)searchForPeopleWithSearchTerm:(NSString *)searchTerm withBlock:(void (^ _Nullable)(NSArray<Person *> *_Nullable people))block;

@end

NS_ASSUME_NONNULL_END
