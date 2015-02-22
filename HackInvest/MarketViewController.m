//
//  MarketViewController.m
//  HackInvest
//
//  Created by Lucien on 2015/2/21.
//  Copyright (c) 2015年 Lucien. All rights reserved.
//

#import "MarketViewController.h"
#import <CoreData/CoreData.h>

@interface MarketViewController ()

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - fetched results controller

-(NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController) {
        return _fetchedResultsController;
    }
    NSEntityDescription *entity
    = [NSEntityDescription entityForName:@"Post"
                  inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = entity;

    
    NSFetchedResultsController *aFetchedResultsController
    = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                          managedObjectContext:self.managedObjectContext
                                            sectionNameKeyPath:nil
                                                     cacheName:nil];
    _fetchedResultsController = aFetchedResultsController;
    
    NSError *e = nil;
    if (![_fetchedResultsController performFetch:&e]) {
        NSLog(@"fetch error: %@", [e localizedDescription]);
        abort();
    }
    
    return _fetchedResultsController;
}

#pragma mark - table view data source

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> info
    = self.fetchedResultsController.sections[section];
    return [info numberOfObjects];
}

// configure the custom table view cell
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // find the model
    NSManagedObject *post
    = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // dequeue a table view cell
    UITableViewCell *cell
    = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                      forIndexPath:indexPath];
    
    // set its title label (tag #1)
    UILabel *title = (UILabel *)[cell viewWithTag:1];
    title.text = [post valueForKey:@"title"];
    
    // set its author label (tag #2)
    UILabel *author = (UILabel *)[cell viewWithTag:2];
    author.text = [post valueForKeyPath:@"author.name"];
    
    return cell;
}
@end

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
