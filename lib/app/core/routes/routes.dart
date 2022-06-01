import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:examen_3/app/features/actors/actors.dart';
import 'package:examen_3/app/features/forms/forms.dart';
import 'package:examen_3/app/features/movie/presentation/movie_page.dart';
import 'package:examen_3/app/features/producers/producers.dart';
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
      case '/producer':
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProducersPage(),
        );
      case '/producerMovie':
        if (args is Producer) {
          return MaterialPageRoute<dynamic>(
            builder: (context) => ProducerMovies(producer: args),
          );
        }
        break;
      case '/forms':
        return MaterialPageRoute<dynamic>(
          builder: (context) => const FormsPage(),
        );
      case '/formsListActors':
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ActorsListPage(),
        );
      case '/formActor':
        if (args is Actor) {
          return MaterialPageRoute<dynamic>(
            builder: (context) => ActorsForm(actor: args),
          );
        }
        return MaterialPageRoute<dynamic>(
          builder: (context) => ActorsForm(),
        );
      case '/formsListProducers':
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProducersListPage(),
        );
      case '/formProducer':
        if (args is Producer) {
          return MaterialPageRoute<dynamic>(
            builder: (context) => ProducersForm(producer: args),
          );
        }
        return MaterialPageRoute<dynamic>(
          builder: (context) => ProducersForm(),
        );
      case '/formsListMovies':
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MovieListPage(),
        );
      case '/formMovie':
        if (args is Movie) {
          return MaterialPageRoute<dynamic>(
            builder: (context) => MovieForm(movie: args),
          );
        }
        return MaterialPageRoute<dynamic>(
          builder: (context) => MovieForm(),
        );
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
