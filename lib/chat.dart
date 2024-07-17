import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MessageListScreen(),
    );
  }
}

class MessageListScreen extends StatelessWidget {
  static const String id = 'chat_screen';

  final List<Message> messages = [
    Message(
      firstName: 'John',
      lastName: 'Doe',
      imageUrl: 'https://via.placeholder.com/150',
      message: 'Hello, how are you?',
    ),
    Message(
      firstName: 'Jane',
      lastName: 'Smith',
      imageUrl: 'https://via.placeholder.com/150',
      message: 'Hi! Long time no see.',
    ),
    Message(
      firstName: 'Alex',
      lastName: 'Johnson',
      imageUrl: 'https://via.placeholder.com/150',
      message: 'Are we still on for lunch?',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Action de recherche
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(message.imageUrl),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Text('${message.firstName} ${message.lastName}'),
                    subtitle: Text(message.message),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConversationScreen(client: message),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ConversationScreen extends StatelessWidget {
  final Message client;

  ConversationScreen({required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${client.firstName} ${client.lastName}'),
      ),
      body: Center(
        child: Text('Conversation avec ${client.firstName} ${client.lastName}'),
      ),
    );
  }
}

class Message {
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String message;

  Message({
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.message,
  });
}
