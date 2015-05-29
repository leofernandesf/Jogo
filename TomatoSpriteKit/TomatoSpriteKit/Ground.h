//
//  Ground.h
//  TomatoSpriteKit
//
//  Created by leonardo fernandes farias on 28/05/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Textura.h"
#import "Mask.h"

@interface Ground : SKNode

@property (nonatomic)SKNode *ground;
@property (nonatomic)SKTexture *groundTexture;
@property (nonatomic)SKSpriteNode *cloud;
@property (nonatomic)SKSpriteNode *groundChild;
@property (nonatomic)SKSpriteNode *grassChild;


- (id)initWithSize:(CGSize)size;
- (void) colisao;

@end

