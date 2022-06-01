import 'package:examen_3/app/core/core_datasource/models/models.dart';
import 'package:examen_3/app/core/core_presentation/global_states/actor_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActorsForm extends StatelessWidget {
  ActorsForm({Key? key}) : super(key: key);

  final TextEditingController actorController = TextEditingController();
  final TextEditingController aliasController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void create(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    final actor = ActorModel(
      name: actorController.text,
      id: null,
      alias: aliasController.text,
    );
    Provider.of<ActorProvider>(context, listen: false).create(actor);
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: body(context),
      appBar: AppBar(
        title: const Text('Agregar Actores'),
        elevation: 3,
      ),
    );
  }

  Widget body(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputWithValidation(
            controller: actorController,
            hintText: 'Actor',
            maxLines: 1,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'El campo esta vació';
              }
              return null;
            },
          ),
          InputWithValidation(
            controller: aliasController,
            hintText: 'Alias',
            maxLines: 1,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'El campo esta vació';
              }
              return null;
            },
          ),
          Container(
            child: CustomElevatedButton(
                title: 'Crear', onPressed: () => create(context)),
          )
        ],
      ),
    );
  }
}
