//
//  Middle.h
//  Pong
//
//  Created by Renato Rodrigues on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Pong.classes.h"
#import "Position.h"

@interface Middle : NSObject <Position> {
	Vector2 *position;
}

@end
