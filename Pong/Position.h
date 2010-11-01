//
//  Position.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Retronator.Pong.classes.h"
#import "Vector2.h"

@protocol Position

@property (nonatomic,retain) Vector2 *position;

@end