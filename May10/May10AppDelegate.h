//
//  May10AppDelegate.h
//  May10
//
//  Created by John Eiche on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID

@interface May10AppDelegate : UIResponder <UIApplicationDelegate>{
	UIWindow *_window;
	NSArray *names;
	NSMutableArray *visited;
    NSBundle *bundle;
    NSString *filename;
    NSURL *url;
    SystemSoundID sid;
   
}

- (void) nextStation;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSBundle *bundle;
@property (strong, nonatomic) NSString *filename;
@property (strong, nonatomic) NSURL *url;

@end
