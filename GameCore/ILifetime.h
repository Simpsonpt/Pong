//
//  ILifetime.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GameCore.Scene.Objects.classes.h"

@protocol ILifetime <NSObject>

@property (nonatomic, retain) Lifetime *lifetime;

@end
