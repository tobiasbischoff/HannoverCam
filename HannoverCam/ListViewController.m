//
//  ListViewController.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "ListViewController.h"

@implementation ListViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
    
        //und einen navbar title definieren
        [[self navigationItem] setTitle:@"Kameraliste"];
        
        //camera datenbank erstellen
        camd = [[camDatabase alloc] init];
        
        //Tabbar config
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Kameras"];
        UIImage *i = [UIImage imageNamed:@"tabcam.png"];
        [tbi setImage:i];
        
    }
    
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[camd  cam] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //nachsehen ob es eine reusable cell gibt
    UITableViewCell * cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    
    
    //gab es keine, machen wir eine
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
    }
    
    //text der zelle mit der beschreibung der possession füllen
    camPoint *c  = [[camd cam]objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[c name]];
    
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    //reihe wurde getappt..detail viewcontroller erstellen und auf den stack legen.
    camViewer *cvc = [[camViewer alloc] init];
    
    

    camPoint *c  = [[camd cam]objectAtIndex:[indexPath row]];
    [cvc setDisplayurl:[c url]];
    
    
    [[self navigationController] pushViewController:cvc animated:YES];
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

@end
