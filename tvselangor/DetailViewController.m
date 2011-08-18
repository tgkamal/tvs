
#import "DetailViewController.h"


@implementation DetailViewController

@synthesize item, itemTitle, itemDate, itemSummary;

- (id)initWithItem:(NSDictionary *)theItem {
	if (self = [super initWithNibName:@"DetailViewController" bundle:nil]) {
		self.item = theItem;
		self.title = [item objectForKey:@"title"];
	}
	
	return self;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.itemTitle.text = [item objectForKey:@"title"];
	
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];	
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	
	self.itemDate.text = [dateFormatter stringFromDate:[item objectForKey:@"date"]];
	
	[self.itemSummary loadHTMLString:[item objectForKey:@"summary"] baseURL:nil];
}

- (IBAction)playPodcast:(id)sender {
	NSURLRequest *request = [[NSURLRequest alloc]
							 initWithURL: [NSURL URLWithString: [item objectForKey:@"podcastLink"]]]; 
	
	[self.itemSummary loadRequest:request];
	[request release];
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[item release];
	[itemTitle release];
	[itemDate release];
	[itemSummary release];
    [super dealloc];
}


@end
