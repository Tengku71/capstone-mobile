import 'package:flutter/material.dart';
import 'package:mobile/widgets/side_menu.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/header.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final List<Map<String, dynamic>> _messages =
      []; // List to hold both user and bot messages
  final TextEditingController _controller =
      TextEditingController(); // Controller for the input field

  // Function to handle sending user messages
  void _sendMessage() {
    String message = _controller.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({
          "message": message,
          "isUser": true, // Mark the message as from the user
        });
      });
      _controller.clear();
      _botReply();
    }
  }

  // Function to handle bot's reply
  void _botReply() async {
    await Future.delayed(
        const Duration(seconds: 1)); // Simulate a delay for bot response
    setState(() {
      _messages.add({
        "message": _generateBotResponse(), // Generate a bot response
        "isUser": false, // Mark the message as from the bot
      });
    });
  }

  // Function to generate a simple bot response
  String _generateBotResponse() {
    List<String> botResponses = [
      "Hello! How can I help you today?",
      "I'm here to assist you.",
      "What would you like to know?",
      "Can you provide more details?",
    ];
    return botResponses[
        _messages.length % botResponses.length]; // Cycle through responses
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      endDrawer: SideMenu(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(28),
              ),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUserMessage = _messages[index]
                      ['isUser']; // Check if message is from user or bot
                  return Align(
                    alignment: isUserMessage
                        ? Alignment.centerRight // User messages on the right
                        : Alignment.centerLeft, // Bot messages on the left
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isUserMessage ? Colors.blue[200] : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        _messages[index]['message'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            padding: EdgeInsets.only(top: 10, left: 20),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(28),
            ),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type your message...',
                hintStyle: TextStyle(
                  fontSize: 18,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.send,
                  ),
                  padding: EdgeInsets.only(bottom: 10),
                  onPressed:
                      _sendMessage, // Send message when button is pressed
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: 1,
        pageIndex: 1,
      ),
    );
  }
}
