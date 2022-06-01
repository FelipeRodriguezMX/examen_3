part of '../../forms.dart';

class ProducersForm extends StatelessWidget {
  ProducersForm({Key? key, this.producer}) : super(key: key);
  final Producer? producer;

  final TextEditingController producerController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void create(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    final producer = ProducerModel(
      name: producerController.text,
      id: null,
    );
    Provider.of<ProducerProvider>(context, listen: false)
        .create(producer, context);
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      appBar: AppBar(
        title: Text(producer == null ? 'Nuevo productor' : 'Editar productor'),
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
