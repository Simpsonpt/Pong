//
//  ISceneUser.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameCore.Scene.classes.h"

@protocol ISceneUser <NSObject>

@property (nonatomic, retain) id<IScene> scene;

@optional
- (void) addedToScene:(id<IScene>)scene;
- (void) removedFromScene:(id<IScene>)scene;

@end
