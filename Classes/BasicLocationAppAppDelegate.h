//
//  BasicLocationAppAppDelegate.h
//  BasicLocationApp
//
//  Created by Brandon Alexander on 5/22/10.
//  Copyright While This, inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BasicLocationAppViewController;

@interface BasicLocationAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BasicLocationAppViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BasicLocationAppViewController *viewController;

@end

