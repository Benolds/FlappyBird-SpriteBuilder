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
    
    [self methodToDebug];
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

- (void)methodToDebug
{
    NSArray* numbers = @[@"4", @"2", @"5", @"3", @"1"];
    NSString* path = @"";
    
    int i = 0;
    
    do {
        NSString* num = [numbers objectAtIndex:i];
        path = [path stringByAppendingString:num];
        i = [num intValue];
    } while (i != 0);
    
    NSLog(@"The path is %@", path);
}

@end
