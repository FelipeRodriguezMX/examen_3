import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/movie', arguments: movie);
        },
        child: Column(
          children: [
            const SizedBox(
              height: 120,
              width: 120,
              child: Image(
                image: NetworkImage(
                    'https://static.thenounproject.com/png/908418-200.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Text(
                movie.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
