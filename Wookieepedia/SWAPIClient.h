//
//  SWAPIClient.h
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SWAPIClient : NSObject

+(void)fetchAllCategoriesWithBlock:(void(^_Nullable)(NSArray<NSDictionary *> *categories))block;

@end

NS_ASSUME_NONNULL_END
