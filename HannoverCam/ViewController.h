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

@interface ViewController : UIViewController <MKMapViewDelegate>
{
    camDatabase *camd;
    NSMutableArray *cAns;
   
}
@property (weak, nonatomic) IBOutlet MKMapView *map;
- (IBAction)openViewer:(id)sender;
- (IBAction)resetMap:(id)sender;


@end
