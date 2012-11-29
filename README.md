Tracker
=======

Google Analytics iOS shortcut wrapper

Include Google Analytics as per their instructions:
https://developers.google.com/analytics/devguides/collection/ios/

Then in your app delegate class:
```javascript
#import "Tracker.h"
```

inside your application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions method add:

```javascript
[Tracker start];
```

inside your applicationWillTerminate:(UIApplication *)application

```javascript
[Tracker stop];
```

That's it! You're done adding google analytics tracking.

If you want to report that a particular screen was shown, add (preferrably in viewDidAppear:)
```javascript
[Tracker screenView:@"/screenName"];
```
and this will be reported as a page view in your reporting.

If you want to report particular event, add:
```javascript
[Tracker event:@"eventname"];
```
That's all. Demo app coming soon