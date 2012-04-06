//
//  View.m
//  Tiranga
//
//  Created by Rudy Pospisil on 03/04/12.
//  Copyright (c) 2012 rudypospisil@gmail.com. All rights reserved.
//

#import "View.h"
#import "TirangaPuck.h"

@implementation View

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        //setup puck.
        int imageWidth = 95;
        CGFloat x = self.bounds.size.width/2 - imageWidth/2;
        CGFloat y = self.bounds.size.height/2 - imageWidth/2;
        CGRect f = CGRectMake(x, y, 95, 95);
        tirangaPuck = [[TirangaPuck alloc] initWithFrame: f];
        [self addSubview: tirangaPuck];
        tirangaPuck.backgroundColor = [UIColor clearColor];
    }
    return self;
}

/*
- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
        tirangaPuck.center = point;	//Move the tirangaPuck to a new location.
    }
}
*/
- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	tirangaPuck.center = [[touches anyObject] locationInView: self];
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //just to see coord, dim
    NSLog(@"self.frame == (%g, %g), %g × %g",
      self.frame.origin.x,
          self.frame.origin.y,
          self.frame.size.width,
          self.frame.size.height
          );
    NSLog(@"self.bounds == (%g, %g), %g × %g",
          self.bounds.origin.x,
          self.bounds.origin.y,
          self.bounds.size.width,
          self.bounds.size.height
          );
    
    //set up the tricolor.
    //white set using background colour.
    //other 2 colors sit on top.
    CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
    CGContextRef c = UIGraphicsGetCurrentContext();    
    //saffron orange
    CGContextAddRect(c, CGRectMake( 0 * w / 3, 0, w / 3, h));
    CGContextSetRGBFillColor(c, 0.95, 0.55, 0.18, 1.0);
	CGContextFillPath(c);
    //green
    CGContextAddRect(c, CGRectMake( ((w / 3) * 2), 0, w / 3, h));
    CGContextSetRGBFillColor(c, 0.00, 0.51, 0.31, 1.0);
	CGContextFillPath(c);
    
/*    
    //solid blue circle. supplanted by png.
    //to serve as the goal.
    CGRect bounds = self.bounds;
    CGFloat radius = .14 * bounds.size.width;
    //bounding square
    CGRect r = CGRectMake(
      bounds.origin.x + (( bounds.size.width / 2 ) - radius),
      bounds.origin.y + (( bounds.size.height / 2 ) - radius),
      2 * radius,
      2 * radius
    );
    CGContextBeginPath(c);
    CGContextAddEllipseInRect (c, r);
    CGContextSetRGBFillColor(c, 0.0, 0.0, 0.5, 0.5); //navy blue, 50% opacity.
    CGContextFillPath(c);
*/
    
    //this is the ashok chakra. layers on top of previous solid circle.
    UIImage *image = [UIImage imageNamed: @"logo_indiaFlag.png"];  //95px^2
    if (image == nil) {
        NSLog(@"could not find the image");
        return;
    }    
    
    //using upper left corner of image, center image.
    CGPoint point = CGPointMake(
                                (w - image.size.width) / 2,
                                (h - image.size.height) / 2
                                );
    
    [image drawAtPoint: point];
    
    UIFont *font = [UIFont systemFontOfSize: 36];
    // [@"BHARAT" drawAtPoint: CGPointZero withFont: font];
    //taking a break. Will return soon.
    NSString *string = @"भारत";
    CGPoint point2 = CGPointMake(124.0, 330.0);
    [string drawAtPoint: point2 withFont: font];

}

@end
