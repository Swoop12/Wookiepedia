//
//  CategoryCollectionViewCell.h
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryCollectionViewCell : UICollectionViewCell

//Landing Pad
@property (nonatomic, readwrite) NSDictionary *category;

@end

NS_ASSUME_NONNULL_END
