//
//  Tomato.h
//  TomatoSpriteKit
//
//  Created by leonardo fernandes farias on 28/05/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Ground.h"
#import "Textura.h"
#import "Mask.h"

@interface Tomato : SKNode

@property (nonatomic)SKSpriteNode *tomato;
@property (nonatomic)NSInteger colisaotoque;

- (id)initWithSize:(CGSize)size;
- (void) jump;
- (void) colisao;

@end
