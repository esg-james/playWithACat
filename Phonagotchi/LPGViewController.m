//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "LPGCat.h"
#import "LPGNewApple.h"

@interface LPGViewController ()

@property (nonatomic) UIImageView *petImageView;
@property (nonatomic) UIImageView *appleView;
@property (nonatomic) UIImageView *bucketView;
@property (nonatomic) UIImageView *theApple;
@property (strong, nonatomic) UIView *redBox;
@property (strong, nonatomic) UIPanGestureRecognizer *panRecog;
@property (strong, nonatomic) UIPinchGestureRecognizer *pinchRecog;
@property (strong, nonatomic) UIPinchGestureRecognizer *pinchGestureRecognizer;



@end

@implementation LPGViewController {
    LPGCat *cat;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    cat = [[LPGCat alloc]init];
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.petImageView.image = [UIImage imageNamed:@"default"];
    [self.view addSubview:self.petImageView];
    
    self.bucketView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bucketView.translatesAutoresizingMaskIntoConstraints = NO;
    self.bucketView.image = [UIImage imageNamed:@"bucket"];
    [self.view addSubview:self.bucketView];
    
    self.appleView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.appleView.translatesAutoresizingMaskIntoConstraints = NO;
    self.appleView.image = [UIImage imageNamed:@"apple"];
    [self.view addSubview:self.appleView];
    
    
    
    
    
    //cat constraint
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    
    //apple constraint
    [NSLayoutConstraint constraintWithItem:self.appleView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:0.15
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:0.2
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:0.9
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleView
                                 attribute:NSLayoutAttributeLeadingMargin
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeadingMargin
                                multiplier:2.1
                                  constant:0.0].active = YES;
    
    //bucketview
    [NSLayoutConstraint constraintWithItem:self.bucketView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:0.5
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.bucketView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:0.25
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.bucketView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.bucketView
                                 attribute:NSLayoutAttributeLeadingMargin
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeadingMargin
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    
    self.panRecog = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(redBoxPanned:)];
    self.pinchRecog = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [self.petImageView addGestureRecognizer:self.panRecog];
    [self.appleView addGestureRecognizer:self.pinchRecog];
    self.petImageView.userInteractionEnabled = YES;
    self.appleView.userInteractionEnabled = YES;
    
}


- (void)redBoxPanned:(UIPanGestureRecognizer *)recog {
    CGPoint velocity = [self.panRecog velocityInView:self.petImageView];
    
    if ([cat changeCatMood:velocity]) {
        self.petImageView.image = [UIImage imageNamed:@"grumpy"];
    }
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.petImageView.image = [UIImage imageNamed:@"default"];
    });
    
    
    

}
- (void)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    CGPoint point;
    point = recognizer.view.center;
    if(recognizer.state == UIGestureRecognizerStateBegan) {
        
        point = [recognizer locationInView:self.view];
        self.theApple = [LPGNewApple newApple: point];
        
        [self.view addSubview:self.theApple];
        
        [NSLayoutConstraint constraintWithItem:self.theApple attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.30 constant:0.0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:self.theApple attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.theApple attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0].active = YES;
        
        self.theApple.hidden = NO;
        
        
        
    } else if (recognizer.state == UIGestureRecognizerStateChanged){
        
        point = [recognizer locationInView:self.view];
        self.theApple.center = point;
        
    }
    
}

@end
