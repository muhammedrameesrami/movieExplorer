import 'package:flutter/material.dart';
import '../data/models/movie_model.dart';

class MovieProvider with ChangeNotifier {
  // Featured (Hero)
  final List<Movie> _featuredMovies = [
    Movie(
      title: "Doctor Strange",
      year: "2016",
      imdbID: "tt2543164",
      type: "movie",
      poster:
          "https://m.media-amazon.com/images/M/MV5BNjgwNzAzNjk1Nl5BMl5BanBnXkFtZTgwMzA2Njg2OTE@._V1_SX300.jpg",
      plot:
          "While on a journey of physical and spiritual healing, a brilliant neurosurgeon is drawn into the world of the mystic arts.",
      director: "Scott Derrickson",
      genre: "Action, Adventure, Fantasy",
      imdbRating: "7.5",
      runtime: "115 min",
    ),
  ];

  // Now Playing (Middle Carousel)
  final List<Movie> _nowPlayingMovies = [
    Movie(
      title: "The Home",
      year: "2024",
      imdbID: "tt1234567",
      type: "movie",
      poster:
          "https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_SX300.jpg",
      plot: "A thriller about a home invasion.",
      genre: "Horror, Thriller",
      runtime: "100 min",
    ),
    Movie(
      title: "Superman: Legacy",
      year: "2025",
      imdbID: "tt10579952",
      type: "movie",
      poster:
          "https://m.media-amazon.com/images/M/MV5BMTk5ODk1NDkxMF5BMl5BanBnXkFtZTgwNjYzMTBkOTE@._V1_SX300.jpg",
      plot:
          "Clark Kent, slightly older and wiser, reflects on his place in the world.",
      genre: "Action, Sci-Fi",
      runtime: "130 min",
    ),
    Movie(
      title: "F1",
      year: "2025",
      imdbID: "tt16311068",
      type: "movie",
      poster:
          "https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg",
      plot: "A formula one driver comes out of retirement.",
      genre: "Action, Drama, Sport",
      runtime: "120 min",
    ),
  ];

  // Trending
  final List<Movie> _trendingMovies = [
    Movie(
      title: "Ant-Man",
      year: "2015",
      imdbID: "tt0478970",
      type: "movie",
      poster:
          "https://m.media-amazon.com/images/M/MV5BMjM2NTQ5Mzc2M15BMl5BanBnXkFtZTgwNTcxMDI2NTE@._V1_SX300.jpg",
      plot:
          "Armed with a super-suit with the astonishing ability to shrink in scale but increase in strength, cat burglar Scott Lang must embrace his inner hero.",
      director: "Peyton Reed",
      genre: "Action, Adventure, Comedy",
      imdbRating: "7.3",
      runtime: "117 min",
    ),
    Movie(
      title: "Avengers: Endgame",
      year: "2019",
      imdbID: "tt4154796",
      type: "movie",
      poster:
          "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg",
      plot:
          "After the devastating events of Avengers: Infinity War (2018), the universe is in ruins.",
      director: "Anthony Russo, Joe Russo",
      genre: "Action, Adventure, Drama",
      imdbRating: "8.4",
      runtime: "181 min",
    ),
    Movie(
      title: "Gravity",
      year: "2013",
      imdbID: "tt1454468",
      type: "movie",
      poster:
          "https://m.media-amazon.com/images/M/MV5BNjE5MzYwMzYxMF5BMl5BanBnXkFtZTgwOTk4MTk0MzE@._V1_SX300.jpg",
      plot:
          "Two astronauts work together to survive after an accident leaves them stranded in space.",
      director: "Alfonso Cuarón",
      genre: "Drama, Sci-Fi, Thriller",
      imdbRating: "7.7",
      runtime: "91 min",
    ),
  ];

  // Upcoming
  final List<Movie> _upcomingMovies = [
    Movie(
      title: "Jurassic World",
      year: "2015",
      imdbID: "tt3696106",
      type: "movie",
      poster:
          "https://m.media-amazon.com/images/M/MV5BNzQ3OTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",
      plot:
          "A new theme park, built on the original site of Jurassic Park, creates a genetically modified hybrid dinosaur, the Indominus Rex, which escapes containment and goes on a killing spree.",
      director: "Colin Trevorrow",
      genre: "Action, Adventure, Sci-Fi",
      imdbRating: "7.0",
      runtime: "124 min",
    ),
    Movie(
      title: "The Invincible",
      year: "2008",
      imdbID: "tt0371746",
      type: "movie",
      poster:
          "https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX300.jpg",
      plot:
          "After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.",
      director: "Jon Favreau",
      genre: "Action, Adventure, Sci-Fi",
      imdbRating: "7.9",
      runtime: "126 min",
    ),
    Movie(
      title: "Downton Abbey",
      year: "2019",
      imdbID: "tt6398184",
      type: "movie",
      poster:
          "https://m.media-amazon.com/images/M/MV5BMGUwZjliMTAtNzAxZi00MWNiLWE2NzgtZGUxMGQxZjQwZDgwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg",
      plot:
          "The continuing story of the Crawley family, wealthy owners of a large estate in the English countryside in the early twentieth century.",
      director: "Michael Engler",
      genre: "Drama, Romance",
      imdbRating: "7.4",
      runtime: "122 min",
    )
  ];

  // Combined list for search
  List<Movie> get _allMovies => [
        ..._featuredMovies,
        ..._nowPlayingMovies,
        ..._trendingMovies,
        ..._upcomingMovies
      ];

  List<Movie> _searchResults = [];
  bool _isLoading = false;
  String _currentQuery = '';

  List<Movie> get featuredMovies => _featuredMovies;
  List<Movie> get nowPlayingMovies => _nowPlayingMovies;
  List<Movie> get trendingMovies => _trendingMovies;
  List<Movie> get upcomingMovies => _upcomingMovies;

  List<Movie> get movies =>
      _currentQuery.isEmpty ? _trendingMovies : _searchResults;

  bool get isLoading => _isLoading;
  bool get hasMore => false;
  String get errorMessage => '';

  void searchMovies(String query, {bool isNewSearch = true}) {
    _currentQuery = query;
    _isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        _searchResults = [];
      } else {
        _searchResults = _allMovies
            .where((movie) =>
                movie.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<Movie?> getMovieDetails(String imdbId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _allMovies.firstWhere((m) => m.imdbID == imdbId);
    } catch (e) {
      return null;
    }
  }
}
