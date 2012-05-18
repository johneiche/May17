//
//  View.m
//  May10
//
//  Created by John Eiche on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "ViewController.h"
#import "May10AppDelegate.h"
#import "View.h"

@implementation View
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
- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c
              
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		//self.backgroundColor = [UIColor whiteColor];
        self.backgroundColor =
        [UIColor colorWithRed: (CGFloat)rand() / RAND_MAX
                        green: (CGFloat)rand() / RAND_MAX
                         blue: 1.0
                        alpha: 1.0
         ];
      //   self.text = NSStringFromClass([self class]);      
        
        NSString *string = @"More Info";
        UIFont *font = [UIFont fontWithName: @"Courier" size: 16];
		CGSize size = [string sizeWithFont: font];            
      //*  
        //Put upper left corner of label in upper left corner of View.
		//Make label just big enough to hold the string.
		CGRect f = CGRectMake(
                              self.bounds.origin.x,
                              self.bounds.origin.y,
                              size.width,
                              size.height
                              );
        
            
		label = [[UILabel alloc] initWithFrame: f];
		label.backgroundColor = [UIColor whiteColor];
		label.font = font;
		label.text = string; 
		[self addSubview: label];        
        
     //   NSString *picture = c.image;
     //   NSLog(@" view the picture is %@", picture);
		//label.font = [UIFont fontWithName: @"Courier" size: 16];
		//self.editable = NO;
        
       // self.textAlignment = UITextAlignmentCenter;
		//self.text = @"MainView";
      // */
       // self.text = NSStringFromClass([self class]);
		self.userInteractionEnabled = YES; //Make it touch-sensitive.
        
          
		viewController = c;
       // NSString *picture = c.image;
        NSLog(@" view the picture is %@", [viewController image]);
               
        UIImage *image = [UIImage imageNamed: [viewController image]];	//225 by 225
        if (image == nil) {
            NSLog(@"could not find the image");
            return;
        }
        
    //    UIImage *imageView = [[UIImage alloc] initWithFrame: imageFrame ];
        //upper left corner of image
        //*
   //     CGPoint point = CGPointMake(
   //                                self.bounds.origin.x + 225 / 2,
   //                                self.bounds.origin.y + 225 / 2
   //                                 );
     //   CGContextRef cr = UIGraphicsGetCurrentContext();
    //    [image drawAtPoint: point];        
       // */
	}
	return self;
}



- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	[viewController presentModalViewController];
}


//*

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
 UIImage *image = [UIImage imageNamed: [viewController image]];	//225 by 225
 if (image == nil) {
 NSLog(@"could not find the image");
 return;
 }
 
     UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
 //
    //*
    imageView.center =  CGPointMake(
                                    self.bounds.size.width / 2,
                                    self.bounds.size.height  / 2
                                    );
    
    //NSLog(@"image center is %f, %f", imageView.center.x, imageView.center.y);
    [self addSubview: imageView];                               
                                    
   /*
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController: viewController];        
    
    NSString *imageName;
    NSUInteger i = navigationController.viewControllers.count;
    imageName = [[NSString alloc] initWithFormat: @"cover_%d.jpg", i];
    UIImage *image = [UIImage imageNamed: imageName];	//
    
    NSLog(@"image name == %@", imageName);
    
    if (image == nil) {
        NSLog(@"could not find the image");
        return;
    }
    
    
    //upper left corner of image
    CGPoint point = CGPointMake(0,0);
    CGContextRef cr = UIGraphicsGetCurrentContext();
    
    [image drawAtPoint: point];        
    
    
    //Center the image in the view.
    CGRect b = self.bounds;
    
    */ 
}


@end
