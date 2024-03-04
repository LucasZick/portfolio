import 'dart:convert';
import 'package:http/http.dart' as http;

class MessageSender {
  static Future<String> sendMessage(Map payload) async {
    const String endpoint = 'http://144.22.193.227:5000/sendEmail';
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        return 'Thank you for sending a message, ${payload['name']}! The confirmation was sent to ${payload['email']}';
      } else {
        return 'Failed sending the message. Status code: ${response.statusCode}';
      }
    } catch (e) {
      return 'Failed sending the message: $e';
    }
  }
}
