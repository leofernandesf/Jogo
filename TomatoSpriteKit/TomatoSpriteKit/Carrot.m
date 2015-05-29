//
//  Carrot.m
//  TomatoSpriteKit
//
//  Created by leonardo fernandes farias on 28/05/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "Carrot.h"

@implementation Carrot
@synthesize carrot;

- (id)initWithSize:(CGSize)size {
    if (self = [super init]) {
        
        Textura *carrotTextura = [[Textura alloc]initCarrot];
        Textura *groudTexturaandGrass = [[Textura alloc]initGroundaandGrass];
        
        
        
        SKAction *carrotAction = [SKAction repeatActionForever:[SKAction animateWithTextures:
                                                                @[carrotTextura.carrot1, carrotTextura.carrot2, carrotTextura.carrot3,]
                                                                                timePerFrame:0.1]];
        
        
        carrot = [SKSpriteNode spriteNodeWithTexture:carrotTextura.carrot1];
        
        carrot.position = CGPointMake(size.width, groudTexturaandGrass.groundTexture.size.height + carrot.size.height/2);
        
        [carrot runAction:carrotAction];
        
        
        CGFloat numberOfGrounds = ceil(size.width/groudTexturaandGrass.groundTexture.size.width);
        
        SKAction *moveCarrotSprite = [SKAction moveByX:-size.width
                                                     y:0
                                              duration:(numberOfGrounds)];
        
        SKAction *resetCarrotSprite = [SKAction moveByX:size.width
                                                      y:0
                                               duration:0];
        
        SKAction *moveCarrotSpritesForever = [SKAction repeatActionForever:
                                              [SKAction sequence:@[moveCarrotSprite, resetCarrotSprite]]];
        
        [carrot runAction:moveCarrotSpritesForever];
        
        
        carrot.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:carrot.size.height/2];
        carrot.physicsBody.dynamic = NO; //consegue fazer a acao nele? sim.
        carrot.physicsBody.allowsRotation = NO; //o objeto terá rotacao?
        carrot.physicsBody.categoryBitMask = [Mask carrotMask];
        carrot.physicsBody.contactTestBitMask = [Mask tomatoMask];
        
        
        [self addChild:carrot];
        


        
    }
    return self;
}

- (void) colisao {
    [carrot removeAllActions];
}


@end

