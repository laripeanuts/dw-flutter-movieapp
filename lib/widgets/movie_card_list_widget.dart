import 'package:flutter/material.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/pages/movie_details.dart';
import 'package:movieapp/utils/api.utils.dart';

class MovieCardListWidget extends StatelessWidget {
  final Movie movie;

  const MovieCardListWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(18)),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MovieDetailsPage(movie: movie),
                fullscreenDialog: true,
              ),
            );
          },
          child: Container(
            height: 160,
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(API.REQUEST_IMG(movie.posterPath)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.titleLarge,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          movie.releaseDate,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.people),
                            const SizedBox(width: 5),
                            Text(
                              movie.popularity.toString(),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.star),
                            const SizedBox(width: 5),
                            Text(
                              movie.voteAverage.toString(),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
