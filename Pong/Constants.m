//
//  Constants.m
//  Pong
//
//  Created by FRI Multimedija on 11/17/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "Constants.h"

@implementation Constants

static Constants *instance;

+ (void) initialize {
	instance = [[Constants alloc] init];
}

+ (Constants *) getInstance {
	return instance;
}

- (float) minimumBallVerticalVelocity {
	return 200;
}

- (float) maximumBallAngle {
	return M_PI / 2;
}

- (int) startPoints {
	return 0;
}

- (float) initialBallSpeed {
	return 200;
}

- (float) levelUpBallSpeedIncrease {
	return 100;
}

@end