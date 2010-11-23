//
//  IScene.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IScene <NSFastEnumeration>

- (void) addItem:(id)item;
<<<<<<< HEAD
- (void) removeItem:(id)item;
- (void) clear;
- (void) removeObjectsAtIndex:(NSMutableIndexSet*)set;
=======
- (void) removeObjectsAtIndex:(id)item;

>>>>>>> 81162655290a32b13e3cb5e94a1543c95a717c57
@end
