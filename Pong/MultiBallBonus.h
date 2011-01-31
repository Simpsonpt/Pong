//
//  MultiBallBonus.h
//  Pong
//
//  Created by Renato Rodrigues on 11/29/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bonus.h"

@interface MultiBallBonus : Bonus {
	id<IScene> savedscene;
	Ball *one,*two;
	float old_vel;
}

@end
