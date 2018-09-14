//
//  CategoresCollectionViewController.m
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import "CategoresCollectionViewController.h"
#import "CategoryCollectionViewCell.h"
#import "SWAPIClient.h"

@interface CategoresCollectionViewController ()

@end

@implementation CategoresCollectionViewController

static NSString * const reuseIdentifier = @"categoryCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SWAPIClient fetchAllCategoriesWithBlock:^(NSArray<NSDictionary *> * _Nonnull categories) {
        
        self.categories = categories;
        
    }];
}

-(void)setCategories:(NSArray *)categories{
    _categories = categories;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.categories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSDictionary *category = _categories[indexPath.row];
//    NSString *categoryName = category.allKeys.firstObject;
//    UIImage * categoryImage = [UIImage imageNamed:categoryName];
    cell.category = category;
    return cell;
}


@end
