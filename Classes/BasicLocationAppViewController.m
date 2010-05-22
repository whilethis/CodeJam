//
//  BasicLocationAppViewController.m
//  BasicLocationApp
//
//  Created by Brandon Alexander on 5/22/10.
//  Copyright While This, inc 2010. All rights reserved.
//

#import "BasicLocationAppViewController.h"
#import "BrowserViewController.h"
#import "LocationMapAnnotation.h"

@implementation BasicLocationAppViewController
@synthesize myMapView, locationManager;




/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	/*self.locationManager = [[CLLocationManager alloc] init];
	
	[locationManager setDelegate:self];
	[locationManager startUpdatingLocation];
	 */
	mapLoaded = NO;
	firstPinPlaced = NO;
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark -
#pragma mark CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	NSLog(@"New location updated at %@", [newLocation description]);

	
	MKCoordinateRegion region;
	region.center = [newLocation coordinate];
	region.span.latitudeDelta = 3;
	region.span.longitudeDelta = 3;
	
	[myMapView setRegion:region animated:YES];
	
	[myMapView setCenterCoordinate:[newLocation coordinate]];
	
	if(newLocation.horizontalAccuracy == kCLLocationAccuracyBest) {
		[manager stopUpdatingLocation];
		NSLog(@"Location updating stopped.");
	}
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
	
	if(!mapLoaded) {
		CLLocation *location = [[CLLocation alloc] initWithLatitude:33.80380914 longitude:-84.42138428];
		
		MKCoordinateRegion region;
		region.center = [location coordinate];
		region.span.latitudeDelta = 3;
		region.span.longitudeDelta = 3;
		
		[myMapView setRegion:region animated:YES];
		
		[myMapView setCenterCoordinate:[location coordinate]];
		
		mapLoaded = YES;
	}
	
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
	
	if(!firstPinPlaced) {
		LocationMapAnnotation *annotation = [[LocationMapAnnotation alloc] initWithCoordinate:myMapView.centerCoordinate];
		[annotation setTitle:@"Hi Steve"];
		[annotation setSubtitle:@"Welcome to Apple"];
		[myMapView addAnnotation:annotation];	
		[annotation release];
		
		firstPinPlaced = YES;
	}
}

#pragma mark -
#pragma mark UIResponder overrides

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"Handling touch event");
	for (UITouch *touch in touches) {
		CGPoint touchLocation = [touch locationInView:myMapView];
		
		CLLocationCoordinate2D location = [myMapView convertPoint:touchLocation toCoordinateFromView:myMapView];
		
		LocationMapAnnotation *annotation = [[LocationMapAnnotation alloc] initWithCoordinate:location];
		[annotation setTitle:@"Hi Steve"];
		[annotation setSubtitle:@"Welcome to Apple"];
		[myMapView addAnnotation:annotation];	
		[annotation release];
	}
}

#pragma mark -
#pragma mark MKMapViewDelegate Methods
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	NSLog(@"Let's return an MKAnnotationView here");
	MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"ReuseId"];
	
	if(annotationView == nil) {
		annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"ReuseId"];
	}
	
	[annotationView setCanShowCallout:YES];
	//Create a button to add to the callout
	UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	[rightButton addTarget:self
						action:@selector(showDetails:)
						forControlEvents:UIControlEventTouchUpInside];
	
	[annotationView setRightCalloutAccessoryView:rightButton];
	
	return annotationView;
}

-(void) showDetails:(id) sender {
	BrowserViewController *vc = [[BrowserViewController alloc] initWithNibName:@"BrowserViewController" bundle:nil];
	[vc setUrlToLoad:@"http://www.apple.com"];
	[vc setDelegate:self];
	[self presentModalViewController:vc animated:YES];
	
	[vc release];
}

-(void) removeModalView {
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Memory Management

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
    [super dealloc];
}

@end
