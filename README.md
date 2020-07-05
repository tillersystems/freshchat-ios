# Freshchat Carthage


"Modern messaging software that your sales and customer engagement teams will love." Freshchat by Freshworks.

## Getting Started
Open your cart file Cartfile with the touch command via terminal: 
```
open -a Xcode Cartfile
```

Add Frreshchat into your project using following into your Cartfile: 

```
github "freshdesk/freshchat-ios" "carthage"
```


### Installation
Open your project folder, look for *Carthage* and then checkout to ```Carthage/Build/iOS```. 
Look for **FreshchatCarthage.framework** and add it into your project. 

Note : Please make sure you are adding FreshchatCarthage into Embedded Binaries.


### Additional Required Resources

Freshchat allows complete UI customization and localization of SDK screens. To achive that Freshchat requires 

**FCLocalization.bundle** - To localize Freshchat SDK

**FCResources.bundle** - Theme customization

Under root folder https://github.com/freshdesk/freshchat-ios/blob/carthage/Resources.zip download Resources.zip. Unzip it and add  ```FCLocalization.bundle``` and ```FCResources.bundle``` with Target Membership for project.


### Initilization

Objective C : Add ```#import "FreshchatCarthage/FreshchatSDK.h"``` into your View Controller class

Swift : Add same ```#import "FreshchatCarthage/FreshchatSDK.h"``` into your Bridging-Header file


Documentation - https://support.freshchat.com/support/solutions/articles/232945-freshchat-ios-sdk-integration

Theme : To customize SDK screens, copy and rename FCTheme.plist at your project level. Do necessary changes in renamed .plist file for look/feel update. Finally update file name in SDK config. Check documentation for more information.

Theme Guide - https://support.freshchat.com/support/solutions/articles/229814-freshchat-ios-sdk-themes

Thats all :)

