import 'package:webview_flutter/webview_flutter.dart';

class WebViewWrapper {
  final WebViewController controller;
  WebViewWrapper(this.controller);

  void openUserUrl(String userUrl) {
    // ruleid: webview-javascript-enabled
    controller.loadRequest(Uri.parse(userUrl));
  }

  void openUserUri(Uri userUri) {
    // ruleid: webview-javascript-enabled
    controller.loadRequest(userUri);
  }

  void renderUserHtml(String userHtml) {
    // ruleid: webview-javascript-enabled
    controller.loadHtmlString(userHtml);
  }

  void renderInterpolatedHtml(String userName) {
    final html = "<h1>Hello, $userName</h1>";
    // ruleid: webview-javascript-enabled
    controller.loadHtmlString(html);
  }

  void openUserFile(String userPath) {
    // ruleid: webview-javascript-enabled
    controller.loadFile(userPath);
  }

  void openTrustedConstant() {
    // ok: webview-javascript-enabled
    controller.loadRequest(Uri.parse('https://example.com/trusted'));
  }

  void renderStaticHtml() {
    // ok: webview-javascript-enabled
    controller.loadHtmlString('<h1>Static welcome page</h1>');
  }
}
