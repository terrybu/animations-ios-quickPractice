//
//  ViewController.m
//  Animations Practice
//
//  Created by Terry Bu on 2/18/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //GREEN SQUARE TRAVEL TO OTHER SIDE ANIMATION
    
    CGRect rect = CGRectMake(30, 30, 100, 100);
    UIView *terrySquare = [[UIView alloc]initWithFrame:rect];
    terrySquare.backgroundColor = [UIColor greenColor];
    [self.view addSubview:terrySquare];
    
    //You can do cool things with options under UIView animateWithDurations
    
    //UIViewAnimationOptionRepeat - repeat indefinitely
    //UIViewAnimationOptionAutoReverse - reverses once when complete
    
    //Curve Ease In is exponentially increase in speed
    //Curve Ease Out is expontentially decrease in speed
    //Curve Ease In/Out is speed up in the beginning then decrease towards the end
    
    [UIView animateWithDuration:3.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        terrySquare.frame = CGRectMake(self.view.frame.size.width-100,self.view.frame.size.height-100,100,100);
    }
        completion:^(BOOL finished) {
            NSLog(@"we donezo");
    }];
    

    
    //How to draw something like a line
    //You need to do it inside UIVIEW and not inside a viewcontroller.
    //Do it inside drawRect of your custom view and set your vc's view to that custom view - you can do directly in storyboard
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
