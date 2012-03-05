//
//  ViewController.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController
@synthesize map;

- (id)init

{
    //den initilizer der superclass aufrufen
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        
         [[self navigationItem] setTitle:@"Kartenansicht"];
        //ein tabbaritem holen
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Karte"];
        UIImage *i = [UIImage imageNamed:@"tabmap.png"];
        [tbi setImage:i];
        
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //parameter verwerfen
    return [self init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	 [map setShowsUserLocation:YES];
}

- (void)viewDidUnload
{
    [self setMap:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //hannover 52.388592 9.728737
    CLLocationCoordinate2D loc = {.latitude =  52.388592, .longitude =  9.728737};
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 15000, 16000);
    [map setRegion:region animated:NO];
    [map setShowsUserLocation:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)cam1:(id)sender {
    
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:1];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam3:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:2];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam4:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:3];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam6:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:5];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam8:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:7];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam9:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:8];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam10:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:9];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam11:(id)sender { 
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:10];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam12:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:11];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam14:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:13];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam15:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:14];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam16:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:15];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam18:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:17];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam20:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:19];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)cam22:(id)sender {
    camViewer *cvc = [[camViewer alloc] init];
    camDatabase * camd = [[camDatabase alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:21];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}
@end
