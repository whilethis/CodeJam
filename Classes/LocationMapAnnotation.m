//
//  LocationMapAnnotation.m
//  BasicLocationApp
//
//  Created by Brandon Alexander on 5/22/10.
//  Copyright 2010 While This, inc. All rights reserved.
//

#import "LocationMapAnnotation.h"


@implementation LocationMapAnnotation
@synthesize coordinate, title, subtitle;

-(id) initWithCoordinate:(CLLocationCoordinate2D) newCoordinate{
	if(self = [super init]) {
		coordinate = newCoordinate;
	}
	
	return self;
}


@end
