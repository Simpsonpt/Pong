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

+ (float) velocitySmoothing;
+ (float) padCoefficientOfRestitution;

@property (nonatomic, readonly) float minimumBallVerticalVelocity;
@property (nonatomic, readonly) float maximumBallAngle,ballSpeedUp;
@property (nonatomic, readonly) int startPoints;
@property (nonatomic, readonly) float initialBallSpeed, bonusChance;
@property (nonatomic, readonly) float levelUpBallSpeedIncrease;
@property (nonatomic, readonly) NSTimeInterval changeSizeDuration;
+ (Constants*) getInstance;

+ (int) winScore;

+ (NSString*) progressFilePath;
+ (NSString*) progressFilePathSingle;
+ (NSString*) progressFilePathMulti;
+ (NSString*) progressFilePathOpS;
+ (NSString*) progressFilePathOpM;
+ (NSString*) progressFilePathOpGP;

@end

