//
//  IRectangleCollider.h
//  GameCore
//
//  Created by FRI Multimedija on 11/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IPosition.h"
#import "IRotation.h"
#import "IRectangleSize.h"

@protocol IRectangleCollider <IPosition, IRotation, IRectangleSize>

@end
