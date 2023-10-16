import 'package:flutter/material.dart';
import 'personalpage.dart';
import 'businesspage.dart';
import 'merchantpage.dart';
import 'refinepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    PersonalPage(),
    BusinessPage(),
    MerchantPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(170, 65, 105, 250),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Implement your menu action here
          },
        ),
        title: Text(
          'Network',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'lib/Refine_1.png', // Adjust the path to your PNG image
              width: 45, // Set the width of the image as needed
              height: 45, // Set the height of the image as needed
            ),
            onPressed: () {
              // Implement your refine action here (navigate to a new page)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RefinePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(170, 82, 118, 248),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavigationOption('Personal', 0),
                buildNavigationOption('Business', 1),
                buildNavigationOption('Merchant', 2),
              ],
            ),
          ),

          // Container(
          //   width: double.infinity,
          //   height: 2,
          //   color: Colors.blue, // Highlight the selected option
          // ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavigationOption(String text, int index) {
    final isSelected = _currentIndex == index;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: isSelected ? 4.0 : 0.0, // Adjust the width of the line
          ),
        ),
      ),
      child: TextButton(
        onPressed: () {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class RoundedButton extends StatefulWidget {
  final Color color;
  final VoidCallback onPressed;
  final String name;

  RoundedButton({
    required this.color,
    required this.onPressed,
    required this.name,
  });

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: isClicked ? Color.fromARGB(255, 26, 66, 99) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            isClicked = !isClicked;
          });
          widget.onPressed();
        },
        child: Text(
          widget.name,
          style: TextStyle(
            color:
                isClicked ? Colors.white : const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}
