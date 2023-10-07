import 'package:flutter/material.dart';
import 'package:movieapp/layout/background_layout.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/utils/api.utils.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  // implement widget for gap
  Widget _gap() {
    return const SizedBox(width: 6);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundLayout(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown, // Redimensiona o texto para caber
          child: Text(movie.title),
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  API.REQUEST_IMG(movie.posterPath),
                  fit: BoxFit.cover,
                  loadingBuilder: (_, image, progress) {
                    if (progress == null) {
                      return image;
                    } else {
                      return Container(
                        alignment: Alignment.center,
                        transformAlignment: Alignment.center,
                        color: const Color.fromARGB(255, 89, 96, 100),
                        width: 100,
                        child: const CircularProgressIndicator.adaptive(),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              movie.overview,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.date_range, color: Colors.blue),
                    _gap(),
                    Text(
                      movie.releaseDate,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    _gap(),
                    Text(
                      movie.voteAverage.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    _gap(),
                    const Icon(Icons.people, color: Colors.blue),
                    _gap(),
                    Text(
                      movie.popularity.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
