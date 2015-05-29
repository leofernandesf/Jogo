//
//  GameScene.m
//  TomatoSpriteKit
//
//  Created by Antonio de Carvalho Jr on 5/26/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "GameScene.h"

@interface GameScene() <SKPhysicsContactDelegate> {
    Tomato *tomate;
    Carrot *carrot;
    Ground *ground;
    SKSpriteNode *tap1;
    
    BOOL jumping; //criar flag para saber se ele esta pulando ou nao
}


@end
//criando as mascaras:


@implementation GameScene
- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        jumping = NO;
        
        tomate = [[Tomato alloc]initWithSize:size];
        ground = [[Ground alloc]initWithSize:size];
        carrot = [[Carrot alloc]initWithSize:size];
        
 
        Textura *groudTexturaandGrass = [[Textura alloc]initGroundaandGrass];
        
        
        
//definindo cenario
        SKColor *skyColor = [SKColor colorWithRed:182.0/255.0 green:241.0/255.0 blue:255.0/255.0 alpha:1.0];
        [self setBackgroundColor:skyColor];
        
//adicionar node ao ground para colidir com o tomate, para q ele nao caia.
        SKNode* dummy = [SKNode node];
        dummy.position = CGPointMake(0, groudTexturaandGrass.groundTexture.size.height/2);
        dummy.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.frame.size.width, groudTexturaandGrass.groundTexture.size.height)];
        
        dummy.physicsBody.dynamic = NO;
        dummy.physicsBody.categoryBitMask = [Mask groundMask]; //atribui mascara ao ground.
        dummy.physicsBody.contactTestBitMask = [Mask tomatoMask];
        
   
        [self addChild:dummy];
        
        
 //tap1
        SKTexture *tap11 = [SKTexture textureWithImageNamed:@"deadtomato1"];

        
        tap1 = [SKSpriteNode spriteNodeWithTexture:tap11];
        
     //   [tap1 runAction:tap1Action];
        SKAction *tap1Action = [SKAction repeatActionForever:[SKAction animateWithTextures:
                                                                @[tap11]
                                                                                timePerFrame:0.5]];
         [tap1 runAction:tap1Action];
        tap1.position = CGPointMake(self.frame.size.width/1.2, self.frame.size.height/1.5 + tap1.size.height/2);
        
        
 //tap2
        
        
        [self addChild:ground];
        [self addChild:tomate];
        [self addChild:carrot];
        [self addChild:tap1];
        
        
        
    // adicionando fisica ao cenario
        self.physicsWorld.gravity = CGVectorMake ( 0.0, -9.8); //adiciona gravidade a todo o cenario, -9.8 pois ele precisa descer..
        self.physicsWorld.contactDelegate = self;
     
        
    }
    return self;

}
 //clica e o tomate pula
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
 // para encontrar o nó do botao na tela:
    
    //para fazer o tomate pular:
     if(!jumping){ //se ele ja nao estiver pulando e for tocada a tela:
    jumping = YES; // se foi tocado, esta pulando
         [tomate jump];
     }
    
    
    
  }


-(void) didBeginContact:(SKPhysicsContact *)contact{
    NSLog(@"Colisao: bodyA: %u bodyB: %u",
    contact.bodyA.categoryBitMask, contact.bodyB.categoryBitMask);
    jumping = NO;
    if (contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 3){
        
        
        NSLog(@"Colisao da cenoura.");
        [tomate colisao];
        [carrot colisao];
        [ground colisao];
    }
    
     //teve conatto com o chao, nao esta mais pulando
}


@end
