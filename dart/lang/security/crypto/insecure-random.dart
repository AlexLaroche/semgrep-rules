import 'dart:math';

class TokenGenerator {
  String insecureToken() {
    // ruleid: insecure-random
    final rng = Random();
    return rng.nextInt(1 << 32).toString();
  }

  String insecureSeededToken() {
    // ruleid: insecure-random
    final rng = Random(42);
    return rng.nextInt(1 << 32).toString();
  }

  String secureToken() {
    // ok: insecure-random
    final rng = Random.secure();
    return rng.nextInt(1 << 32).toString();
  }
}
