//
//  LocationMapAnnotation.h
//  BasicLocationApp
//
//  Created by Brandon Alexander on 5/22/10.
//  Copyright 2010 While This, inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LocationMapAnnotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	
	NSString *title;
	NSString *subtitle;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

-(id) initWithCoordinate:(CLLocationCoordinate2D) newCoordinate;

@end
