//
//  MeldungsViewController.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 19.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "MeldungsViewController.h"

@interface MeldungsViewController ()

@end

@implementation MeldungsViewController
@synthesize displaymeldung;
@synthesize tlabel;
@synthesize descview;
@synthesize datelabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backmeld.png"]]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTlabel:nil];
    [self setDescview:nil];
    [self setDatelabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:YES];
    [tlabel setText:[[displaymeldung title] stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
    [descview setText:[displaymeldung description]];
    [datelabel setText:[displaymeldung pubDate]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



@end
