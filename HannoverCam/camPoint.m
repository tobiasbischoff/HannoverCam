//
//  camPoint.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "camPoint.h"

@implementation camPoint
@synthesize name,url;

- (id)initWithName:(NSString *)n url:(NSString *)u
{
    self = [super init];
    [self setName:n];
    [self setUrl:u];
    return self;
    
}


@end
