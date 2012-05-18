//
//  View.h
//  May10
//
//  Created by John Eiche on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@interface View: UIView {
	ViewController *viewController;
    UILabel *label;
    UIImageView *coverImage;
}

- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c;
//image: (NSString *) image;


@end
