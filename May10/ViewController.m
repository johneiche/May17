//
//  ViewController.m
//  May10
//
//  Created by John Eiche on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "ViewController.h"
#import "View.h"
#import "ModalViewController.h"
#import "May10AppDelegate.h"


@implementation ViewController
@synthesize image;
@synthesize title;

/*
 - (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil
 {
 self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */


- (id) initWithTitle: (NSString *) title image: (NSString *) image {
	self = [super initWithNibName: nil bundle: nil];
	if (self != nil) {
		// Custom initialization
		self.title = title;
        self.image = image;
        self.navigationItem.prompt =
        [NSString stringWithFormat: @"Welcome to %@.", self.title];        
        //NSString *image = image;
        //NSLog(@"VC initWithTitle picture is %@", image);
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"Next animal"
                                                                                  style: UIBarButtonItemStylePlain
                                                                                 target: self
                                                                                 action: @selector(nextStation)
                                                  ];        
	}
	return self;
}

- (void) nextStation {
	UIApplication *application = [UIApplication sharedApplication];
	May10AppDelegate *applicationDelegate = application.delegate;
	[applicationDelegate nextStation];
}


- (void) presentModalViewController {
    /*
     ModalViewController *modalViewController =
     [[ModalViewController alloc] initWithNibName: nil bundle: nil];    
     [self presentModalViewController: modalViewController animated: YES];
     */
    ///*
   //  ModalViewController *modalViewController =
   //  [[ModalViewController alloc] initWithNibName: nil bundle: nil];
     
    ModalViewController *modalViewController =
      [[ModalViewController alloc] initWithTitle: self.title];    
    
     UINavigationController *navigationController =
     [[UINavigationController alloc] initWithRootViewController: modalViewController];
     
     [self presentModalViewController: navigationController animated: YES];
    // */
    /*
    [self presentModalViewController:
     [[UINavigationController alloc] initWithRootViewController:
      [[ModalViewController alloc] initWithNibName: nil bundle: nil]
      ]
                            animated: YES
     ];
     */
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
	self.view = [[View alloc] initWithFrame: frame controller: self];
                                      
   // NSLog(@" loadview image is %@", image);
    
  //  UINavigationController *navigationController =
  //  [[UINavigationController alloc] initWithRootViewController: viewController];
    
    
   // NSUInteger i = UINavigationController.viewControllers.count;
  //  imageName = [[NSString alloc] initWithFormat: @"cover_%d.jpg", i];
  //  UIImage *image = [UIImage imageNamed: @"cover_.jpg"];	//100 by 100
//	if (image == nil) {
//		NSLog(@"could not find the image");
//		return;
        
       
//		CGRect b = self.bounds;   
        
//	}
    
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
