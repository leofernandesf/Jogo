//
//  Tomato.m
//  TomatoSpriteKit
//
//  Created by leonardo fernandes farias on 28/05/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "Tomato.h"

@implementation Tomato

@synthesize tomato;

- (id)initWithSize:(CGSize)size {
    if (self = [super init]) {
        
        Textura *tomateTextura = [[Textura alloc]initTomato];
        Textura *groudTexturaandGrass = [[Textura alloc]initGroundaandGrass];
        
        
        
        SKAction *tomatoAction = [SKAction repeatActionForever:[SKAction animateWithTextures:
                                                                @[tomateTextura.tomato1, tomateTextura.tomato2, tomateTextura.tomato3, tomateTextura.tomato4, tomateTextura.tomato5, tomateTextura.tomato4, tomateTextura.tomato3, tomateTextura.tomato2]
                                                                                timePerFrame:0.1]];
        
        
        tomato = [SKSpriteNode spriteNodeWithTexture:tomateTextura.tomato1];
        
        tomato.position = CGPointMake(size.width/4,groudTexturaandGrass.groundTexture.size.height + tomato.size.height/2);
        
        [tomato runAction:tomatoAction];
        
        
        tomato.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:tomato.size.height/2]; //sempre pega o raio para pegar sempre o centro do objeto
        tomato.physicsBody.dynamic = YES; //consegue fazer a acao nele? sim.
        tomato.physicsBody.allowsRotation = NO; //o objeto terá rotacao?
        tomato.physicsBody.categoryBitMask = [Mask tomatoMask]; //atribuindo mascara ao objeto (nada alem disso)
        tomato.physicsBody.contactTestBitMask = [Mask groundMask] | [Mask carrotMask]; //adiciona o contato do tomate com o ground
        
        
        [self addChild:tomato];
        
    }
    return self;
}

- (void) jump {
    if (_colisaotoque != 1)
        [tomato.physicsBody applyImpulse:CGVectorMake (0.0, 90.0)];
}

- (void) colisao {
    _colisaotoque = 1;
    [tomato removeAllActions];
}


@end

