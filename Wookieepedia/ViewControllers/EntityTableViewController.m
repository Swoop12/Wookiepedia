//
//  EntityTableViewController.m
//  Wookieepedia
//
//  Created by DevMountain on 9/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

#import "EntityTableViewController.h"

#import "EntityTableViewCell.h"


#import "Wookieepedia-Swift.h"

@interface EntityTableViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

@implementation EntityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
}

//Did set on our category property in the header
-(void)setCategory:(NSDictionary *)category{
    _category = category;
    
    [SWAPIClient fetchAllEntitiesForCategory:category withBlock:^(NSArray<Person *> * _Nullable people) {
        self.people = people;
    }];
}

-(void)setPeople:(NSArray<Person *> *)people{
    _people = people;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self tableView] reloadData];
    });
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [SWAPIClient searchForPeopleWithSearchTerm:searchText withBlock:^(NSArray<Person *> * _Nullable people) {
        self.people = people;
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EntityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entityCell" forIndexPath:indexPath];
    Person *person = self.people[indexPath.row];
    cell.person = person;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EntityDetailViewController *destinationVC = [segue destinationViewController];
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
    Person *person = self.people[indexPath.row];
    destinationVC.person = person;
}


@end
