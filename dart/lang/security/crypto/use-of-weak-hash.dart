import 'dart:typed_data';
import 'package:pointycastle/export.dart';

class WeakHashes {
  static void weakFactory() {
    Uint8List bytes = Uint8List(10);

    // ruleid: use-of-weak-hash
    var d1 = Digest('MD2');
    d1.process(bytes);

    // ruleid: use-of-weak-hash
    var d2 = Digest('MD4');
    d2.process(bytes);

    // ruleid: use-of-weak-hash
    var d3 = Digest('RIPEMD-128');
    d3.process(bytes);

    // ruleid: use-of-weak-hash
    var d4 = Digest('RIPEMD160');
    d4.process(bytes);
  }

  static void weakClass() {
    Uint8List bytes = Uint8List(10);

    // ruleid: use-of-weak-hash
    var h1 = MD2Digest();
    h1.process(bytes);

    // ruleid: use-of-weak-hash
    var h2 = MD4Digest();
    h2.process(bytes);

    // ruleid: use-of-weak-hash
    var h3 = RIPEMD128Digest();
    h3.process(bytes);

    // ruleid: use-of-weak-hash
    var h4 = RIPEMD160Digest();
    h4.process(bytes);
  }

  static void okStrong() {
    Uint8List bytes = Uint8List(10);
    // ok: use-of-weak-hash
    var d = Digest('SHA-256');
    d.process(bytes);

    // ok: use-of-weak-hash
    var h = SHA256Digest();
    h.process(bytes);
  }
}
