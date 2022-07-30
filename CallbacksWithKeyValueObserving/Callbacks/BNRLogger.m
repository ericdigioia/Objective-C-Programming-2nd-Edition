//
//  BNRLogger.m
//  Callbacks
//
//  Created by Eric Di Gioia on 7/26/22.
//
//  NOTE: I purposefully mixed the classic and dot notation style message sending as practice for myself

#import "BNRLogger.h"

// Class extension
@interface BNRLogger ()
- (void)zoneChange:(NSNotification *)note;
@end

@implementation BNRLogger

- (NSString *)lastTimeString {
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

// for any observers of lastTimeString: lastTime change triggers lastTimeString change
+ (NSSet *)keyPathsForValuesAffectingLastTimeString {
    return [NSSet setWithObject:@"lastTime"];
}

- (void)updateLastTime:(NSTimer *)t {
    NSDate *now = [NSDate date];
    // [self setLastTime:now];
    [self willChangeValueForKey:@"lastTime"]; // explicitly announce change to any observers when accessing i-vars directly
    _lastTime = now;
    [self didChangeValueForKey:@"lastTime"];
    NSLog(@"Just set time to %@", self.lastTimeString);
}

// Called each time a chunk of data arrives
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"received %lu bytes", [data length]);
    
    // Create a mutable data if it does not already exist
    if (!_incomingData) {
        _incomingData = [[NSMutableData alloc] init];
    }
    
    [_incomingData appendData:data];
}

// Called when the last chunk has been processed
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Got it all!");
    NSString *string = [NSString.alloc initWithData:_incomingData
                                           encoding:NSUTF8StringEncoding];
    
    _incomingData = nil;
    NSLog(@"string has %lu characters", string.length);
    
    // Uncomment the next line to see the entire fetched file
    // NSLog(@"The whole string is %@", string);
}

// Called if the fetch fails
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"connection failed: %@", error.localizedDescription);
    _incomingData = nil;
}

- (void)zoneChange:(NSNotification *)note {
    NSLog(@"The system time zone has changed!");
}

@end
