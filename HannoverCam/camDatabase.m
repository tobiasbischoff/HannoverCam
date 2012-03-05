//
//  camDatabase.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "camDatabase.h"

@implementation camDatabase
@synthesize cam;

- (id)init
{
    self = [super init];
    
    cam = [NSArray arrayWithObjects:
           [[camPoint alloc] initWithName:@"Bad Nenndorf, A2" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam1.jpg"],
           [[camPoint alloc] initWithName:@"Hannover Herrenhausen, A2" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam2.jpg"],
           [[camPoint alloc] initWithName:@"Hannover West, A2/A352" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam3.jpg"],
           [[camPoint alloc] initWithName:@"Hannover Bothfeld, A2" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam21.jpg"],           
           [[camPoint alloc] initWithName:@"Hannover Lahe, A2" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam4.jpg"],
           [[camPoint alloc] initWithName:@"Kreuz Han. Buchholz, A2" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam9.jpg"],
           [[camPoint alloc] initWithName:@"Mellendorf, A7" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam5.jpg"],
           [[camPoint alloc] initWithName:@"Großburgwedel, A7" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam6.jpg"],
           [[camPoint alloc] initWithName:@"Kreuz Hannover Ost, A2/A7" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam7.jpg"],
           [[camPoint alloc] initWithName:@"Hannover Anderten, A7 B65" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam8.jpg"],
           [[camPoint alloc] initWithName:@"Messe Süd, B6 A37" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam22.jpg"],
           [[camPoint alloc] initWithName:@"Messe Nord, Schnellweg" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam15.jpg"],
           [[camPoint alloc] initWithName:@"Messeschnellweg, Mittelfeld" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam14.jpg"],
           [[camPoint alloc] initWithName:@"Seelhorster Kreuz, B3 B6 B65" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam13.jpg"],
           [[camPoint alloc] initWithName:@"Pferdeturmkreuzung, B3" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam12.jpg"],
           [[camPoint alloc] initWithName:@"Weidetorkreisel, B3" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam11.jpg"],
           [[camPoint alloc] initWithName:@"Hannover Misburg, B3" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam10.jpg"],
           [[camPoint alloc] initWithName:@"Am Leineufer, B6" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam24.jpg"],
           [[camPoint alloc] initWithName:@"Schwanenburgkreuzung" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam20.jpg"],
           [[camPoint alloc] initWithName:@"Tönniesbergkreisel, B65" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam19.jpg"],
           [[camPoint alloc] initWithName:@"Ricklinger Kreisel, B6 B65" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam18.jpg"],
           [[camPoint alloc] initWithName:@"Landwehrkreisel, B6 B65 B3" url:@"http://www.vmz-niedersachsen.de/kameras/campics/kam17.jpg"]
           , nil];
    NSLog(@"Kameradatenbank mit %d Kameras", [cam count] );
    return self;
    
}

@end
