//
//  camPoint.h
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "CamAnnotation.h"

@interface camPoint : NSObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * url;
@property (nonatomic) CLLocationCoordinate2D *loc;
@property (nonatomic, retain) CamAnnotation *cannotation;
@property (nonatomic) NSInteger btnID;

- (id)initWithName:(NSString *)n url:(NSString *)u loc:(CLLocationCoordinate2D *)l btnID:(NSInteger)i;


@end
