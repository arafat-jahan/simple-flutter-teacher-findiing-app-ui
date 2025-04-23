import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher Finder',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SignUpScreen(),
    );
  }
}

// ===================== PAGE 1: SIGN UP SCREEN =====================
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildCard(context, 'I\'m looking for a teacher', true),
            SizedBox(height: 12),
            buildCard(context, 'I\'m looking  a teacher', false),
            SizedBox(height: 12),
            buildCard(context, 'I\'m looking for a teacher', false),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String text, bool isHighlighted) {
    return GestureDetector(
      onTap: () {
        if (isHighlighted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchResultScreen()),
          );
        }
      },
      child: Card(
        color: isHighlighted ? Colors.lightGreen : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isHighlighted ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ===================== PAGE 2: SEARCH RESULT SCREEN =====================
class SearchResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          buildProfileCard(),
          SizedBox(height: 16),
          buildProfileCard(),
        ],
      ),
    );
  }

  Widget buildProfileCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/avatar.png'), // or NetworkImage
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lorem ipsum',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(' 4.9  •  9:00 PM'),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('PROFILE')),
                OutlinedButton(onPressed: () {}, child: Text('HIRE')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
