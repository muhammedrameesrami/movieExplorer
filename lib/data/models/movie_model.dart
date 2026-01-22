class Movie {
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;
  final String? plot;
  final String? director;
  final String? genre;
  final String? imdbRating;
  final String? released;
  final String? runtime;

  Movie({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.type,
    required this.poster,
    this.plot,
    this.director,
    this.genre,
    this.imdbRating,
    this.released,
    this.runtime,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] ?? 'Unknown Title',
      year: json['Year'] ?? 'Unknown Year',
      imdbID: json['imdbID'] ?? '',
      type: json['Type'] ?? '',
      poster:
          json['Poster'] != "N/A" ? json['Poster'] : '', // Handle N/A poster
      plot: json['Plot'],
      director: json['Director'],
      genre: json['Genre'],
      imdbRating: json['imdbRating'],
      released: json['Released'],
      runtime: json['Runtime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Year': year,
      'imdbID': imdbID,
      'Type': type,
      'Poster': poster,
      'Plot': plot,
      'Director': director,
      'Genre': genre,
      'imdbRating': imdbRating,
      'Released': released,
      'Runtime': runtime,
    };
  }
}

class MovieSearchResponse {
  final List<Movie> movies;
  final String totalResults;
  final String response;

  MovieSearchResponse({
    required this.movies,
    required this.totalResults,
    required this.response,
  });

  factory MovieSearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['Response'] == 'False') {
      return MovieSearchResponse(
          movies: [], totalResults: '0', response: 'False');
    }
    var list = json['Search'] as List;
    List<Movie> moviesList = list.map((i) => Movie.fromJson(i)).toList();
    return MovieSearchResponse(
      movies: moviesList,
      totalResults: json['totalResults'] ?? '0',
      response: json['Response'] ?? 'False',
    );
  }
}
