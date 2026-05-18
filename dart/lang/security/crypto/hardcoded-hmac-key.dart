import 'dart:convert';
import 'package:crypto/crypto.dart';

class TokenSigner {
  Hmac codeUnitsLiteral() {
    // ruleid: hardcoded-hmac-key
    return Hmac(sha256, 'super-secret-signing-key'.codeUnits);
  }

  Hmac codeUnitsDoubleQuoted() {
    // ruleid: hardcoded-hmac-key
    return Hmac(sha256, "another-signing-key-12345".codeUnits);
  }

  Hmac utf8EncodeLiteral() {
    // ruleid: hardcoded-hmac-key
    return Hmac(sha256, utf8.encode('hmac-shared-secret-2024'));
  }

  Hmac utf8EncodeQualified() {
    // ruleid: hardcoded-hmac-key
    return Hmac(sha256, convert.utf8.encode('hmac-shared-secret-2024'));
  }

  Hmac fromEnvironment() {
    final secret = const String.fromEnvironment('HMAC_KEY');
    // ok: hardcoded-hmac-key
    return Hmac(sha256, utf8.encode(secret));
  }

  Hmac fromRuntimeKey(String key) {
    // ok: hardcoded-hmac-key
    return Hmac(sha256, utf8.encode(key));
  }

  Hmac fromCodeUnits(String key) {
    // ok: hardcoded-hmac-key
    return Hmac(sha256, key.codeUnits);
  }
}
