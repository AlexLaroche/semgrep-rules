import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:crypto/crypto.dart' as crypto;

class WeakHashes {
  static void sha1Factory() {
    Uint8List bytes = Uint8List(10);
    // ruleid: use-of-sha1
    var digest = Digest('SHA-1');
    digest.process(bytes);

    // ruleid: use-of-sha1
    var digest2 = Digest('sha1');
    digest2.process(bytes);

    // ruleid: use-of-sha1
    var digest3 = Digest('SHA1');
    digest3.process(bytes);
  }

  static void sha1Class() {
    Uint8List bytes = Uint8List(10);
    // ruleid: use-of-sha1
    var hasher = SHA1Digest();
    hasher.process(bytes);
  }

  static void sha1CryptoPkg() {
    var bytes = [1, 2, 3];
    // ruleid: use-of-sha1
    var hash = crypto.sha1.convert(bytes);
    print(hash);
  }

  static void okSha256() {
    Uint8List bytes = Uint8List(10);
    // ok: use-of-sha1
    var digest = Digest('SHA-256');
    digest.process(bytes);

    // ok: use-of-sha1
    var hasher = SHA256Digest();
    hasher.process(bytes);

    // ok: use-of-sha1
    var hash = crypto.sha256.convert([1, 2, 3]);
    print(hash);
  }
}
