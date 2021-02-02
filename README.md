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
### Note : 

1. If you are getting error as "Building for iOS simulator but the linked and embedded framework ..." Please select `Legacy build system`for Build System under project settings.
2. If you using Xcode 12+ with swift 4+, and facing issues with build please follow the steps below :
a) Create a script file carthage.sh, make it executable ```chmod +x carthage.sh```
b) Copy script file content as below: 
```#!/usr/bin/env bash

# carthage.sh
# Usage example: ./carthage.sh build --platform iOS

set -euo pipefail

xcconfig=$(mktemp /tmp/static.xcconfig.XXXXXX)
trap 'rm -f "$xcconfig"' INT TERM HUP EXIT

# For Xcode 12 make sure EXCLUDED_ARCHS is set to arm architectures otherwise
# the build will fail on lipo due to duplicate architectures.
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200 = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
echo 'EXCLUDED_ARCHS = $(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT)__XCODE_$(XCODE_VERSION_MAJOR))' >> $xcconfig

export XCODE_XCCONFIG_FILE="$xcconfig"
carthage "$@"
```
c) Finally call ```./carthage.sh build```

This issue will be fix once XCFrameworks are available, will update soon :)


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

