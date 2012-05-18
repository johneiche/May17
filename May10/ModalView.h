//
//  ModalView.h
//  May10
//
//  Created by John Eiche on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>

@class ModalViewController;


@interface ModalView: UILabel {
	ModalViewController *modalViewController;
    UIButton *button;
}

- (id) initWithFrame: (CGRect) frame controller: (ModalViewController *) c;
@end



