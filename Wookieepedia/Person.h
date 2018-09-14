//
//  Person.h
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *homeworldURL;
@property (nonatomic, readonly, copy) NSString *massString;
@property (nonatomic, readonly, copy) NSString *heightString;
@property (nonatomic, readonly) NSArray<NSString *> *species;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
