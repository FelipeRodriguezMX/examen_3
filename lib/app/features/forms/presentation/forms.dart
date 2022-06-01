import 'dart:developer';

import 'package:examen_3/app/core/core_datasource/models/models.dart';
import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:examen_3/app/core/core_presentation/global_states/actor_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_states/movie_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_states/producer_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part './actors/presentation/actors.dart';
part './actors/presentation/actors_from.dart';
part './movies/presentation/movie_from.dart';
part './movies/presentation/movies.dart';
part './producers/presentation/producers.dart';
part './producers/presentation/producers_from.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: body(context),
      appBar: AppBar(
        title: const Text('Forms'),
        elevation: 3,
      ),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(
            title: 'Películas',
            onPressed: () =>
                Navigator.of(context).pushNamed('/formsListMovies')),
        CustomElevatedButton(
            title: 'Actores',
            onPressed: () =>
                Navigator.of(context).pushNamed('/formsListActors')),
        CustomElevatedButton(
            title: 'Productoras',
            onPressed: () =>
                Navigator.of(context).pushNamed('/formsListProducers')),
      ],
    );
  }
}
