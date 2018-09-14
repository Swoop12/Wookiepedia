//
//  EntityTableViewCell.h
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntityTableViewCell : UITableViewCell

@property (nonatomic, readwrite) Person *person;

@end

NS_ASSUME_NONNULL_END
