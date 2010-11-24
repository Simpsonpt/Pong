//
//  IAxisAlignedHalfPlaneCollider.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IHalfPlaneCollider.h"

@protocol IAxisAlignedHalfPlaneCollider <IHalfPlaneCollider>

@property (nonatomic, readonly) AxisAlignedHalfPlane *axisAlignedHalfPlane;

@end
