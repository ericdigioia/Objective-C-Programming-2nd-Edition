//
//  main.m
//  Callbacks
//
//  Created by Eric Di Gioia on 7/26/22.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        // notification, send one thing to many objects (potentially multiple objects, single callback)
        [NSNotificationCenter.defaultCenter addObserver:logger
                                               selector:@selector(zoneChange:)
                                                   name:NSSystemTimeZoneDidChangeNotification
                                                 object:nil];
        
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        // delegate, can do multiple things (single object, multiple callbacks)
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request
                                                                              delegate:logger
                                                                      startImmediately:YES];
        
        // target-action, do one thing (single object, single callback)
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                          target:logger
                                                        selector:@selector(updateLastTime:)
                                                        userInfo:nil
                                                         repeats:YES];
        
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}
