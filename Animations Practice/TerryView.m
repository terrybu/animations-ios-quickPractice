//
//  TerryView.m
//  Animations Practice
//
//  Created by Terry Bu on 2/18/15.
//  Copyright (c) 2015 Terry Bu. All rights reserved.
//

#import "TerryView.h"

@implementation TerryView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self drawRedDiagonalLine:rect];
    [self drawZigzag:rect];
    [self drawCurvePractice:rect];
}

- (void) drawRedDiagonalLine: (CGRect) rect {
    // Drawing a red line diagonally with shadow
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //CGContext is like the drawing board, canvas for drawing things
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextBeginPath(ctx); //begin path makes sure that we are doing a new path
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    
    CGContextAddPath(ctx, path);
    CGContextSetStrokeColorWithColor(ctx,[UIColor redColor].CGColor);
    CGContextSetShadowWithColor(ctx, CGSizeMake(4,4), 4.0, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 2.0);
    CGContextStrokePath(ctx); //this actually "draws" and RENDERS the path on the context ...
    CGPathRelease(path); //release seems necessary because these CG objects are not managed by ARC
}

//test

- (void) drawZigzag: (CGRect) rect {
    //I want to draw a zigzag this second time
    //Think of it as a pen. You begin the path by starting from a point (movetopoint first time)
    //Then you add line or curve or whatever starting from that point to a destination)
    //Then you pick the pen up and move to a different starting point
    //When youa re done, you add the path to the context, stroke (render) it, and then we donezo
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGContextBeginPath(ctx); //new path
    CGPathMoveToPoint(path2, NULL, 100, 100);
    CGPathAddLineToPoint(path2, NULL, 120, 120);
    CGPathMoveToPoint(path2,NULL, 120, 120);
    CGPathAddLineToPoint(path2, NULL, 140, 100);
    CGPathMoveToPoint(path2, nil, 140, 100);
    CGPathAddLineToPoint(path2,nil, 160, 120);
    CGPathMoveToPoint(path2, nil, 160, 120);
    CGPathAddLineToPoint(path2,nil, 200, 50);
    
    CGContextAddPath(ctx, path2);
    CGContextSetStrokeColorWithColor(ctx, [UIColor brownColor].CGColor);
    CGContextSetShadow(ctx, CGSizeMake(0,0), 0);
    
    CGContextStrokePath(ctx);
    CGPathRelease(path2);
}

- (void) drawCurvePractice: (CGRect) rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextBeginPath(context);
    CGPathMoveToPoint(path, NULL, 0, 300);
    CGPathAddCurveToPoint(path, NULL, 100, 100, 300, 200, rect.size.width, 300);
    CGContextAddPath(context, path);
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextStrokePath(context);
    CGPathRelease(path);
}



@end
