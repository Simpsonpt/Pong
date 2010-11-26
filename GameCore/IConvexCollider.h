//
//  IConvexCollider.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol IConvexCollider <NSObject>

@property (nonatomic, readonly) ConvexPolygon *bounds;

@end

