//
//  RSSViewController.m
//  HannoverCam
//
//  Created by Bischoff Tobias on 15.02.12.
//  Copyright (c) 2012 Tobias Bischoff. All rights reserved.
//

#import "RSSViewController.h"
#import "MeldungsViewController.h"

@implementation RSSViewController


- (id)init
{
self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        
        //und einen navbar title definieren
        [[self navigationItem] setTitle:@"Staumeldungen"];
        
        //Tabbar config
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Meldungen"];
        UIImage *i = [UIImage imageNamed:@"tabstau.png"];
        [tbi setImage:i];
        
        reloadknopf = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(neuladen:)];
        
        activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
        [activityView sizeToFit];
        [activityView setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
        loadingView = [[UIBarButtonItem alloc] initWithCustomView:activityView];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(ladenFertig:) name:@"rss" object:nil];

        
        [[self navigationItem] setRightBarButtonItem:reloadknopf];
        rsp = [[rssParser alloc] init];
        
    }
    
    
    return self;
}


- (IBAction)neuladen:(id)sender
{
    [[self navigationItem] setRightBarButtonItem:loadingView];
    [activityView startAnimating];
    [rsp performSelectorInBackground:@selector(startparsing) withObject:nil];
    [[self tableView] setUserInteractionEnabled:FALSE];
   
}

- (void)ladenFertig:(NSNotification *)note;
{
    [[self tableView] reloadData];
    [activityView stopAnimating];
    [[self navigationItem] setRightBarButtonItem:reloadknopf];
    [[self tableView] setUserInteractionEnabled:TRUE];

}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        
    return [[rsp reversedFeedPosts] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //nachsehen ob es eine reusable cell gibt
    UITableViewCell * cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellrss"];
    
    
    //gab es keine, machen wir eine
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCellrss"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
    }
    
    //text der zelle mit der beschreibung der meldung füllen
    meldung * m  = [[rsp reversedFeedPosts]objectAtIndex:[indexPath row]];
    NSString *temptitle = [[m title] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    temptitle = [temptitle stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([temptitle isEqualToString:@""]) [m setTitle:@"Meldung ohne Titel"]; 
    [[cell textLabel] setText:[[m title] stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
    [[cell detailTextLabel] setText:[m description]];
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    //reihe wurde getappt..detail viewcontroller erstellen und auf den stack legen.
    MeldungsViewController *mvc = [[MeldungsViewController alloc] init];
    
    [mvc setDisplaymeldung:[[rsp reversedFeedPosts]objectAtIndex:[indexPath row]]];
    
    [[self navigationController] pushViewController:mvc animated:YES];
}

- (void) viewWillAppear:(BOOL)animated  
{
    
    [[self tableView] reloadData];

}

@end
