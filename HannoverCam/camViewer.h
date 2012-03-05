//
//  camViewer.h
//  HannoverCam
//
//  Created by Bischoff Tobias on 16.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface camViewer : UIViewController <UIWebViewDelegate>
{
    UIActivityIndicatorView * activityView;
    UIBarButtonItem *loadingView;
    UIBarButtonItem * reloadknopf;
}

@property (nonatomic, retain) NSString * displayurl;
@property (weak, nonatomic) IBOutlet UIWebView *webview;


@end
