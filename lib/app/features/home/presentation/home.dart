import 'package:examen_3/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:examen_3/app/core/sql_lite/fill_data.dart';
import 'package:examen_3/app/features/home/presentation/providers/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
    FillData fillData = GetIt.instance();
    fillData.insertActors();
    fillData.insertProducers();
    fillData.insertMovies();
    fillData.insertMovieActor();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    if (movieProvider.isEmpty() && movieProvider.isLoading == true) {
      movieProvider.getMovies();
    }
    return SimplePage(
      child: Column(
        children: const [],
      ),
    );
  }
}
