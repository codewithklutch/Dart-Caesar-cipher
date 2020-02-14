import 'dart:io';

void main() {
  // Creates a map of the cipher
	Map<String, String> cipher = caesarCipher();
  // Ask user for input
  print('Enter a message');
  // Stores the input to a variable
  String output = stdin.readLineSync();
  String changed = "";
  for (String character in output.split('')) {
    if (cipher.containsKey(character)) {
      changed += cipher[character];
    } else {
      changed += character;
    }
  }
  print(changed);
  exit(2);
}

Map caesarCipher() {
  // Letters list
  const List<String> Letters = const ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
  // Cipher Key value 
  int Key = 13;
  // Create a map of the converted characters
  Map<String, String> code = {};
    // Logic to shift the characters
    for (int i = 0; i < Letters.length; i++) {
      if (i < Key) {
        code[Letters[i]] = Letters[i + Key];
        code[Letters[i].toUpperCase()] = Letters[i + Key].toUpperCase();
      } else {
        code[Letters[i]] = Letters[i - Key];
        code[Letters[i].toUpperCase()] = Letters[i - Key].toUpperCase();
      }
    }
  // returns the cipher algorhythm
  return code;
}
// Set exit code
void exitCode(int code) => exit(code);