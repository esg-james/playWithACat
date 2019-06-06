//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "LPGCat.h"

@interface LPGViewController ()

@property (nonatomic) UIImageView *petImageView;
@property (strong, nonatomic) UIView *redBox;
@property (strong, nonatomic) UIPanGestureRecognizer *panRecog;



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
    
    self.panRecog = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(redBoxPanned:)];
    [self.petImageView addGestureRecognizer:self.panRecog];
    self.petImageView.userInteractionEnabled = YES;
   
    //[self.petImageView layoutIfNeeded];
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

@end
