//
//  IHalfPlaneCollider.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GameCore.Math.classes.h"

@protocol IHalfPlaneCollider <NSObject>

@property (nonatomic, readonly) HalfPlane *halfPlane;

@end