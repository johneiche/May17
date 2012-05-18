//
//  May10AppDelegate.m
//  May10
//
//  Created by John Eiche on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "May10AppDelegate.h"
#import "ViewController.h"
#import "ModalViewController.h"



@implementation May10AppDelegate

@synthesize window = _window;
@synthesize bundle = bundle;
@synthesize filename = filename;
@synthesize url = url;

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions
{    
    
    
	names = [NSArray arrayWithObjects:
             @"Cat",
             @"Cow",
             @"Dog",
             @"Duck",
             @"Horse",
             @"Frog",
             @"Pig",
             @"Chicken",
             @"Lamb",
             @"Wolf",
            
             nil
             ];
    
	NSString *firstName = [names objectAtIndex: 0];
    NSString *firstImage = [NSString stringWithFormat: @"cover_%u.jpg", 0];
	ViewController *firstController = [[ViewController alloc] initWithTitle: firstName image: firstImage];
	visited = [NSMutableArray arrayWithObject: firstController];
    NSLog(@"appdelegate the image is %@", firstImage);
    //Seed the random number generator with a different seed
	//each time the app is run.
	srand(time(NULL));
    
    
    NSBundle *bundle = [NSBundle mainBundle];
	NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);	
    
	NSString *filename = [bundle pathForResource: [NSString stringWithFormat: firstName, 0] ofType: @"mp3"];
	NSLog(@"filename == \"%@\"", filename);
    
	NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
	NSLog(@"url == \"%@\"", url);
    
	OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
	}
    
    
    
    
	self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
	// Override point for customization after application launch.
    
	self.window.rootViewController =
    [[UINavigationController alloc] initWithRootViewController: [visited objectAtIndex: 0]];
    
	[self.window makeKeyAndVisible];
	return YES;
}


//Called when user touches a View.

- (void) nextStation {
    
	UINavigationController *navigationController =
    (UINavigationController *)self.window.rootViewController;
    
    ((UINavigationController *)self.window.rootViewController).toolbarHidden = NO;    
    
    
	NSUInteger i = navigationController.viewControllers.count;
	if (i == names.count) {
		//We are currently visiting the last station, and can go no further.
		return;
	}
    
	if (visited.count <= i) {
		//This station is being visited for the first time.
		[visited addObject:
         [[ViewController alloc] initWithTitle: [names objectAtIndex: i]
              image: [NSString stringWithFormat: @"cover_%u.jpg", i]]
         ];
       // NSLog(@"picture is %@", image);
        
	}
       
   
    
    
	[navigationController pushViewController: [visited objectAtIndex: i] animated: YES];
}



- (void) touchUpInside: (id) sender {
	//The sender is the button that was pressed.
    
	NSLog(@"The \"%@\" button was pressed.",
		  [sender titleForState: UIControlStateNormal]);
     NSBundle *bundle = [NSBundle mainBundle];
    NSString *filename = [bundle pathForResource: 
                          [NSString stringWithFormat: [sender titleForState: UIControlStateNormal], 0] ofType: @"mp3"];
	NSLog(@"filename == \"%@\"", [sender titleForState: UIControlStateNormal]);    
    NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
    //    NSLog(@"file is %@", [ModalViewController title] );
    
    OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
	}
    
	//AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	AudioServicesPlaySystemSound(sid);
     
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
