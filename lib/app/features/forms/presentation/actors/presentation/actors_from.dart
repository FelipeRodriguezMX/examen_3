part of '../../forms.dart';

class ActorsForm extends StatelessWidget {
  ActorsForm({Key? key, this.actor}) : super(key: key);
  final Actor? actor;

  final TextEditingController actorController = TextEditingController();
  final TextEditingController aliasController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> create(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    final actor = ActorModel(
      name: actorController.text,
      id: null,
      alias: aliasController.text,
    );
    final result = await Provider.of<ActorProvider>(context, listen: false)
        .create(actor, context);
    if (result != null) {
      log(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      appBar: AppBar(
        title: Text(actor == null ? 'Nuevo actor' : 'Editar actor'),
        elevation: 3,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 10,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputWithValidation(
                controller: actorController,
                hintText: 'Actor',
                validator: (String value) =>
                    (value.isEmpty) ? 'Campo vació' : null,
              ),
              InputWithValidation(
                controller: aliasController,
                hintText: 'Alias',
                validator: (String value) =>
                    (value.isEmpty) ? 'Campo vació' : null,
              ),
              const Spacer(),
              CustomElevatedButton(
                  title: 'Crear', onPressed: () => create(context))
            ],
          ),
        ),
      ),
    );
  }
}
