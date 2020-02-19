/// A BASIC COMMAND LINE CASESAR CIPHER WRITTEN IN DART  ///
/// Klutch // Klutchdevelopment@gmail.com // 02/19/2020 ///
/// Written for part of a "CODE WITH KLUTCH" tutorial  ///

import 'dart:io';

void main() {
  // Creates a map of the cipher
	Map<String, String> cipher = caesarCipher();

  // Ask user to input a message they want to cipher
  print('Enter a message',);
  // Stores the message input to the output variable
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
  // Terminate the program properly using exit code '2' (Planned and successful exit)
  exit(2);
}

Map caesarCipher() {
  // Letters list
  const List<String> Letters = const ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];

  // Cipher Key value, which is hardcoated with a value of 13
  // This allows the ciphered message to be ran through the program again to decipher
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
  // return the ciphered message
  return code;
}
// Set the exit code
void exitCode(int code) => exit(code);