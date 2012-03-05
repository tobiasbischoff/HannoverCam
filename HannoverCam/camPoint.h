//
//  camPoint.h
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface camPoint : NSObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * url;

- (id)initWithName:(NSString *)n url:(NSString *)u;


@end
