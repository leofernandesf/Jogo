//
//  Ground.m
//  TomatoSpriteKit
//
//  Created by leonardo fernandes farias on 28/05/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "Ground.h"

@implementation Ground

@synthesize ground, cloud, groundChild, grassChild;



- (id)initWithSize:(CGSize)size {
    if (self = [super init]) {
        ground = [SKNode new];
        Textura *groundTexture = [[Textura alloc]initGroundaandGrass];
        Textura *cloudTexture = [[Textura alloc]initCloud];
        
        
        SKAction *moveCloudSprite = [SKAction moveToX:-cloudTexture.cloudTexture.size.width duration:10];
        SKAction *resetCloudSprite = [SKAction moveToX:size.width +cloudTexture.cloudTexture.size.width/2 duration:0];
        SKAction *moveCloudSpritesForever = [SKAction repeatActionForever:
                                             
                                             [SKAction sequence:@[moveCloudSprite, resetCloudSprite]]];
        
        
        cloud = [SKSpriteNode spriteNodeWithTexture:cloudTexture.cloudTexture];
        cloud.position = CGPointMake(size.width, size.height - cloud.size.height/2);
        
        [cloud runAction:moveCloudSpritesForever];
        
        
        SKAction *moveGrassSprite = [SKAction moveByX:-groundTexture.grassTexture.size.width
                                                    y:0
                                             duration:1.0];
        
        SKAction *resetGrassSprite = [SKAction moveByX:groundTexture.grassTexture.size.width
                                                     y:0
                                              duration:0];
        
        SKAction *moveGrassSpritesForever = [SKAction repeatActionForever:
                                             [SKAction sequence:@[moveGrassSprite, resetGrassSprite]]];
        
        
        CGFloat numberOfGrounds = ceil(size.width/groundTexture.groundTexture.size.width);
        
        
            
        
        for(int i = 0; i < numberOfGrounds + 1; i++) {
            groundChild = [SKSpriteNode spriteNodeWithTexture:groundTexture.groundTexture];
            groundChild.position = CGPointMake(groundTexture.groundTexture.size.width*i, groundTexture.groundTexture.size.height/2);
            [ground addChild:groundChild];
            
            grassChild = [SKSpriteNode spriteNodeWithTexture:groundTexture.grassTexture];
            grassChild.position = CGPointMake(groundTexture.grassTexture.size.width*i, groundTexture.groundTexture.size.height +groundTexture.grassTexture.size.height/2);
            [grassChild runAction:moveGrassSpritesForever];
            [ground addChild:grassChild];
        }
        
        [self addChild:cloud];
        [self addChild:ground];
        
        
        
        
        
    }
    return self;
}

-(void) colisao
{

    NSLog(@"entrou na colisao do ground");
    [ground removeAllActions];
    [cloud removeAllActions];
    [grassChild removeAllActions];
    [groundChild removeAllActions];
}



@end
