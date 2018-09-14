//
//  CategoryCollectionViewCell.m
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import "CategoryCollectionViewCell.h"

@interface CategoryCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *categoryImageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;


@end

@implementation CategoryCollectionViewCell

-(NSString *)categoryName{
    return _category.allKeys.firstObject;
}

-(void)setCategory:(NSDictionary *)category{
    
    NSString * categoryName = category.allKeys.firstObject;
    self.categoryLabel = categoryName;
    self.categoryImageView.image = [UIImage imageNamed: categoryName];
}

@end
