import 'dart:convert';
import 'package:http/http.dart' as http;

class MessageSender {
  static Future<String> sendMessage(Map payload) async {
    const String endpoint = 'https://zick.is-a.dev:5000/sendEmail';
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin": "*",
        },
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
