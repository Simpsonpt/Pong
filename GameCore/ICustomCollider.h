//
//  ICustomCollider.h
//  GameCore
//
//  Created by FRI Multimedija on 11/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "System.h"

@protocol ICustomCollider <NSObject>

- (BOOL) collidingWithItem:(id)item;
- (void) collidedWithItem:(id)item;

@end
