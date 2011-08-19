//
//  VideoViewController.m
//  tvselangor
//
//  Created by TENGKU KAMAL FAIZAL on 8/13/11.
//  Copyright 2011 ILAUNCH SDN BHD. All rights reserved.
//

#import "VideoViewController.h"
#import "Parser.h"
#import "DetailViewController.h"

@interface VideoViewController (PrivateMethods)
- (void)loadData;
@end

@implementation VideoViewController

@synthesize activityIndicator, items;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	indicator.hidesWhenStopped = YES;
	[indicator stopAnimating];
	self.activityIndicator = indicator;
	[indicator release];
	
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:indicator];
	self.navigationItem.rightBarButtonItem = rightButton;
	[rightButton release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self loadData];
    [super viewDidAppear:animated];
}

- (void)loadData {
	if (items == nil) {
		[activityIndicator startAnimating];
		
		Parser *rssParser = [[Parser alloc] init];
		[rssParser parseRssFeed:@"http://feeds2.feedburner.com/TheMdnShow" withDelegate:self];
		
		[rssParser release];
		
	} else {
		[self.tableView reloadData];
	}
	
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source
- (void)receivedItems:(NSArray *)theItems {
	items = theItems;
	[self.tableView reloadData];
	[activityIndicator stopAnimating];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	
	cell.textLabel.text = [[items objectAtIndex:indexPath.row] objectForKey:@"title"];
	
	// Format date
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];	
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	
	cell.detailTextLabel.text = [dateFormatter stringFromDate:[[items objectAtIndex:indexPath.row] objectForKey:@"date"]];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *theItem = [items objectAtIndex:indexPath.row];
    DetailViewController *nextController = [[DetailViewController alloc] initWithItem:theItem];
    [self.navigationController pushViewController:nextController animated:YES];
    [nextController release];
}

@end
