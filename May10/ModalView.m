//
//  ModalView.m
//  May10
//
//  Created by John Eiche on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModalView.h"
#import "ModalViewController.h"


@implementation ModalView


/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
*/
 
 
- (id) initWithFrame: (CGRect) frame controller: (ModalViewController *) c {
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor orangeColor];
		self.textAlignment = UITextAlignmentCenter;
		//self.text = @"ModalView";
        //self.text = NSStringFromClass([self class]);        
		self.userInteractionEnabled = YES;
		modalViewController = c;
        
        
        button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        //Center the button in the view.
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(200, 40);	//size of button
        
		button.frame = CGRectMake(
                                  b.origin.x + (b.size.width - s.width) / 2,
                                  b.origin.y + (b.size.height - s.height) / 2,
                                  s.width,
                                  s.height
                                  );
        
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[button setTitle: [modalViewController title] forState: UIControlStateNormal];
        
		[button addTarget: [UIApplication sharedApplication].delegate
                   action: @selector(touchUpInside:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        
		[self addSubview: button];       
        
        
        
        
        
        
       // NSLog(@"the title is %@", [modalViewController title]);
        
	}
	return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
 ;        
}
*/

@end
