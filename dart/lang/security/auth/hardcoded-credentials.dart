class Config {
  void hardcodedApiKey() {
    // ruleid: hardcoded-credentials
    final apiKey = 'EXAMPLE_API_KEY_aBcDeFg12345xyz';
    print(apiKey);
  }

  void hardcodedPassword() {
    // ruleid: hardcoded-credentials
    var password = 'P@ssw0rd2024!';
    print(password);
  }

  void hardcodedSecret() {
    // ruleid: hardcoded-credentials
    const secret = 'super_secret_value_123';
    print(secret);
  }

  void hardcodedToken() {
    // ruleid: hardcoded-credentials
    String accessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9';
    print(accessToken);
  }

  void hardcodedClientSecret() {
    // ruleid: hardcoded-credentials
    final clientSecret = 'EXAMPLE_CLIENT_SECRET_qrstuv9876';
    print(clientSecret);
  }

  void hardcodedPrivateKey() {
    // ruleid: hardcoded-credentials
    final privateKey = 'EXAMPLE_PRIVATE_KEY_PEM_BLOCK_zz';
    print(privateKey);
  }

  void emptyValue() {
    // ok: hardcoded-credentials
    final apiKey = '';
    print(apiKey);
  }

  void shortPlaceholder() {
    // ok: hardcoded-credentials
    final password = 'TODO';
    print(password);
  }

  void unrelatedName() {
    // ok: hardcoded-credentials
    final username = 'admin@example.com';
    print(username);
  }

  void fromEnvironment() {
    // ok: hardcoded-credentials
    final apiKey = const String.fromEnvironment('API_KEY');
    print(apiKey);
  }
}
