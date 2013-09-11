//
//  camViewer.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 16.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "camViewer.h"
#import <SystemConfiguration/SCNetworkReachability.h>
#include <netinet/in.h>
#include "Appirater.h"

@implementation camViewer
@synthesize displayurl;
@synthesize webview;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        reloadknopf = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(neuladen:)];
        [[self navigationItem] setRightBarButtonItem:reloadknopf];
        
        activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
        [activityView sizeToFit];
        [activityView setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
        loadingView = [[UIBarButtonItem alloc] initWithCustomView:activityView];
       // [[self view] setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
        
    }
    return self;
}

- (IBAction)neuladen:(id)sender
{
    [webview reload];
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setWebview:nil];
  
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated 
{
    if (!self.connectedToNetwork)
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Es besteht keine Internetverbindung."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];
        
		return;
	}
    [Appirater userDidSignificantEvent:YES];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:displayurl] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
    [webview setDelegate:self];
	[webview loadRequest: theRequest];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[self navigationItem] setRightBarButtonItem:loadingView];
    [activityView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    [[self navigationItem] setRightBarButtonItem:reloadknopf];
    [activityView stopAnimating];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL) connectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
	
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
	
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
	
    if (!didRetrieveFlags)
    {
        NSLog(@"Error. Could not recover network reachability flags");
        return NO;
    }
	
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
	BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
	
	NSURL *testURL = [NSURL URLWithString:@"http://www.apple.com/"];
	NSURLRequest *testRequest = [NSURLRequest requestWithURL:testURL  cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0];
	NSURLConnection *testConnection = [[NSURLConnection alloc] initWithRequest:testRequest delegate:self];
	
    return ((isReachable && !needsConnection) || nonWiFi) ? (testConnection ? YES : NO) : NO;
}

@end
