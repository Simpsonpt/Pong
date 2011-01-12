//
//  BonusFactory.h
//  Pong
//
//  Created by Renato Rodrigues on 11/29/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Pong.classes.h"

@interface BonusFactory : NSObject {
	
}

+ (Bonus*) createBonus:(BonusType)type;

+ (Bonus*) createRandomBonus;

@end
