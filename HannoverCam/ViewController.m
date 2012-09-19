//
//  ViewController.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "ViewController.h"
#import "CamAnnotation.h"


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
        //singelton der kamera datenbank holen
        camd = [camDatabase defaultDB];
    
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
    //Map konfigurieren
    [map setShowsUserLocation:YES];
    [map setDelegate:self];
    //hannover 52.388592 9.728737
    CLLocationCoordinate2D loc = {.latitude =  52.388592, .longitude =  9.728737};
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 28000, 18000);
    [map setRegion:region animated:NO];
    
    //annotations laden
    cAns = [[NSMutableArray alloc] init];
    for (camPoint *c in [camd cam])
        [cAns addObject:[c cannotation]];
    
    
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
  
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
   
    [map addAnnotations:cAns];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapv viewForAnnotation:(id <MKAnnotation>)annotation
{
    //wird aufgerufen wenn die map eine annotation braucht
    
    //den blauen punkt wollen wir nicht verändern
    if ([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    
    //re-use kram wie bei einem tableview
    static NSString *annotationViewReuseIdentifier = @"annotationViewReuseIdentifier";
    
    MKAnnotationView *annotationView = (MKAnnotationView *)[mapv dequeueReusableAnnotationViewWithIdentifier:annotationViewReuseIdentifier];
    
    if (annotationView == nil)
    {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewReuseIdentifier];
    }
    
    //detail button erstellen und mit einem tag versehen der klar macht welche kamera er später aufruft.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [button addTarget:self action:@selector(openViewer:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 23, 23);
    CamAnnotation *current = annotation;
    button.tag = current.btnID;
    annotationView.rightCalloutAccessoryView = button;
  
    //label brauchen wir auch
    UILabel * desc = [[UILabel alloc] init];
    annotationView.leftCalloutAccessoryView = desc;
    
    //kleines kamera bild setzten und annotation zuweisen
    annotationView.image = [UIImage imageNamed:@"newcam.png"];
    annotationView.annotation = annotation;
    annotationView.canShowCallout = TRUE;
    
    return annotationView;
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

- (IBAction)openViewer:(UIButton *)sender {
    
    //Kamera bild anzeigen, welches weiss dass sender.tag
    camViewer *cvc = [[camViewer alloc] init];
    camPoint *c  = [[camd cam]objectAtIndex:sender.tag];
    [cvc setDisplayurl:[c url]];
    [[self navigationController] pushViewController:cvc animated:YES];
}

- (IBAction)resetMap:(id)sender {
    
    //Map zentrieren
    CLLocationCoordinate2D loc = {.latitude =  52.388592, .longitude =  9.728737};
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 15000, 16000);
    [map setRegion:region animated:YES];
  
}
@end
