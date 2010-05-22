//
//  BasicLocationAppViewController.h
//  BasicLocationApp
//
//  Created by Brandon Alexander on 5/22/10.
//  Copyright While This, inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface BasicLocationAppViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
	MKMapView *myMapView;
	
	CLLocationManager *locationManager;
	
	BOOL mapLoaded;
	BOOL firstPinPlaced;
}

@property (nonatomic, retain) IBOutlet MKMapView *myMapView;
@property (nonatomic, retain) CLLocationManager *locationManager;

@end

