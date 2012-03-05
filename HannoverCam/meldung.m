//
//  meldung.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 17.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "meldung.h"

@implementation meldung
@synthesize title,description,pubDate;

- (id)initWithTitle:(NSString *)t desc:(NSString *)d pdate:(NSString *)pdate;
{
    
    self = [super init];
    [self setTitle:t];
    [self setDescription:d];
    [self setPubDate:pdate];
    return self;
    
}
@end
