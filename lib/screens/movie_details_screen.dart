import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../core/theme.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String imdbId;
  const MovieDetailsScreen({super.key, required this.imdbId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  List<String> dates = ['12 Fri', '13 Sat', '14 Sun', '15 Mon', '16 Tue', '17 Wed', '18 Thu'];
  List<String> times = ['09:40 AM', '11:30 AM', '02:15 PM', '05:00 PM', '08:30 PM', '10:00 PM'];
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieProvider>(context, listen: false)
          .getMovieDetails(widget.imdbId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.5),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, 
                color: Colors.white, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: FutureBuilder(
        future: Provider.of<MovieProvider>(context, listen: false)
            .getMovieDetails(widget.imdbId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFE50914)),
            );
          }
          if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text('Error loading details: ${snapshot.error}',
                  style: const TextStyle(color: Colors.white)),
            );
          }

          final movie = snapshot.data!;
          
          return CustomScrollView(
            slivers: [
              // Hero Image Section
              SliverAppBar(
                expandedHeight: 400,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      // Background Image
                      movie.poster != "N/A"
                          ? CachedNetworkImage(
                              imageUrl: movie.poster,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            )
                          : Container(color: Colors.grey[900]),
                      
                      // Gradient Overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                              Colors.black,
                            ],
                            stops: const [0.0, 0.6, 1.0],
                          ),
                        ),
                      ),
                      
                      // Studio Logo and Title
                      Positioned(
                        bottom: 60,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MARVEL STUDIOS',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.8),
                                letterSpacing: 2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              movie.title.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      
                      // Watch Trailer Button
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE50914),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.play_arrow_rounded, 
                                      color: Colors.white, size: 20),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Watch Trailer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: const Text(
                                '26',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Movie Info Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      
                      // Cinema Formats
                      Text(
                        'IN DOLBY CINEMA, REALD 3D AND IMAX',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.7),
                          letterSpacing: 1,
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Divider
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Genre Chips
                      Wrap(
                        spacing: 12,
                        children: movie.genre!.split(', ').map((genre) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            child: Text(
                              genre.trim(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // Movie Title
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Movie Details
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE50914),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text(
                              'UA16+',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'English • 2 hr 18 min',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Plot Description
                      Text(
                        'After The Devastating Events Of Avengers: Infinity War (2018), The Universe Is In Ruins. With The Help Of Remaining Allies, The Avengers Assemble Once More In Order To Reverse Thanos\' Actions And Restore Balance To The Universe',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.5,
                        ),
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // Cast Section
                      const Text(
                        'Cast:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 15),
                      
                      // Cast Members
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCastMember('Robert Downey Jr.', 'Tony Stark / Iron Man'),
                          const SizedBox(height: 12),
                          _buildCastMember('Scarlett Johansson', 'Natasha Romanoff / Black Widow'),
                          const SizedBox(height: 12),
                          _buildCastMember('Chris Evans', 'Steve Rogers / Captain America'),
                          const SizedBox(height: 12),
                          _buildCastMember('Mark Ruffalo', 'Bruce Banner / Hulk'),
                        ],
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Date Selection
                      const Text(
                        'Select Date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 15),
                      
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dates.length,
                          itemBuilder: (context, index) {
                            final dateParts = dates[index].split(' ');
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDateIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: selectedDateIndex == index
                                      ? const Color(0xFFE50914)
                                      : Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: selectedDateIndex == index
                                        ? const Color(0xFFE50914)
                                        : Colors.white.withOpacity(0.3),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      dateParts[0],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: selectedDateIndex == index
                                            ? Colors.white
                                            : Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      dateParts[1],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: selectedDateIndex == index
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // Time Selection
                      const Text(
                        'Select Time',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 15),
                      
                      // First row of times
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: times.length ~/ 2,
                          itemBuilder: (context, index) {
                            return _buildTimeSlot(times[index], index);
                          },
                        ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Second row of times
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: times.length - (times.length ~/ 2),
                          itemBuilder: (context, index) {
                            final timeIndex = (times.length ~/ 2) + index;
                            return _buildTimeSlot(times[timeIndex], timeIndex);
                          },
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // BOOK NOW Button
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFE50914), Color(0xFFB81D24)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFE50914).withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => BookingScreen(movie: movie),
                              //   ),
                              // );
                            },
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.confirmation_num_rounded, 
                                      color: Colors.white, size: 24),
                                  SizedBox(width: 12),
                                  Text(
                                    'BOOK NOW',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCastMember(String name, String role) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.1),
          ),
          child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                role,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlot(String time, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: selectedTimeIndex == index
              ? const Color(0xFFE50914)
              : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: selectedTimeIndex == index
                ? const Color(0xFFE50914)
                : Colors.white.withOpacity(0.3),
          ),
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: selectedTimeIndex == index
                ? Colors.white
                : Colors.white,
          ),
        ),
      ),
    );
  }
}