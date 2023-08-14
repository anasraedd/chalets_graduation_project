
import 'dart:math';

class GenerateUsername{
  static String generateUsernameFromName(String name) {
    // Remove whitespace and convert name to lowercase
    final cleanedName = name.trim().toLowerCase();

    // Split the name into parts using whitespace
    final nameParts = cleanedName.split(' ');

    // Take the first letter from each part
    final initials = nameParts.map((part) => part[0]).join();

    // Generate a random number between 100 and 999
    final random = Random();
    final randomNumber = random.nextInt(900) + 100;

    // Combine initials and random number to create the username
    final username = '$initials$randomNumber';

    return username;
  }
}
