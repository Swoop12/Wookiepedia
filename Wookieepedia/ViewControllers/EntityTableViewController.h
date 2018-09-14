//
//  EntityTableViewController.h
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "SWAPIClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntityTableViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, readwrite) NSDictionary *category;
@property (nonatomic, readwrite) NSArray<Person *> *people;


@end

NS_ASSUME_NONNULL_END
