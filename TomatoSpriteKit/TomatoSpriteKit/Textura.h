//
//  Textura.h
//  TomatoSpriteKit
//
//  Created by leonardo fernandes farias on 28/05/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Textura : SKNode

@property(nonatomic) SKTexture *tomato1;
@property(nonatomic) SKTexture *tomato2;
@property(nonatomic) SKTexture *tomato3;
@property(nonatomic) SKTexture *tomato4;
@property(nonatomic) SKTexture *tomato5;

@property(nonatomic) SKTexture *carrot1;
@property(nonatomic) SKTexture *carrot2;
@property(nonatomic) SKTexture *carrot3;


@property(nonatomic) SKTexture *groundTexture;


@property(nonatomic) SKTexture *cloudTexture;


@property(nonatomic) SKTexture *grassTexture;



- (id)initTomato;
- (id)initCloud;
- (id)initGroundaandGrass;
- (id)initCarrot;


@end

