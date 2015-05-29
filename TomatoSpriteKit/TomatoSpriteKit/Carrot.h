//
//  Carrot.h
//  TomatoSpriteKit
//
//  Created by leonardo fernandes farias on 28/05/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Textura.h"
#import "Mask.h"

@interface Carrot : SKNode

@property (nonatomic)SKSpriteNode *carrot;

- (id)initWithSize:(CGSize)size;

- (void) colisao;

@end
