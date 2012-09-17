//
//  CamAnnotation.h
//  HannoverCam
//
//  Created by Tobias Bischoff on 13.09.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface CamAnnotation : NSObject <MKAnnotation>
{
    NSString *title;
    CLLocationCoordinate2D coordinate;

    
}

//einen neuen initialiser erstellen


//eine von MKAnnotation benötigtes Property
@property (nonatomic) CLLocationCoordinate2D coordinate;

//ein optionales property von MKAnnotation
@property (nonatomic,copy) NSString *title;
@property (nonatomic, retain) NSString *url;
@property (nonatomic) NSInteger btnID;


@end
