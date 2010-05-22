//
//  BrowserViewController.h
//  BasicLocationApp
//
//  Created by Brandon Alexander on 5/22/10.
//  Copyright 2010 While This, inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BrowserViewController : UIViewController {
	NSString *urlToLoad;
	UIWebView *browser;
	
	id delegate;
}

@property (nonatomic, retain) IBOutlet UIWebView *browser;
@property (nonatomic, retain) NSString *urlToLoad;
@property (nonatomic, retain) id delegate;

-(IBAction) donePressed;

@end
