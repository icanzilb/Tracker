//
//  Tracker.m
//
// This code is distributed under the terms and conditions of the MIT license.
//
// Copyright (c) 2012 Marin Todorov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "TrackerConfig.h"
#import "Tracker.h"
#import "GANTracker.h"


@implementation Tracker

#pragma mark - singleton
static Tracker *sharedInstance;

+ (void)initialize
{
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        sharedInstance = [[self alloc] init];
    });
}

+(Tracker*)sharedInstance
{
    return sharedInstance;
}

#pragma mark - init

-(id)init
{
    self = [super init];
    if (self != nil) {
        //initialization
        if ([@"" compare:kGATrackingId]==NSOrderedSame) {
            [[[UIAlertView alloc] initWithTitle:@"Error"
                                        message:@"Set the GA track id. Define a global const: kGATrackId"
                                       delegate:nil
                              cancelButtonTitle:@"Close"
                              otherButtonTitles: nil] show];
        }
    }
    return self;
}

+(void)start
{
    [[GANTracker sharedTracker] startTrackerWithAccountID: kGATrackingId
                                           dispatchPeriod: kGANDispatchPeriodSec
                                                 delegate: nil];

}

+(void)stop
{
    [[GANTracker sharedTracker] stopTracker];
}

+(void)screenView:(NSString*)screenName
{
    NSError* error;
    if (![[GANTracker sharedTracker] trackPageview:[NSString stringWithFormat:@"/%@", screenName]
                                         withError:&error]) {
        // Handle error here
        NSLog(@"Tracking screen [%@] error: %@", screenName, [error localizedDescription]);
    }
}

+(void)event:(NSString*)eventName
{
    NSError* error;
    if (![[GANTracker sharedTracker] trackEvent:eventName
                                         action:@"iOSEvents"
                                          label:@"label"
                                          value:-1
                                      withError:&error]) {
        // Handle error here
        NSLog(@"Tracking event [%@] error: %@", eventName, [error localizedDescription]);
    }
}

@end
