//
//  BrowserViewController.m
//  BasicLocationApp
//
//  Created by Brandon Alexander on 5/22/10.
//  Copyright 2010 While This, inc. All rights reserved.
//

#import "BrowserViewController.h"


@implementation BrowserViewController
@synthesize browser, urlToLoad, delegate;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:[self urlToLoad]]];
	
	[browser loadRequest:req];
	
	[req release];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(IBAction) donePressed {
	[delegate removeModalView];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[urlToLoad release];
	[browser release];
	[delegate release];
	
    [super dealloc];
}


@end
