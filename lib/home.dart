import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabaani/destination_details.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  late PageController _destinationPageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    _destinationPageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < destinations.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _destinationPageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _destinationPageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  TextEditingController _destinationController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  int _adults = 1;

// List of destinations with names
  final List<Map<String, String>> destinations = [
    {'image': 'assets/tunis.jfif', 'name': 'Tunis'},
    {'image': 'assets/tozeur.jpg', 'name': 'Tozeur'},
    {'image': 'assets/petra.jpg', 'name': 'Petra'},
    {'image': 'assets/alexadria.jpg', 'name': 'Alexandria'},
    {'image': 'assets/casa.jpg', 'name': 'Casablanca'},
    {'image': 'assets/dubai.jpg', 'name': 'Dubai'},
  ];

  // List of ambassadors
  final List<Ambassador> ambassadors = [
    Ambassador(
      name: 'AYOUB',
      image: 'assets/ayoub.jpg',
      destination: 'Tunis',
      rating: 4.5,
    ),
    Ambassador(
      name: 'FARES',
      image: 'assets/fares.jpg',
      destination: 'Dubai',
      rating: 4.8,
    ),
    Ambassador(
      name: 'BECHIR',
      image: 'assets/bechir.jpg',
      destination: 'Petra',
      rating: 4.2,
    ),
  ];

  // List of explore items
  final List<ExploreItem> exploreItems = [
    ExploreItem(
      image: 'assets/family_friendly.jpg',
      label: 'Family Friendly',
    ),
    ExploreItem(
      image: 'assets/walk.jpg',
      label: 'Walking Tours',
    ),
    ExploreItem(
      image: 'assets/road.jfif',
      label: 'Road Trip',
    ),
    ExploreItem(
      image: 'assets/bike.jfif',
      label: 'Bike Tour',
    ),
    ExploreItem(
      image: 'assets/night.jpg',
      label: 'Night Life',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(0.0),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                // Handle profile action
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Background Image with Text
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                'assets/egypt.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.black.withOpacity(0.5),
                child: Text(
                  'Book Authentic Unique Experiences',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),

          // Card for Destinations

          // Form for Destination, Date, and People
          Card(
            elevation: 0.0,
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _destinationController,
                    decoration: InputDecoration(
                      hintText: 'Where are you going?',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      hintText: '07/17/2024',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField<int>(
                    value: _adults,
                    onChanged: (value) {
                      setState(() {
                        _adults = value!;
                      });
                    },
                    items: List.generate(10, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text('${index + 1} Adults'),
                      );
                    }),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement search logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(202, 154, 22, 1.0),
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                      ),
                      child: Text(
                        'Search',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'With ',
                            style: GoogleFonts.roboto(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: 'Tabaani',
                            style: GoogleFonts.pacifico(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: ' - Your safety is our priority',
                            style: GoogleFonts.roboto(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.black),
          // Card for Experiences
          Card(
            elevation: 0.0,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our experiences',
                    style: GoogleFonts.roboto(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Divider(color: Colors.grey[300]),
                  ExperienceRow(
                    imagePath: 'assets/explore.jpg',
                    title: 'Private & Personal',
                    description:
                        'No strangers, just you. Fully customize your trip to your needs.',
                    isImageRight: true,
                  ),
                  SizedBox(height: 16.0),
                  ExperienceRow(
                    imagePath: 'assets/camp.jfif',
                    title: 'With a Passionate Local',
                    description:
                        'From historical facts to the most up-to-date health regulations.',
                    isImageRight: false,
                  ),
                  SizedBox(height: 16.0),
                  ExperienceRow(
                    imagePath: 'assets/sahara.jpg',
                    title: 'Without Crowds',
                    description:
                        'Experiences designed to take you away from the crowds towards authentic local spots.',
                    isImageRight: true,
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
          Divider(color: Colors.black),
          // Explore Our Destinations Card
          Card(
            elevation: 0.0,
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Discover New Destinations and cities with ',
                          style: GoogleFonts.roboto(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Tabaani',
                          style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 120.0,
                    child: PageView.builder(
                      controller: _destinationPageController,
                      itemCount: destinations.length,
                      itemBuilder: (context, index) {
                        final destination = destinations[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DestinationDetails(
                                  imagePath: destination['image']!,
                                  destinationName: destination['name']!,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    destination['image']!,
                                    width: 240.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: Text(
                                          destination['name']!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 26.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.0),
          Divider(color: Colors.black),
          // Meet Our Ambassadors Card
          _buildAmbassadorsCard(),

          SizedBox(height: 16.0),

          Divider(color: Colors.black),

          // Explore with Tabaani Card
          _buildExploreCard(),
        ],
      ),
    );
  }

  Widget _buildAmbassadorsCard() {
    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meet our ambassadors:',
              style: GoogleFonts.roboto(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Connect with our Top rated Hosts all over the MENA Region:',
              style: GoogleFonts.roboto(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 250.0, // Adjust the height as needed
              child: PageView.builder(
                controller: _pageController,
                itemCount: ambassadors.length, // Remove +1 for looping
                itemBuilder: (context, index) {
                  final ambassador = ambassadors[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage(ambassador.image),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              ambassador.name,
                              style: GoogleFonts.roboto(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            SizedBox(height: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_pin,
                                    color: Colors.grey, size: 16.0),
                                SizedBox(width: 4.0),
                                Text(
                                  ambassador.destination,
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 14.0),
                                Icon(Icons.star,
                                    color: Colors.grey, size: 16.0),
                                SizedBox(width: 4.0),
                                Text(
                                  ambassador.rating.toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                        Positioned(
                          top: 110,
                          right: 70,
                          child: SvgPicture.asset(
                            'assets/medal.svg',
                            width: 32.0,
                            height: 32.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExploreCard() {
    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Explore with ',
                    style: GoogleFonts.roboto(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Tabaani',
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 180.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: exploreItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            exploreItems[index].image,
                            width: 200.0,
                            height: 120.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          exploreItems[index].label,
                          style: GoogleFonts.roboto(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceRow extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isImageRight;

  const ExperienceRow({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.isImageRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          isImageRight ? _buildImageRightLayout() : _buildImageLeftLayout(),
    );
  }

  List<Widget> _buildImageRightLayout() {
    return [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 16.0),
      Container(
        width: 100,
        height: 100,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    ];
  }

  List<Widget> _buildImageLeftLayout() {
    return [
      Container(
        width: 100,
        height: 100,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(width: 16.0),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ];
  }
}

class ExploreItem {
  final String image;
  final String label;

  ExploreItem({required this.image, required this.label});
}

class Ambassador {
  final String name;
  final String image;
  final String destination;
  final double rating;

  Ambassador({
    required this.name,
    required this.image,
    required this.destination,
    required this.rating,
  });
}
