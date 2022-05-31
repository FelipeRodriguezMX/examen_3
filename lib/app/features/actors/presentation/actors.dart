import 'package:examen_3/app/core/core_presentation/global_states/actor_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActorsPage extends StatelessWidget {
  const ActorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: body(context),
      appBar: AppBar(
        title: const Text('Actores'),
        elevation: 3,
        automaticallyImplyLeading: false,
      ),
      bottomAppBar: const BottomAppBar(
        elevation: 3,
        color: Colors.blue,
        child: CustomBottomAppBar(),
      ),
    );
  }

  Widget body(BuildContext context) {
    final actorsProvider = Provider.of<ActorProvider>(context);
    if (actorsProvider.isEmpty() && actorsProvider.isLoading == true) {
      actorsProvider.getActors();
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
    return ActorList(actors: actorsProvider.actors!);
  }
}
