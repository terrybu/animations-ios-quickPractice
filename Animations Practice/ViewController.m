//
//  ViewController.m
//  Animations Practice
//
//  Created by Terry Bu on 2/18/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIView *terryGreenSquare;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //GREEN SQUARE TRAVEL TO OTHER SIDE ANIMATION
    [self makeAndShowGreenSquare];
    [self makeGreenSquareGoDiagonalBackAndForth];
    
    //How to draw something like a line using CGPath
    //you can't do it here
    //You need to do it inside UIVIEW and not inside a viewcontroller.
    //Do it inside drawRect of your custom view and set your vc's view to that custom view - you can do directly in storyboard
}

- (void) makeAndShowGreenSquare {
    CGRect rect = CGRectMake(0, 0, 100, 100);
    terryGreenSquare = [[UIView alloc]initWithFrame:rect];
    terryGreenSquare.backgroundColor = [UIColor greenColor];
    [self.view addSubview:terryGreenSquare];
}

- (void) makeGreenSquareGoDiagonalBackAndForth {
    //You can do cool things with options under UIView animateWithDuration
    //UIViewAnimationOptionRepeat - repeat indefinitely
    //UIViewAnimationOptionAutoReverse - reverses once when complete
    
    //Curve Ease In is exponentially increase in speed
    //Curve Ease Out is expontentially decrease in speed
    //Curve Ease In/Out is speed up in the beginning then decrease towards the end
    
    [UIView animateWithDuration:3.0 delay:0 options:(UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut) animations:^{
        //note the pipe syntax that lets you assign multiple animation options woot!
        terryGreenSquare.frame = CGRectMake(self.view.frame.size.width-100,self.view.frame.size.height-100,100,100);
    }
    completion:^(BOOL finished) {
        NSLog(@"we donezo");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
