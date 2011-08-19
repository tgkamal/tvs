//
//  VideoNextController.m
//  tvselangor
//
//  Created by TENGKU KAMAL FAIZAL on 8/19/11.
//  Copyright 2011 ILAUNCH SDN BHD. All rights reserved.
//

#import "VideoNextController.h"

@implementation VideoNextController

@synthesize item, itemTitle, itemDate, itemSummary;

- (id)initWithItem:(NSDictionary *)theItem {
	if (self = [super initWithNibName:@"VideoNextController" bundle:nil]) {
		self.item = theItem;
		self.title = [item objectForKey:@"title"];
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
    // Do any additional setup after loading the view from its nib.
    self.itemTitle.text = [item objectForKey:@"title"];
	
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];	
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	
	self.itemDate.text = [dateFormatter stringFromDate:[item objectForKey:@"date"]];
	
	[self.itemSummary loadHTMLString:[item objectForKey:@"summary"] baseURL:nil];
}



- (IBAction)playYoutube:(id)sender {
	NSURLRequest *request = [[NSURLRequest alloc]
							 initWithURL: [NSURL URLWithString: [item objectForKey:@"podcastLink"]]]; 
	
	[self.itemSummary loadRequest:request];
	[request release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
