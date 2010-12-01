//
//  ICollisionAlgorithm.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ICollisionAlgorithm

+ (void) collisionBetween:(id)item1 and:(id)item2;

+ (BOOL) detectCollisionBetween:(id)item1 and:(id)item2;
+ (void) resolveCollisionBetween:(id)item1 and:(id)item2;

@end