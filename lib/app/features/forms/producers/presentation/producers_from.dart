import 'package:examen_3/app/core/core_datasource/models/models.dart';
import 'package:examen_3/app/core/core_presentation/global_states/producer_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProducerForm extends StatelessWidget {
  ProducerForm({Key? key}) : super(key: key);

  final TextEditingController producerController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void create(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    final producer = ProducerModel(
      name: producerController.text,
      id: null,
    );
    Provider.of<ProducerProvider>(context, listen: false).create(producer);
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
            controller: producerController,
            hintText: 'Productor',
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
