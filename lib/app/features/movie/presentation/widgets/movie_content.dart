import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:examen_3/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class MovieContent extends StatelessWidget {
  const MovieContent({Key? key, required this.movie, required this.actors})
      : super(key: key);
  final Movie movie;
  final List<Actor> actors;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 240,
            child: Image(
              image: NetworkImage(
                  'https://static.thenounproject.com/png/908418-200.png'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: Text(
                  movie.name,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  movie.description,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: const Text(
                  'Actors',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              ActorList(actors: actors)
            ],
          )
        ],
      ),
    );
  }
}
