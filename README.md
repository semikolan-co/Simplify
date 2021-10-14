# TODO

A New Flutter TO-DO App with Firebase Integration.

## Getting Started

This project is a starting point for a Flutter application.

 
   ![flutterfire_300x](https://user-images.githubusercontent.com/80106274/137304964-3f11d3f5-c15d-4746-896e-9022fffc4584.png)




Flutter is Google's SDK for crafting beautiful, fast user experiences for
mobile, web, and desktop from a single codebase. Flutter works with existing
code, is used by developers and organizations around the world, and is free
and open source.


Firebase is a product of Google which helps developers to build, manage, and grow their apps easily. It helps developers to build their apps faster and in a more secure way. No programming is required on the firebase side which makes it easy to use its features more efficiently. It provides services to android, ios, web, and unity.FirebaseUI is an open-source library for Android that allows you to
quickly connect common UI elements to [Firebase](https://firebase.google.com) APIs.


[Flutter logo]: https://github.com/flutter/website/blob/archived-master/src/_assets/image/flutter-lockup-bg.jpg?raw=true
[flutter.dev]: https://flutter.dev
[Build Status - Cirrus]: https://api.cirrus-ci.com/github/flutter/flutter.svg
[Build status]: https://cirrus-ci.com/github/flutter/flutter/master
[Discord instructions]: https://github.com/flutter/flutter/wiki/Chat
[Discord badge]: https://img.shields.io/discord/608014603317936148
[Twitter handle]: https://img.shields.io/twitter/follow/flutterdev.svg?style=social&label=Follow
[Twitter badge]: https://twitter.com/intent/follow?screen_name=flutterdev
[layered architecture]: https://flutter.dev/docs/resources/inside-flutter
[widget catalog]: https://flutter.dev/widgets/
[Skia]: https://skia.org/
[Dart platform]: https://dart.dev/
[Hot reload animation]: https://github.com/flutter/website/blob/main/src/assets/images/docs/tools/android-studio/hot-reload.gif?raw=true
[Hot reload]: https://flutter.dev/docs/development/tools/hot-reload
[Visual Studio Code]: https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
[IntelliJ / Android Studio]: https://plugins.jetbrains.com/plugin/9212-flutter
[Flutter packages]: https://pub.dev/flutter
[FFI]: https://flutter.dev/docs/development/platform-integration/c-interop
[platform channels]: https://flutter.dev/docs/development/platform-integration/platform-channels
[interop example]: https://github.com/flutter/flutter/tree/master/examples/platform_channel


<p>Explaining how to setup flutter for Windows and Mac users using VS Code or Android Studio</p>
<h2>Some links for more in-depth learning</h2>
<h3><a id="user-content-setting-startedsetup" class="anchor" href="https://github.com/gdgikorodu/Flutter-Setup#setting-startedsetup" aria-hidden="true"></a>Setting started/setup</h3>
<ul>
<li><a href="https://flutter.dev/docs/get-started/install/windows" rel="nofollow">Getting Started With Flutter - Windows</a></li>
<li><a href="https://flutter.dev/docs/get-started/install/macos" rel="nofollow">Getting Started With Flutter - Mac</a></li>
<li><a href="https://flutter.dev/docs/get-started/install/linux" rel="nofollow">Getting Started With Flutter - Linux</a></li>
</ul>
<h3><a id="user-content-purely-text-based-resources" class="anchor" href="https://github.com/gdgikorodu/Flutter-Setup#purely-text-based-resources" aria-hidden="true"></a>Purely text-based resources</h3>
<ul>
<li><a href="https://flutter.dev/docs" rel="nofollow">Documentation</a>&nbsp;Tutorials, samples, guidance on mobile development, and a full API reference.</li>
<li><a href="https://flutter.dev/docs/get-started/codelab" rel="nofollow">Lab: Write your first Flutter app</a>&nbsp;Flutter codelabs.</li>
<li><a href="https://flutter.dev/docs/cookbook" rel="nofollow">Cookbook: Useful Flutter samples</a>&nbsp;Flutter cookbook.</li>
</ul>



## Basic setup Firebase

1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/), if you don't already have one. If you already have an existing Google project associated with your mobile app, click **Import Google Project**. Otherwise, click **Create New Project**.
2. Click **Add Firebase to your *[iOS|Android]* app** and follow the setup steps. If you're importing an existing Google project, this may happen automatically and you can just download the config file.
3. Add ```[GoogleService-Info.plist|google-services.json]``` file to your app project.
4. Set ```[GoogleService-Info.plist|google-services.json]``` **build action** behaviour to ```[Bundle Resource|GoogleServicesJson]``` by Right clicking/Build Action.
5. Add the following line of code to the place where your app gets bootstrapped:
```c#
  CrossFirebase.Initialize(..., new CrossFirebaseSettings(...));
```
