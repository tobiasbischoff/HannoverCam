//
//  RSSViewController.h
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "rssParser.h"



@interface RSSViewController : UITableViewController <UITableViewDelegate>
{
    rssParser * rsp;
    NSArray *feed;
    UIActivityIndicatorView * activityView;
    UIBarButtonItem *loadingView;
     UIBarButtonItem * reloadknopf;
}



@end
