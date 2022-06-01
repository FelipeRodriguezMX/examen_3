import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:examen_3/app/core/core_presentation/global_states/actor_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:examen_3/app/features/movie/presentation/widgets/movie_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    super.initState();
    context.read<ActorProvider>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(child: body(context));
  }

  Widget body(BuildContext context) {
    final actorsProvider = Provider.of<ActorProvider>(context, listen: true);
    if (actorsProvider.isEmpty() && actorsProvider.isLoading == true) {
      actorsProvider.getActorsByMovie(widget.movie.id!);
      return const Center(child: CircularProgressIndicator());
    }
    if (actorsProvider.failure == true && actorsProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (actorsProvider.failure == true && actorsProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (actorsProvider.actors!.isEmpty && actorsProvider.isLoading == false) {
      return const Center(child: Text('No hay actores'));
    }
    return MovieContent(movie: widget.movie, actors: actorsProvider.actors!);
  }
}
