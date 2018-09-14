//
//  EntityTableViewCell.m
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import "EntityTableViewCell.h"

@interface EntityTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *personImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation EntityTableViewCell

-(void)setPerson:(Person *)person{
    _person = person;
    
    UIImage *personImage = [UIImage imageNamed:person.name.lowercaseString];
    UIImage *chewyImage = [UIImage imageNamed:@"chewbacca"];
    
    if (personImage){
        self.personImageView.image = personImage;
    } else{
        self.personImageView.image = chewyImage;
    }
    
    self.nameLabel.text = person.name;
}

@end
