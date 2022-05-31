import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:examen_3/app/core/core_presentation/global_states/movie_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActorMovies extends StatefulWidget {
  const ActorMovies({Key? key, required this.actor}) : super(key: key);
  final Actor actor;

  @override
  State<ActorMovies> createState() => _ActorMoviesState();
}

class _ActorMoviesState extends State<ActorMovies> {
  @override
  void initState() {
    context.read<MovieProvider>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
        appBar: AppBar(
          title: Text(widget.actor.name),
        ),
        child: body(context));
  }

  Widget body(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: true);
    if (movieProvider.isEmpty() && movieProvider.isLoading == true) {
      movieProvider.getMoviesByActor(widget.actor.id!);
      return const Center(child: CircularProgressIndicator());
    }
    if (movieProvider.failure == true && movieProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (movieProvider.failure == true && movieProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (movieProvider.movies!.isEmpty && movieProvider.isLoading == false) {
      return const Center(child: Text('No hay actores'));
    }
    return MovieList(movies: movieProvider.movies!);
  }
}
