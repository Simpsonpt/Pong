//
//  ICustomUpdate.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ICustomUpdate <NSObject>

- (void) updateWithGameTime:(GameTime*)gameTime;

@end
