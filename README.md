Demo using the same cucumber test to test a web site on Chrome, iPhone, iPad, and Android.

Software Requirements

-Chrome Driver v2.2

-Appium - http://appium.io

-Genymotion - http://www.genymotion.com
   
   -Android VM setup with Genymotion with Chrome installed

-iOS Simulator


## Setup

Install:
* XCode (4.6.3)
  - download iOS 6.1
* HomeBrew
  - git
  - node
    - install appium via npm
  - android-sdk
    - install platform-tools, build-tools, and sdk platform via android
* VirtualBox
* Genymotion
  - install and configure a virtual device

Additional things:
you will need to install ios-webkit-debug-proxy
```
$ brew update
$ brew install ios-webkit-debug-proxy
```

start the proxy with:
`$ ios_webkit_debug_proxy -c [UDID]:27753 -d`
ios_webkit_debug_proxy -c d048e595305eda9381207cc18d9c54c781f65b2d:27753 -d

Turn on web inspector in settings>safari>advanced

https://groups.google.com/forum/#!topic/appium-discuss/XVIuzcd79zo
http://pavithz.blogspot.com/2012/09/iwebdriver-on-ipadiphone.html (use these instructions to install safarilauncher on devices. substitute safari webdriver for iwebdriver.)

/Users/thepillar/Library/Developer/Xcode/DerivedData/SafariLauncher-acpnpnvjchasmuccqdphauvcprcx/Build/Products/Debug-iphoneos/SafariLauncher.app