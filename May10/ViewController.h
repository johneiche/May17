//
//  ViewController.h
//  May10
//
//  Created by John Eiche on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSString *image;
    NSString *title;
}

- (id) initWithTitle: (NSString *) title image: (NSString *) image;
- (void) nextStation;
- (void) presentModalViewController;

@property (strong, nonatomic) NSString *image;
@end
