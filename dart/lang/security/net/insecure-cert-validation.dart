import 'dart:io';

class HttpFactory {
  HttpClient unsafeArrow() {
    final client = HttpClient();
    // ruleid: insecure-cert-validation
    client.badCertificateCallback = (cert, host, port) => true;
    return client;
  }

  HttpClient unsafeBlock() {
    final client = HttpClient();
    // ruleid: insecure-cert-validation
    client.badCertificateCallback = (cert, host, port) {
      return true;
    };
    return client;
  }

  HttpClient pinnedFingerprint() {
    final client = HttpClient();
    // ok: insecure-cert-validation
    client.badCertificateCallback = (cert, host, port) {
      return host == 'pinned.example.com' &&
          cert.sha1.toString() == 'aabbccddeeff';
    };
    return client;
  }

  HttpClient defaultValidation() {
    // ok: insecure-cert-validation
    return HttpClient();
  }

  HttpClient unsafeCascade() {
    // ruleid: insecure-cert-validation
    return HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
