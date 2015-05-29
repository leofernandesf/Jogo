//
//  Mask.m
//  TomatoSpriteKit
//
//  Created by leonardo fernandes farias on 28/05/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "Mask.h"

@implementation Mask

static const uint32_t tomatoMask = 1;
static const uint32_t groundMask = 2;
static const uint32_t carrotMask = 3;

+(uint32_t)tomatoMask
{
    return tomatoMask;
}

+(uint32_t)groundMask
{
    return groundMask;
}

+(uint32_t)carrotMask
{
    return carrotMask;
}


@end
