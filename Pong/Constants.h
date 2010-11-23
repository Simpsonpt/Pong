//
//  Constants.h
//  Pong
//
//  Created by FRI Multimedija on 11/17/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Constants : NSObject {
}

@property (nonatomic, readonly) float minimumBallVerticalVelocity;
@property (nonatomic, readonly) float maximumBallAngle;
@property (nonatomic, readonly) int startPoints;
@property (nonatomic, readonly) float initialBallSpeed;
@property (nonatomic, readonly) float levelUpBallSpeedIncrease;

+ (Constants*) getInstance;

@end

