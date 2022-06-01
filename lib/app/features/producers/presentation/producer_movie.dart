import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:examen_3/app/core/core_presentation/global_states/movie_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProducerMovies extends StatefulWidget {
  const ProducerMovies({Key? key, required this.producer}) : super(key: key);
  final Producer producer;

  @override
  State<ProducerMovies> createState() => _ProducerMoviesState();
}

class _ProducerMoviesState extends State<ProducerMovies> {
  @override
  void initState() {
    super.initState();
    context.read<MovieProvider>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      appBar: AppBar(
        title: Text(widget.producer.name),
      ),
      child: body(context),
    );
  }

  Widget body(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: true);
    if (movieProvider.isEmpty() && movieProvider.isLoading == true) {
      movieProvider.getMoviesByActor(widget.producer.id!);
      return const Center(child: CircularProgressIndicator());
    }
    if (movieProvider.failure == true && movieProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (movieProvider.failure == true && movieProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (movieProvider.movies!.isEmpty && movieProvider.isLoading == false) {
      return const Center(child: Text('No hay películas'));
    }
    return MovieList(movies: movieProvider.movies!);
  }
}
