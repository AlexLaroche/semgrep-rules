import 'dart:io';

class Runner {
  Future<ProcessResult> interpolatedExe(String userInput) async {
    // ruleid: command-injection
    return Process.run("echo $userInput", []);
  }

  ProcessResult interpolatedExeSync(String userInput) {
    // ruleid: command-injection
    return Process.runSync("/usr/bin/${userInput}", []);
  }

  Future<Process> interpolatedExeStart(String userInput) async {
    // ruleid: command-injection
    return Process.start("/usr/bin/${userInput}", []);
  }

  Future<ProcessResult> shellInjection(String userInput) async {
    // ruleid: command-injection
    return Process.run("sh", ["-c", "cat $userInput"]);
  }

  Future<ProcessResult> shellInjectionBash(String userInput) async {
    // ruleid: command-injection
    return Process.run("/bin/sh", ["-c", "echo ${userInput}"]);
  }

  Future<ProcessResult> shellInjectionCmd(String userInput) async {
    // ruleid: command-injection
    return Process.run("cmd", ["/c", "echo $userInput"]);
  }

  Future<ProcessResult> shellInjectionUsrBin(String userInput) async {
    // ruleid: command-injection
    return Process.run("/usr/bin/bash", ["-c", "echo $userInput"]);
  }

  Future<ProcessResult> runInShellInterpolated(String userInput) async {
    // ruleid: command-injection
    return Process.run("ls", ["${userInput}"], runInShell: true);
  }

  // Variable-built command — only caught by taint mode
  Future<ProcessResult> shellInjectionIndirect(String userInput) async {
    final cmd = "cat $userInput";
    // ruleid: command-injection
    return Process.run("sh", ["-c", cmd]);
  }

  Future<ProcessResult> runInShellIndirect(String userInput) async {
    final arg = userInput + ".txt";
    // ruleid: command-injection
    return Process.run("ls", [arg], runInShell: true);
  }

  Future<ProcessResult> taintedExeIndirect(String userInput) async {
    final exe = "/usr/bin/" + userInput;
    // ruleid: command-injection
    return Process.run(exe, []);
  }

  Future<ProcessResult> safeArgs(String userInput) async {
    // ok: command-injection
    return Process.run("ls", ["-la", userInput]);
  }

  Future<ProcessResult> safeLiteral() async {
    // ok: command-injection
    return Process.run("ls", ["-la", "/tmp"]);
  }

  Future<ProcessResult> safeShellLiteral() async {
    // ok: command-injection
    return Process.run("sh", ["-c", "echo hello"]);
  }

  Future<ProcessResult> safeRunInShellLiteral() async {
    // ok: command-injection
    return Process.run("ls", ["-la"], runInShell: true);
  }
}
