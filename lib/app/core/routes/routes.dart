import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:examen_3/app/features/actors/actors.dart';
import 'package:examen_3/app/features/movie/presentation/movie_page.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/home.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(builder: (context) => const Home());
      case '/movie':
        if (args is Movie) {
          return MaterialPageRoute<dynamic>(
            builder: (context) => MoviePage(movie: args),
          );
        }
        break;
      case '/actors':
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ActorsPage(),
        );
      case '/actorMovie':
        if (args is Actor) {
          return MaterialPageRoute<dynamic>(
            builder: (context) => ActorMovies(actor: args),
          );
        }
        break;
      default:
        return _errorRoute();
    }
    return null;
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ERROR'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('Pagina no encontrada'),
          ),
        );
      },
    );
  }
}
