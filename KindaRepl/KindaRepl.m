//
//  KindaRepl.m
//  KindaRepl
//
//  Created by Tatyana Lomonosova on 4/7/14.
//  Copyright (c) 2014 tanchey. All rights reserved.
//

#import "KindaRepl.h"
#import <UIKit/UIKit.h>
#import <HTTPServer.h>
#import "RunCommandResponse.h"

@implementation KindaRepl

+ (void)load
{
    [RunCommandResponse load];
    @autoreleasepool {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidFinishLaunching:)
                                                     name:UIApplicationDidFinishLaunchingNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidBecomeActive:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidEnterBackground:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillTerminate:)
                                                     name:UIApplicationWillTerminateNotification
                                                   object:nil];
    }
}

+ (void)applicationDidFinishLaunching:(NSNotification *)notification

{
    [[HTTPServer sharedHTTPServer] start];
}

+ (void)applicationDidBecomeActive:(NSNotification *)notification

{
    [[HTTPServer sharedHTTPServer] start];
}

+ (void)applicationDidEnterBackground:(NSNotification *)notification

{
     [[HTTPServer sharedHTTPServer] stop];
}

+ (void)applicationWillTerminate:(NSNotification *)notification
{
    [[HTTPServer sharedHTTPServer] stop];    
}

+ (void)start
{
}

@end
