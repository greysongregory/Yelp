//
//  FiltersViewController.m
//  Yelp
//
//  Created by Greyson Gregory on 10/27/15.
//  Copyright © 2015 Grey. All rights reserved.
//

#import "FiltersViewController.h"
#import "SwitchCell.h"

@interface FiltersViewController () <UITableViewDataSource, UITableViewDelegate, SwitchCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *switchValues;
@end

@implementation FiltersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Filters";
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(onSearchTapped)];
    self.navigationItem.rightBarButtonItem = searchItem;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"SwitchCell" bundle:nil] forCellReuseIdentifier:@"switchCell"];
    
    self.tableView.rowHeight = 60;
    self.switchValues = [[NSMutableDictionary alloc] initWithCapacity:100] ;
    // Do any additional setup after loading the view from its nib.
}

- (void)onSearchTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"switchCell"];
    //cell.textLabel.text = @"hello";
    cell.delegate = self;

    NSNumber *value = self.switchValues[@(indexPath.row)];
    if (!value) {
        value = @(YES);
    }
    cell.cellSwitch.on = [value boolValue];

    return cell;
}

- (void) switchCell: (SwitchCell *)switchCell valueDidChange:(BOOL)value {
    NSLog(@"hey switch cell");
    NSIndexPath *indexPath = [self.tableView indexPathForCell:switchCell];
    self.switchValues[@(indexPath.row)] = @(value);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
