//
//  rssParser.h
//  HannoverCam
//
//  Created by Bischoff Tobias on 17.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "meldung.h"
#import "Channel.h"


@interface rssParser : NSObject <NSXMLParserDelegate>
{
    Channel *feedChannel;
    id currentElement;
    NSMutableString *currentElementData;
    NSMutableArray *feedPosts;
    
    NSURL *feedURL;
    
    
}

- (void)startparsing;

@property (nonatomic, retain) NSMutableArray *feedPosts;

@end
