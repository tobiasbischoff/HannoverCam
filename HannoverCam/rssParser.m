//
//  rssParser.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 17.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "rssParser.h"


@implementation rssParser
@synthesize feedPosts;

static NSString * const kChannelElementName = @"channel";
static NSString * const kItemElementName = @"item";

-(id) init
{
    self = [super init];
    
    feedURL = [[NSURL alloc] initWithString:@"http://www.vmz-niedersachsen.de/vwd/InfoRss.xml"];
    feedPosts = [[NSMutableArray alloc] init];
    [self startparsing];
    return self;
}

- (void)startparsing
{
    [feedPosts removeAllObjects];
    NSLog(@"started parsing..");
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:feedURL];
    [parser setDelegate: self];
	[parser parse];
    
}

- (NSArray *)reversedFeedPosts {
    
    
    NSArray * reversedArray = [[NSMutableArray alloc] init];
    reversedArray = [[feedPosts reverseObjectEnumerator] allObjects];
    
    return reversedArray;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName 
    attributes:(NSDictionary *)attributeDict
{

    if ([elementName isEqualToString:kChannelElementName]) {
		
        Channel *channel = [[Channel alloc] init];
        feedChannel = channel;
        currentElement = channel;
        return;
		
    }
	
    if ([elementName isEqualToString:kItemElementName]) {
		
        meldung *post = [[meldung alloc] init];
        [feedPosts addObject:post];
        currentElement = post;
     
        return;
		
    }
    
}



- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (currentElementData == nil) {
     currentElementData = [[NSMutableString alloc] init];
    }
	
    [currentElementData appendString:string];
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName
{
    SEL selectorName = NSSelectorFromString(elementName);
    if ([currentElement respondsToSelector:selectorName]) {
        
        [currentElement setValue:currentElementData forKey:elementName];
        
    }
	
    currentElementData = nil;
}
    

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
        
    NSString *info = [NSString stringWithFormat:@"Error %i, Description: %@, Line: %i, Column: %i",
                        [parseError code],
                        [[parser parserError] localizedDescription],
                        [parser lineNumber],
                        [parser columnNumber]];
        
    NSLog(@"RSS Feed Parse Error: %@", info);
    meldung * dummy = [[meldung alloc] initWithTitle:@"Nicht verfügbar" desc:@"Zur Zeit ist der Meldungsdienst nicht verfügbar." pdate:@"aktuell"];
    [feedPosts addObject:dummy];
}

-(void) parserDidStartDocument:(NSXMLParser *)parser {
	NSLog(@"parserDidStartDocument"); 	
}


-(void) parserDidEndDocument: (NSXMLParser *)parser {
	NSLog(@"parserDidEndDocument mit objekten %d", [feedPosts count]); 
    
}


@end
