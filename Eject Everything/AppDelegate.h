//
//  AppDelegate.h
//  Eject Everything
//
//  Created by Alexander Moon on 12.02.14.
//  Copyright (c) 2014 Alexander Moon. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSMenu *menu;
    NSStatusItem *statusItem;
    NSImage *icon;
}

-(IBAction)eject:(id)sender;

@end
