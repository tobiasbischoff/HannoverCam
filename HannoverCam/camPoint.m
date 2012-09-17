//
//  camPoint.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "camPoint.h"

@implementation camPoint
@synthesize name,url,loc,cannotation;

- (id)initWithName:(NSString *)n url:(NSString *)u loc:(CLLocationCoordinate2D *)l btnID:(NSInteger)i
{
    self = [super init];
    [self setName:n];
    [self setUrl:u];
    [self setLoc:l];
    [self setBtnID:i];
    CamAnnotation *new = [[CamAnnotation alloc] init];
    [new setTitle:n];
    [new setCoordinate:*l];
    [new setUrl:u];
    [new setBtnID:i];
    [self setCannotation:new];
    return self;
    
}


@end
