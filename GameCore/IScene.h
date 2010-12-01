//
//  IScene.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IScene <NSObject, NSFastEnumeration>

- (void) addItem:(id)item;
- (void) removeItem:(id)item;
- (void) clear;
- (void) removeObjectsAtIndex:(NSMutableIndexSet*)set;

@property (nonatomic, readonly) Event *itemAdded;
@property (nonatomic, readonly) Event *itemRemoved;

@end