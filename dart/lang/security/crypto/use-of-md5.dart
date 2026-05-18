import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:crypto/crypto.dart' as crypto;

class WeakHashes {
  static void md5Factory() {
    Uint8List bytes = Uint8List(10);
    // ruleid: use-of-md5
    var digest = Digest('MD5');
    digest.process(bytes);

    // ruleid: use-of-md5
    var digest2 = Digest('md5');
    digest2.process(bytes);
  }

  static void md5Class() {
    Uint8List bytes = Uint8List(10);
    // ruleid: use-of-md5
    var hasher = MD5Digest();
    hasher.process(bytes);
  }

  static void md5CryptoPkg() {
    var bytes = [1, 2, 3];
    // ruleid: use-of-md5
    var hash = crypto.md5.convert(bytes);
    print(hash);
  }

  static void okSha256() {
    Uint8List bytes = Uint8List(10);
    // ok: use-of-md5
    var digest = Digest('SHA-256');
    digest.process(bytes);

    // ok: use-of-md5
    var hasher = SHA256Digest();
    hasher.process(bytes);

    // ok: use-of-md5
    var hash = crypto.sha256.convert([1, 2, 3]);
    print(hash);
  }
}
