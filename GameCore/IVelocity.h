//
//  IVelocity.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol IVelocity <NSObject>

@property (nonatomic, retain) Vector2 *velocity;

@end
