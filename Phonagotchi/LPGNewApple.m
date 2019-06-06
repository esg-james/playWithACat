//
//  LPGNewApple.m
//  Phonagotchi
//
//  Created by James Oliver on 2019-06-06.
//  Copyright © 2019 Lighthouse Labs. All rights reserved.
//

#import "LPGNewApple.h"

@implementation LPGNewApple


+(UIImageView *)newApple: (struct CGPoint) location{
    UIImageView *newApple = [[UIImageView alloc] initWithFrame:CGRectZero];
    newApple.translatesAutoresizingMaskIntoConstraints = NO;
    [newApple setUserInteractionEnabled: YES];
    newApple.image = [UIImage imageNamed:@"apple"];
    newApple.hidden = YES;
    
    return newApple;
    
}

@end
