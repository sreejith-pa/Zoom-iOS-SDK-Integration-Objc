# Zoom-iOS-SDK-Integration-Objc
Zoom SDK integrated Objc sample application - This will be helpful to understand effortlessly

This is an very simple veriosn of integrating ZoomSDK into an iOS app. Project is created following the below zoom link.
https://marketplace.zoom.us/docs/sdk/native-sdks/iOS/getting-started , I have added some of appdelegate code which was not mentioned in the document, which leads us into https://devforum.zoom.us/t/zoom-is-not-presenting-meeting-over-controller/7764 issue. 

The Lib files are downloaded from ZoomSDK official repo.
https://github.com/zoom/zoom-sdk-ios/tree/master

The Meeting ID and Password is hardcoded, so please update that before start working. Before tapping Join Zoom button to join into meeting, please make sure the auth is done by check the console with "onMobileRTCAuth Success" message

I have not added any extra UI or activity indicator to keep the sample simple.

