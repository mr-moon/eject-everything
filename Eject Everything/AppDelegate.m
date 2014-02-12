//
//  AppDelegate.m
//  Eject Everything
//
//  Created by Alexander Moon on 12.02.14.
//  Copyright (c) 2014 Alexander Moon. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    
    // Used to detect where our files are
    NSBundle *bundle = [NSBundle mainBundle];
    
    // Allocates and loads the images into the application which will be used for our NSStatusItem
    icon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"icon-16x16" ofType:@"png"]];
    
    // Sets the images in our NSStatusItem
    [statusItem setImage:icon];
    
    // Tells the NSStatusItem what menu to load
    [statusItem setMenu:menu];
    
    // Sets the tooptip for our item
    [statusItem setToolTip:@"Eject all mounted volumes."];
    
    // Enables highlighting
    [statusItem setHighlightMode:YES];
}

- (void)eject:(id)sender
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"eject-every-disk" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
}

@end
