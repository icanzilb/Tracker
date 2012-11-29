Tracker
=======

Google Analytics iOS shortcut wrapper

Include Google Analytics as per their instructions:
https://developers.google.com/analytics/devguides/collection/ios/

Then in your app delegate class:
#import "Tracker.h"

inside your application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions method add:

[Tracker start];

inside your applicationWillTerminate:(UIApplication *)application

[Tracker stop];

That's it! You're done adding google analytics tracking.

If you want to report that a particular screen was shown, add (preferrably in viewDidAppear:)
[Tracker screenView:@"/screenName"];

and this will be reported as a page view in your reporting.

If you want to report particular event, add:
[Tracker event:@"eventname"];

That's all. Demo app coming soon