//
//  AppDelegate_iPhone.m
//  HTTPLiveStreaming
//
//  Created by Charles Joseph Uy on 12/16/10.
//  Copyright 2010 G2iX. All rights reserved.
//

#import "AppDelegate_iPhone.h"

@implementation AppDelegate_iPhone

@synthesize window;


#pragma mark -
#pragma mark Notification Handlers

- (void)loadStatedDidChange:(NSNotification *)aNotification {
    DLog(@"self = %@", self);
    NSError *error = [[aNotification userInfo] objectForKey:@"error"];
    if (error) {
        DLog(@"error = %@", error);
    }
}


- (void)playbackDidFinish:(NSNotification *)aNotification {
    DLog(@"self = %@", self);    
    NSError *error = [[aNotification userInfo] objectForKey:@"error"];
    if (error) {
        DLog(@"error = %@", error);
    }    
}


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.    
    NSURL *contentURL = [[NSURL alloc] initWithString:@"http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8"];
    playerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:contentURL];
    [contentURL release];
    playerViewController.view.frame = [[UIScreen mainScreen] applicationFrame];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadStatedDidChange:) name:MPMoviePlayerLoadStateDidChangeNotification object:playerViewController.moviePlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:playerViewController.moviePlayer];

    [self.window addSubview:playerViewController.view];
    [self.window makeKeyAndVisible];
    
    [playerViewController.moviePlayer play];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
