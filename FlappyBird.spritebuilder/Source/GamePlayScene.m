#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    
    [self addObstacle];
    timeSinceLastObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // put update code here
    timeSinceLastObstacle += delta;
    
    if (timeSinceLastObstacle > 2.0f) {
        [self addObstacle];
        
        timeSinceLastObstacle = 0.0f;
    }
}

// put new methods here

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [character flap];
}

@end
