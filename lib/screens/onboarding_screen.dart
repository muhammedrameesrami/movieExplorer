import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            physics:
                const NeverScrollableScrollPhysics(), // Disable swipe if strict "Tap Next" is required, or allow it. Steps say "Tap next".
            children: [
              _buildPage(
                image: 'assets/firstscrenbackground.png',
                title: 'Catch Every\nBlockbuster Without\nthe Queue',
                isFirst: true,
              ),
              _buildPage(
                image: 'assets/secondbackround.png',
                title: 'Because\nMoviesDeserve\nMore Than Queues',
                isFirst: false,
              ),
            ],
          ),

          // Next Button
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == 0) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white
                      .withOpacity(0.2), // Frosted glass look or transparent
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('NEXT',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
      {required String image, required String title, required bool isFirst}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isFirst == true
                ? [
                    Colors.grey.withOpacity(0.1),
                    Colors.grey.withOpacity(0.6),
                    Colors.grey.withOpacity(
                        0.9), // Darker at bottom for text readability
                  ]
                : [
                    Colors.blue.withOpacity(0.1),
                    Colors.blue.withOpacity(0.6),
                    Colors.blue.withOpacity(
                        0.9), // Darker at bottom for text readability
                  ],
            stops: const [0.0, 0.6, 1.0],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2), // Push text down
            Text(
              title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: isFirst == true ? Colors.black : Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(0, 2),
                    blurRadius: 4.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100), // Space for button
          ],
        ),
      ),
    );
  }
}
