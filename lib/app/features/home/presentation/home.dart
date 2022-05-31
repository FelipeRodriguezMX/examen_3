import 'package:examen_3/app/core/core_presentation/global_states/movie_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_widgets/global_widgets.dart';
// import 'package:examen_3/app/core/sql_lite/fill_data.dart';
import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // FillData fillData = GetIt.instance();
    // fillData.insertActors();
    // fillData.insertProducers();
    // fillData.insertMovies();
    // fillData.insertMovieActor();
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: body(context),
      appBar: AppBar(
        title: const Text('Películas'),
        automaticallyImplyLeading: false,
        elevation: 3,
      ),
      bottomAppBar: const BottomAppBar(
        elevation: 3,
        color: Colors.blue,
        child: CustomBottomAppBar(),
      ),
    );
  }

  Widget body(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: true);
    if (movieProvider.isEmpty() && movieProvider.isLoading == true) {
      movieProvider.getMovies();
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
