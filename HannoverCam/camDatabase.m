//
//  camDatabase.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "camDatabase.h"

static camDatabase *defaultDB = nil;

@implementation camDatabase
@synthesize cam;


+ (camDatabase *) defaultDB
{
    if (!defaultDB) {
        defaultDB = [[super allocWithZone:NULL]init];
    }
    return defaultDB;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultDB];
}


- (id)init
{
    
    if (defaultDB) {
        
        return defaultDB;
    }
        
    self = [super init];
    
    CLLocationCoordinate2D nenndorf = {.latitude =  52.335129, .longitude =  9.408073};
    CLLocationCoordinate2D herrenhausen = {.latitude =  52.421685, .longitude =  9.631233};
    CLLocationCoordinate2D hwesta2 = {.latitude =  52.429432, .longitude =  9.684448};
    CLLocationCoordinate2D hboth = {.latitude =  52.427495, .longitude =  9.775515};
    CLLocationCoordinate2D hlahe = {.latitude =  52.420482, .longitude =  9.83448};
    CLLocationCoordinate2D krbuch = {.latitude =  52.41399, .longitude =  9.850788};
    CLLocationCoordinate2D mellen = {.latitude =  52.556577, .longitude =  9.791651};
    CLLocationCoordinate2D grossbw = {.latitude =  52.487955, .longitude =  9.840574};
    CLLocationCoordinate2D krhanost = {.latitude =  52.397025, .longitude =  9.899797};
    CLLocationCoordinate2D handert = {.latitude =  52.358933, .longitude =  9.884777};
    CLLocationCoordinate2D messes = {.latitude =  52.306484, .longitude =  9.828644};
    CLLocationCoordinate2D messen = {.latitude =  52.331878, .longitude =  9.811563};
    CLLocationCoordinate2D messemit = {.latitude =  52.337489, .longitude =  9.804869};
    CLLocationCoordinate2D seelh = {.latitude =  52.352433, .longitude =  9.79208};
    CLLocationCoordinate2D pferde = {.latitude =  52.37146, .longitude =  9.778347};
    CLLocationCoordinate2D weide = {.latitude =  52.394092, .longitude =  9.793282};
    CLLocationCoordinate2D misb = {.latitude =  52.407393, .longitude =  9.821606};
    CLLocationCoordinate2D amlein = {.latitude =  52.416398, .longitude =  9.637241};
    CLLocationCoordinate2D schwan = {.latitude =  52.379031, .longitude =  9.696851};
    CLLocationCoordinate2D toenn = {.latitude =  52.34757, .longitude =  9.699147};
    CLLocationCoordinate2D rickkr = {.latitude =  52.346391, .longitude =  9.719156};
    CLLocationCoordinate2D landw = {.latitude =  52.338099, .longitude =  9.720765};

    
    
    cam = [NSArray arrayWithObjects:
           [[camPoint alloc] initWithName:@"Bad Nenndorf, A2" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam1.jpg" loc: &nenndorf btnID:0],
           [[camPoint alloc] initWithName:@"Hannover Herrenhausen, A2" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam2.jpg" loc:&herrenhausen btnID:1],
           [[camPoint alloc] initWithName:@"Hannover West, A2/A352" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam3.jpg" loc:&hwesta2 btnID:2],
           [[camPoint alloc] initWithName:@"Hannover Bothfeld, A2" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam21.jpg" loc:&hboth btnID:3],
           [[camPoint alloc] initWithName:@"Hannover Lahe, A2" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam4.jpg" loc:&hlahe btnID:4],
           [[camPoint alloc] initWithName:@"Kreuz Han. Buchholz, A2" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam9.jpg" loc:&krbuch btnID:5],
           [[camPoint alloc] initWithName:@"Mellendorf, A7" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam5.jpg" loc:&mellen btnID:6],
           [[camPoint alloc] initWithName:@"Großburgwedel, A7" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam6.jpg" loc: &grossbw btnID:7],
           [[camPoint alloc] initWithName:@"Kreuz Hannover Ost, A2/A7" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam7.jpg" loc:&krhanost btnID:8],
           [[camPoint alloc] initWithName:@"Hannover Anderten, A7 B65" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam8.jpg" loc:&handert btnID:9],
           [[camPoint alloc] initWithName:@"Messe Süd, B6 A37" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam22.jpg" loc:&messes btnID:10],
           [[camPoint alloc] initWithName:@"Messe Nord, Schnellweg" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam15.jpg" loc:&messen btnID:11],
           [[camPoint alloc] initWithName:@"Messeschnellweg, Mittelfeld" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam14.jpg" loc:&messemit btnID:12],
           [[camPoint alloc] initWithName:@"Seelhorster Kreuz, B3 B6 B65" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam13.jpg" loc:&seelh btnID:13],
           [[camPoint alloc] initWithName:@"Pferdeturmkreuzung, B3" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam12.jpg" loc:&pferde btnID:14],
           [[camPoint alloc] initWithName:@"Weidetorkreisel, B3" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam11.jpg" loc:&weide btnID:15],
           [[camPoint alloc] initWithName:@"Hannover Misburg, B3" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam10.jpg" loc:&misb  btnID:16],
           [[camPoint alloc] initWithName:@"Am Leineufer, B6" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam24.jpg" loc:&amlein btnID:17],
           [[camPoint alloc] initWithName:@"Schwanenburgkreuzung" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam20.jpg" loc:&schwan btnID:18],
           [[camPoint alloc] initWithName:@"Tönniesbergkreisel, B65" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam19.jpg" loc:&toenn btnID:19],
           [[camPoint alloc] initWithName:@"Ricklinger Kreisel, B6 B65" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam18.jpg" loc:&rickkr btnID:20],
           [[camPoint alloc] initWithName:@"Landwehrkreisel, B6 B65 B3" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam17.jpg" loc:&landw btnID:21]
           , nil];
    NSLog(@"Kameradatenbank mit %d Kameras", [cam count] );
    return self;
    
}

@end
