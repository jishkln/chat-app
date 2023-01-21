import 'dart:math';

String getRandomString(int length) {
  var maxLength = 128;
  if (length > maxLength) {
    length = maxLength;
  }
  var random = Random();

  var codeUnits = List.generate(length, (index) {
    return random.nextInt(33) + 89;
  });

  return String.fromCharCodes(codeUnits);
}
