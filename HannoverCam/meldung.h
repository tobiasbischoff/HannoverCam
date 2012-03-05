//
//  meldung.h
//  HannoverCam
//
//  Created by Bischoff Tobias on 17.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface meldung : NSObject
{
    NSString * title;
    NSString * description;
    NSString * pubDate;
}

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * description;
@property (nonatomic, strong) NSString * pubDate;

- (id)initWithTitle:(NSString *)t desc:(NSString *)d pdate:(NSString *)pdate;

@end
