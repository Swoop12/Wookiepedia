//
//  CategoryCollectionViewCell.m
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import "CategoryCollectionViewCell.h"

//Private @interface (header) file
@interface CategoryCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *categoryImageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end

@implementation CategoryCollectionViewCell

//DidSet gets called everytime we set the category property
-(void)setCategory:(NSDictionary *)category{
    
    _category = category;

    NSString * categoryName = category.allKeys.firstObject;
    self.categoryLabel.text = categoryName;
    self.categoryImageView.image = [UIImage imageNamed: categoryName];
}

@end
