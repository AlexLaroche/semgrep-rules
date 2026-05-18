import 'package:flutter/foundation.dart';

class Logger {
  void logTokenDirect(String token) {
    // ruleid: debug-print-leak
    print(token);
  }

  void logPasswordDirect(String password) {
    // ruleid: debug-print-leak
    debugPrint(password);
  }

  void logTokenInterpolated(String t) {
    // ruleid: debug-print-leak
    print("user_token: $t");
  }

  void logSecretInterpolated(String value) {
    // ruleid: debug-print-leak
    debugPrint("client_secret = $value");
  }

  void logJwt(String jwt) {
    // ruleid: debug-print-leak
    print(jwt);
  }

  void logBearer(String bearer) {
    // ruleid: debug-print-leak
    print("Authorization: Bearer $bearer");
  }

  void logApiKey(String apiKey) {
    // ruleid: debug-print-leak
    print(apiKey);
  }

  void logSessionId(String sessionId) {
    // ruleid: debug-print-leak
    debugPrint(sessionId);
  }

  void logUsername(String username) {
    // ok: debug-print-leak
    print(username);
  }

  void logRequestPath(String path) {
    // ok: debug-print-leak
    print("Request path: $path");
  }

  void logStaticString() {
    // ok: debug-print-leak
    print("Application started");
  }

  void logCounter(int count) {
    // ok: debug-print-leak
    debugPrint("Counter: $count");
  }

  // The escape hatch documented in the rule message: a `kDebugMode`
  // guard tree-shakes the call out of release builds.
  void logTokenInDebugMode(String token) {
    if (kDebugMode) {
      // ok: debug-print-leak
      print(token);
    }
  }

  void logPasswordInDebugMode(String password) {
    if (kDebugMode) {
      // ok: debug-print-leak
      debugPrint("password=$password");
    }
  }
}
