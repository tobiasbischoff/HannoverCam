//
//  MeldungsViewController.h
//  HannoverCam
//
//  Created by Bischoff Tobias on 19.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "meldung.h"

@interface MeldungsViewController : UIViewController

@property (nonatomic, strong) meldung *displaymeldung;
@property (weak, nonatomic) IBOutlet UILabel *tlabel;
@property (weak, nonatomic) IBOutlet UITextView *descview;
@property (weak, nonatomic) IBOutlet UILabel *datelabel;

@end
