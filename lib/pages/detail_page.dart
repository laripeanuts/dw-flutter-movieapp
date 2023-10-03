import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    MovieModel movie = ModalRoute.of(context)!.settings.arguments as MovieModel;

    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.indigoAccent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(movie.director,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(movie.year.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 16),
              Text(movie.description,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal)),
            ],
          ),
        ));
  }
}
