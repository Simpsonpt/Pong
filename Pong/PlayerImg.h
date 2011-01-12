//
//  PlayerImg.h
//  Pong
//
//  Created by Renato Rodrigues on 11/26/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.Objects.h"
#import "Retronator.Pong.classes.h"

@interface PlayerImg : NSObject <IPosition> {
	Vector2 *position;
}

@end
