import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDE9D1), // Background color set to FDE9D1
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Circular container with decorations
            Container(
              height: 50.0,
              width: 50.0,
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Shape set to circle
                border: Border.all(
                  color: Colors.green, // Border color set to green
                  width: 2.0, // Border width
                ),
              ),
              child: Center(
                child: Text(
                  'C',
                  style: TextStyle(
                    color: Colors.green, // Text color set to green
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0), // Added SizedBox for spacing
            // Horizontal slider for trailing component
            Container(
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  5,
                  (index) => buildTrailingItem(index),
                ),
              ),
            ),
            // Multiple cards
            buildMultipleCards(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget buildMultipleCards() {
    return Column(
      children: [
        buildCard('Product 1', 'Description of Product 1'),
        SizedBox(height: 16.0),
        buildCard('Product 2', 'Description of Product 2'),
        SizedBox(height: 16.0),
        buildCard('Product 3', 'Description of Product 3'),
      ],
    );
  }

  Widget buildCard(String productName, String productDescription) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              productName,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              productDescription,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Add functionality for the button here
              },
              child: Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTrailingItem(int index) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text('Slider Item $index'),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
