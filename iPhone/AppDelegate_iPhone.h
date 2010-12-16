//
//  AppDelegate_iPhone.h
//  HTTPLiveStreaming
//
//  Created by Charles Joseph Uy on 12/16/10.
//  Copyright 2010 G2iX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface AppDelegate_iPhone : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MPMoviePlayerViewController *playerViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

