//
//  ViewController.h
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "camPoint.h"
#import "camViewer.h"
#import "camDatabase.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *map;
- (IBAction)cam1:(id)sender;
- (IBAction)cam3:(id)sender;
- (IBAction)cam4:(id)sender;
- (IBAction)cam6:(id)sender;
- (IBAction)cam8:(id)sender;
- (IBAction)cam9:(id)sender;
- (IBAction)cam10:(id)sender;
- (IBAction)cam11:(id)sender;
- (IBAction)cam12:(id)sender;
- (IBAction)cam14:(id)sender;
- (IBAction)cam15:(id)sender;
- (IBAction)cam16:(id)sender;
- (IBAction)cam18:(id)sender;
- (IBAction)cam20:(id)sender;
- (IBAction)cam22:(id)sender;

@end
