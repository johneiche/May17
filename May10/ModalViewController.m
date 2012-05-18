//
//  ModalViewController.m
//  May10
//
//  Created by John Eiche on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModalViewController.h"
#import "ModalView.h"
#import "ViewController.h"

@implementation ModalViewController

/*
- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil
{
self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
if (self) {
    // Custom initialization
    //self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;	//default          
    self.modalTransitionStyle =  UIModalTransitionStyleFlipHorizontal;	
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle: @"Done"
                                     style: UIBarButtonItemStyleDone
                                    target: self
                                    action: @selector(dismissModalViewController)];        
   // NSLog(@"the title is %@", [viewController title]);
    }
return self;
}
*/

- (id)  initWithTitle: (NSString *) title 
{
    self = [super initWithNibName: nil bundle: nil];
    if (self) {
        // Custom initialization
        //self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;	//default   
        self.title = title;
        self.modalTransitionStyle =  UIModalTransitionStyleFlipHorizontal;	
        self.navigationItem.rightBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle: @"Done"
                                         style: UIBarButtonItemStyleDone
                                        target: self
                                        action: @selector(dismissModalViewController)];        
        // NSLog(@"the title is %@", [viewController title]);
    }
    return self;    
    
}



- (void) didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
    
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[ModalView alloc] initWithFrame: frame controller: self];
    // self.modalTransitionStyle =  UIModalTransitionStyleFlipHorizontal;	//default
    
}


- (void) dismissModalViewController {
	//Before iOS 5, we said parentViewController instead of presentingViewController.
    
	[self.presentingViewController dismissModalViewControllerAnimated: YES];
}


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void) viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void) viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
	// Return YES for supported orientations
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}
@end
