import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8, // Adjust as needed
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  TextEditingController _destinationController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  int _adults = 1;

  // List of destinations
  final List<String> destinations = [
    'assets/tunis.jfif',
    'assets/tozeur.jpg',
    'assets/petra.jpg',
    'assets/alexadria.jpg',
    'assets/casa.jpg',
    'assets/dubai.jpg',
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
            elevation: 4.0,
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
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                      ),
                      child: Text('Search'),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'With Tabaani - Your safety is our priority',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.0),

          SizedBox(height: 16.0),

          // Card for Experiences
          Card(
            elevation: 4.0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our experiences',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
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
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Discover New Destinations and cities with Tabaani',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Explore Our Destinations Card
          Card(
            elevation: 4.0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Our Destinations',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 200.0, // Adjust the height as needed
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: destinations.length + 1, // +1 for looping
                      itemBuilder: (context, index) {
                        final destinationIndex = index % destinations.length;
                        if (index == destinations.length) {
                          return SizedBox
                              .shrink(); // Last item is a duplicate of the first
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                destinations[destinationIndex],
                                width: 240.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.0),

          // Meet Our Ambassadors Card
          _buildAmbassadorsCard(),

          SizedBox(height: 16.0),

          SizedBox(height: 16.0),

          // Explore with Tabaani Card
          _buildExploreCard(),
        ],
      ),
    );
  }

  Widget _buildAmbassadorsCard() {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meet Our Ambassadors:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Connect with our top-rated hosts all over the MENA region:',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 200.0, // Adjust the height as needed
              child: PageView.builder(
                controller: _pageController,
                itemCount: ambassadors.length + 1, // +1 for looping
                itemBuilder: (context, index) {
                  final ambassadorIndex = index % ambassadors.length;
                  if (index == ambassadors.length) {
                    return SizedBox
                        .shrink(); // Last item is a duplicate of the first
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage(ambassadors[ambassadorIndex].image),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            ambassadors[ambassadorIndex].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ambassadors[ambassadorIndex].destination,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16.0),
                              SizedBox(width: 4.0),
                              Text(
                                ambassadors[ambassadorIndex].rating.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
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
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore with Tabaani',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              height: 148.0, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: exploreItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            exploreItems[index].image,
                            width: 324.0,
                            height: 124.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          exploreItems[index].label,
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
