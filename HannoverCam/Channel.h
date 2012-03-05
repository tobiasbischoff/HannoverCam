//
//  Channel.h
//  HannoverCam
//
//  Created by Bischoff Tobias on 19.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject
{
    NSString *title;
    NSString *link;
    NSString *description;
}

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *description;

@end
