//
//  LPGCat.m
//  Phonagotchi
//
//  Created by James Oliver on 2019-06-06.
//  Copyright © 2019 Lighthouse Labs. All rights reserved.
//

#import "LPGCat.h"

@implementation LPGCat

- (instancetype)init
{
    self = [super init];
    if (self) {
        _velocity = 0;
    }
    return self;
}

- (BOOL)changeCatMood:(CGPoint)gestureVelocity {
    
    if(gestureVelocity.x > 1000.00 ||  gestureVelocity.y > 1000.00) {
        return YES;
    }
    else {
        return NO;
    }
    
}

@end
