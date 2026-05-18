import 'package:webview_flutter/webview_flutter.dart';

class ChannelDemo {
  // webview_flutter v3/v4 fluent API on the controller.
  void modernController() {
    final controller = WebViewController();
    // ruleid: webview-javascript-channel
    controller.addJavaScriptChannel(
      'Native',
      onMessageReceived: (JavaScriptMessage message) {
        print(message.message);
      },
    );
  }

  // webview_flutter v4 — JavaScriptChannel constructor (uppercase 'S').
  Set<JavaScriptChannel> v4Channels() {
    return {
      // ruleid: webview-javascript-channel
      JavaScriptChannel(
        name: 'Native',
        onMessageReceived: (JavaScriptMessage m) {},
      ),
    };
  }

  // webview_flutter v2 legacy — JavascriptChannel constructor (lowercase 's').
  Set<JavascriptChannel> legacyChannels() {
    return {
      // ruleid: webview-javascript-channel
      JavascriptChannel(
        name: 'Native',
        onMessageReceived: (JavascriptMessage m) {},
      ),
    };
  }

  // OK: WebView with no JS channel registered.
  void okNoBridge() {
    // ok: webview-javascript-channel
    final controller = WebViewController()
      ..loadRequest(Uri.parse('https://trusted.example.com'));
  }

  // OK: explicitly disabling JavaScript entirely.
  void okJsDisabled() {
    // ok: webview-javascript-channel
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled);
  }

  // OK: setting unrelated WebView options.
  void okBackgroundColor() {
    // ok: webview-javascript-channel
    final controller = WebViewController()..setBackgroundColor(0xFFFFFFFF);
  }
}
