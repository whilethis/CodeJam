//
//  BasicLocationAppAppDelegate.m
//  BasicLocationApp
//
//  Created by Brandon Alexander on 5/22/10.
//  Copyright While This, inc 2010. All rights reserved.
//

#import "BasicLocationAppAppDelegate.h"
#import "BasicLocationAppViewController.h"

@implementation BasicLocationAppAppDelegate

@synthesize window, viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
