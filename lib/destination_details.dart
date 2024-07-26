import 'package:flutter/material.dart';
import 'package:tabaani/home.dart';

class DestinationDetails extends StatelessWidget {
  final String imagePath;
  final String destinationName;

  DestinationDetails({required this.imagePath, required this.destinationName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destinationName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 250.0,
                  left: 16.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    color: Colors.black.withOpacity(0.2),
                    child: Text(
                      'Things to do in $destinationName',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Going to $destinationName and wondering what to do? No need to worry, there are plenty of things to do in $destinationName with a local. Join your favorite host and discover the best the city has to offer from an exclusive selection of unique experiences.',
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Top 6 Things to do in $destinationName',
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 48, 48, 48),
                ),
              ),
            ),
            const SizedBox(height: 0.0),
            const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                'most rated experience verified and approved by Tabaani ',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Color.fromARGB(255, 100, 100, 100),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            // Placeholder for your cards
            const SizedBox(
              height: 300.0, // Adjust the height as needed
              child: Card(), // Replace with your actual cards
            ),
          ],
        ),
      ),
    );
  }
}
