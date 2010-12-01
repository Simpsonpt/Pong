//
//  CaughtBall.h
//  Pong
//
//  Created by Renato Rodrigues on 11/27/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Pong.classes.h"

@interface CaughtBall : NSObject {
	Ball *ball;
	float offset;
}

- (id) initWithBall:(Ball*)theBall offset:(float)theOffset;
+ (CaughtBall*) caughtBallWithBall:(Ball*)theBall offset:(float)theOffset;

@property (nonatomic, readonly) Ball *ball;
@property (nonatomic, readonly) float offset;

@end

