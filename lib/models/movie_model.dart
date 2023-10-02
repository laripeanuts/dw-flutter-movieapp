class MovieModel {
  final String title;
  final String director;
  final String description;
  final String id;
  final int year;

  MovieModel(
      {required this.title,
      required this.director,
      required this.description,
      required this.id,
      required this.year});

  factory MovieModel.fromJson(Map json) {
    return MovieModel(
        title: json['title'],
        director: json['director'],
        description: json['description'],
        id: json['id'],
        year: json['year']);
  }
}
