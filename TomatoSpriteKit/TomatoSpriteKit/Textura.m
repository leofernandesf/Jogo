//
//  Textura.m
//  TomatoSpriteKit
//
//  Created by leonardo fernandes farias on 28/05/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "Textura.h"

@implementation Textura

-(id)initTomato
{
    _tomato1 = [SKTexture textureWithImageNamed:@"tomato1"];
    _tomato2 = [SKTexture textureWithImageNamed:@"tomato2"];
    _tomato3 = [SKTexture textureWithImageNamed:@"tomato3"];
    _tomato4 = [SKTexture textureWithImageNamed:@"tomato4"];
    _tomato5 = [SKTexture textureWithImageNamed:@"tomato5"];
    
    return self;
}

-(id)initGroundaandGrass
{
    _groundTexture = [SKTexture textureWithImageNamed:@"ground"];
    _grassTexture = [SKTexture textureWithImageNamed:@"grass"];
    return self;
}

-(id)initCloud
{
    _cloudTexture = [SKTexture textureWithImageNamed:@"cloud"];
    return self;
}

-(id)initCarrot
{
    _carrot1 = [SKTexture textureWithImageNamed:@"carrot1"];
    _carrot2 = [SKTexture textureWithImageNamed:@"carrot2"];
    _carrot3 = [SKTexture textureWithImageNamed:@"carrot3"];
    return self;
    
    }

@end

