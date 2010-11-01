#import "System.h"

//No need using XNI 0.1.3
//#import "Retronator.Xni.Framework.Graphics.classes.h"

@protocol IGraphicsDeviceService

@property (nonatomic, readonly) GraphicsDevice *graphicsDevice;

@property (nonatomic, readonly) Event *deviceCreated;
@property (nonatomic, readonly) Event *deviceDisposing;
@property (nonatomic, readonly) Event *deviceResetting;
@property (nonatomic, readonly) Event *deviceReset;

@end