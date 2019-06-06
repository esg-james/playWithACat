//
//  LPGCat.h
//  Phonagotchi
//
//  Created by James Oliver on 2019-06-06.
//  Copyright © 2019 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LPGCat : NSObject

@property (readonly) NSString *catMood;
@property NSInteger velocity;
@property (nonatomic) NSString *petImageString;
@property (nonatomic) UIImageView *petImage;

-(BOOL)changeCatMood:(CGPoint)gestureVelocity;

@end

NS_ASSUME_NONNULL_END
