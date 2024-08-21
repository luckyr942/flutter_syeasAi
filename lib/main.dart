import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Performance Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PerformanceScreen(),
    );
  }
}

class PerformanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button and title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  Text(
                    'Performance',
                    style: TextStyle(
                      color: Color(0xFF374957),
                      fontSize: 20,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(width: 24), // Space to balance the row
                ],
              ),
              SizedBox(height: 20),

              // Profile section with image and text
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Arav Anand',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF374957),
                      fontSize: 18,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Text(
                    'Class 8TH',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF83898F),
                      fontSize: 12,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Search Bar
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Color(0xFF163B4A)),
                    SizedBox(width: 10),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Color(0xFF163B4A),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Subject Overview
              Text(
                'Subject Overview',
                style: TextStyle(
                  color: Color(0xFF374957),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  height: 0,
                ),
              ),
              SizedBox(height: 10),

              // Subject List
              Expanded(
                child: ListView(
                  children: [
                    buildSubjectItem(context, 'Mathematics Performance',
                        'LATEST SCORE : 85/100', 'assets/math.png'),
                    buildSubjectItem(context, 'Science Performance',
                        'LATEST SCORE : 85/100', 'assets/science.png'),
                    buildSubjectItem(context, 'English Performance',
                        'LATEST SCORE : 85/100', 'assets/english.png'),
                    buildSubjectItem(context, 'Hindi Performance',
                        'LATEST SCORE : 85/100', 'assets/hindi.png'),
                    buildSubjectItem(context, 'Social Science Performance',
                        'LATEST SCORE : 85/100', 'assets/social_science.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom navigation bar with styled text and icons from assets
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/logo (2).png', width: 24, height: 24),
            label: 'Sheshya',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Back to home (2).png',
                width: 24, height: 24),
            label: 'Performance',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/school (2).png', width: 24, height: 24),
            label: 'Career',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/adaptive_audio_mic (2).png',
                width: 24, height: 24),
            label: 'Chatbox',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/account_circle (1).png',
                width: 24, height: 24),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color(0xFF2C87FF),
        unselectedItemColor: Color(0xFF83898F),
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          color: Color(0xFF2C87FF),
          fontSize: 10,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: TextStyle(
          color: Color(0xFF83898F),
          fontSize: 10,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  // Function to build a subject item with asset icons
  Widget buildSubjectItem(
      BuildContext context, String subject, String score, String iconPath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SubjectDetailScreen(subject: subject)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.asset(iconPath, width: 52, height: 52),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: TextStyle(
                      color: Color(0xFF374957),
                      fontSize: 14,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Text(
                    score,
                    style: TextStyle(
                      color: Color(0xFF83898F),
                      fontSize: 10,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('assets/u_angle-right-b (2).png',
                width: 20, height: 20),
          ],
        ),
      ),
    );
  }
}

class SubjectDetailScreen extends StatelessWidget {
  final String subject;

  const SubjectDetailScreen({Key? key, required this.subject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
      ),
      body: Center(
        child: Text(
          '$subject Details',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
