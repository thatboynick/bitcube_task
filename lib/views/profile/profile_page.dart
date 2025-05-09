import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Gradient Index
  int _gradientIndex = 0;

  // Gradient Colour List
  final List<List<Color>> _gradients = [
    [Colors.purpleAccent, Colors.blueAccent],
    [Colors.orangeAccent, Colors.pinkAccent],
    [Colors.greenAccent, Colors.cyanAccent],
  ];

  // Mood Colour List
  final List<Color> _moodColors = [
    Colors.blueAccent,
    Colors.pinkAccent,
    Colors.cyanAccent,
  ];

  // Name and Bio
  String _name = 'Nick Baloi';
  String _bio =
      'I am Christian man passionate in coding and learning new things. I am a full stack developer with a strong background in information technology. I am passionate about creating innovative solutions that make a positive impact on people\'s lives.\n\n Click the icons below to learn more about me and my interests!';

  // Change gradients method
  void _changeGradient() {
    setState(() {
      _gradientIndex = (_gradientIndex + 1) % _gradients.length;
    });
  }

  // Show Interest Bottom Sheet
  void _showInterestDialog(String title, String description, Color bgColor) {
    showModalBottomSheet(
      context: context,
      backgroundColor: bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
    );
  }

  // Edit Profile method
  void _editProfile() {
    final nameController = TextEditingController(text: _name);
    final bioController = TextEditingController(text: _bio);

    // Edit Profile Show Dialog
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: const Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name text field
                TextField(
                  controller: nameController,
                  cursorColor: Colors.white70,
                  style: TextStyle(color: Colors.white70),
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white38),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),

                // Bio text field
                TextField(
                  controller: bioController,
                  cursorColor: Colors.white70,
                  style: TextStyle(color: Colors.white70),
                  decoration: const InputDecoration(
                    labelText: 'Bio',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white38),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  maxLines: 5,
                ),
              ],
            ),
            actions: [

              // Cancel button
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Save button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _name = nameController.text;
                    _bio = bioController.text;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gradient = _gradients[_gradientIndex];
    final moodColor = _moodColors[_gradientIndex];

    return Scaffold(
      backgroundColor: const Color(0xff18112e),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  
                  Stack(
                    alignment: Alignment.center,
                    children: [

                      // Glow Circle
                      Container(
                        width: 230,
                        height: 230,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: gradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: gradient.first.withOpacity(0.6),
                              blurRadius: 100,
                              spreadRadius: 50,
                            ),
                          ],
                        ),
                      ),

                      // Profile Picture
                      ClipOval(
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.white, Colors.transparent],
                              stops: [0.7, 1.0],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image.asset(
                            'assets/nick.png',
                            width: 230,
                            height: 230,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // First Name and Last Name
                  Text(
                    _name,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Bio
                  Text(
                    _bio,
                    style: const TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Interests
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'INTERESTS',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Change Mood and Edit Profile
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.purple,
                        child: IconButton(
                          icon: const Icon(Icons.code, color: Colors.white),
                          onPressed:
                              () => _showInterestDialog(
                                'Coding',
                                'I love building web and mobile apps using Flutter and .NET. My love for coding grew when I realized the endless possibilities in creativity and solutions to real-world problems',
                                Colors.purple,
                              ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.orange,
                        child: IconButton(
                          icon: const Icon(Icons.church, color: Colors.white),
                          onPressed:
                              () => _showInterestDialog(
                                'Faith',
                                'My Christian faith is central to my values and purpose. I got saved at The Potters House Bloemfontein Church in 2023 and my sound and media minstry is very dear to me. I also provide ICT solutions to my church, for e.g. www.thepottershousebloem.com',
                                Colors.orange,
                              ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.green,
                        child: IconButton(
                          icon: const Icon(
                            Icons.food_bank,
                            color: Colors.white,
                          ),
                          onPressed:
                              () => _showInterestDialog(
                                'Health and Fitness',
                                'I believe in living a healthy life so I invest in my health through eating good and working out.',
                                Colors.green,
                              ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.pink,
                        child: IconButton(
                          icon: const Icon(Icons.book, color: Colors.white),
                          onPressed:
                              () => _showInterestDialog(
                                'Reading',
                                'I enjoy reading books on my Christian faith and how I could use the Bible\'s principles to live a better life.',
                                Colors.pink,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _changeGradient,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          backgroundColor: moodColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Change Mood',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _editProfile,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
