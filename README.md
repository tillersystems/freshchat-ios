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


### Initilization

Just add import statement ```#import "FreshchatCarthage/FreshchatSDK.h"``` and you can access all Freshchat's API


### UI Customization and Localization

Freshchat allows complete UI customization and localization of SDK screens. To achive that Freshchat requires 

**FCLocalization.bundle** - To localize Freshchat SDK

**FCResources.bundle** - Theme customization

Under root folder https://github.com/freshdesk/freshchat-ios/tree/carthage/Resources download Resources.zip. Unzip it and add  ```FCLocalization.bundle``` and ```FCResources.bundle``` into your project.


Documentation - https://support.freshchat.com/support/solutions/articles/232945-freshchat-ios-sdk-integration

Theme Guide - https://support.freshchat.com/support/solutions/articles/229814-freshchat-ios-sdk-themes

Thats all :)

