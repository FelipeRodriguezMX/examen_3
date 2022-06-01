part of '../../forms.dart';

class MovieForm extends StatefulWidget {
  const MovieForm({Key? key, this.movie}) : super(key: key);
  final Movie? movie;

  @override
  State<MovieForm> createState() => _MovieFormState();
}

class _MovieFormState extends State<MovieForm> {
  @override
  void initState() {
    super.initState();
    context.read<MovieProvider>().clear();
    context.read<ProducerProvider>().clear();
    context.read<ActorProvider>().clear();
  }

  final TextEditingController tituloController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int value = 1;
  Future<void> create() async {
    if (!_formKey.currentState!.validate()) return;
    final movie = MovieModel(
      name: tituloController.text,
      description: descriptionController.text,
      id: null,
      producer: null,
      producer_id: value,
      actors: Provider.of<MovieProvider>(context, listen: false).selectedActors,
    );
    final result = await Provider.of<MovieProvider>(context, listen: false)
        .create(movie, context);
    if (result != null) {
      log(result);
    }
    tituloController.clear();
    descriptionController.clear();
    value = 1;
    Provider.of<MovieProvider>(context, listen: false).selectedActors = [];
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: true);
    final producers = Provider.of<ProducerProvider>(context)..getProducers();
    if (producers.isEmpty() && producers.isLoading == true) {
      return const Center(child: CircularProgressIndicator());
    }

    return SimplePage(
      appBar: AppBar(
        title:
            Text(widget.movie == null ? 'Nueva película' : 'Editar película'),
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
                controller: tituloController,
                hintText: 'Titulo',
                validator: (String value) =>
                    (value.isEmpty) ? 'Campo vació' : null,
              ),
              InputWithValidation(
                controller: descriptionController,
                hintText: 'Descripción',
                maxLines: null,
                validator: (String value) =>
                    (value.isEmpty) ? 'Campo vació' : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: DropdownButtonFormField(
                  value: value,
                  items: producers.producers!
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                  onChanged: (int? _value) {
                    setState(() {
                      value = _value!;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const Text('Actores'),
              Column(
                children: List.generate(
                    movieProvider.selectedActors.length,
                    (index) => ListTile(
                          title: Text(movieProvider.selectedActors[index].name),
                          subtitle:
                              Text(movieProvider.selectedActors[index].alias),
                        )),
              ),
              CustomIconButton(
                icon: Icons.add,
                onPress: () => _showModal(),
                backgroundColor: Colors.black,
              ),
              const Spacer(),
              CustomElevatedButton(title: 'Crear', onPressed: () => create())
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showModal() async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ModalActors();
        });
  }
}

class ModalActors extends StatelessWidget {
  const ModalActors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

    final actorsProvider = Provider.of<ActorProvider>(context, listen: true)
      ..getActors();

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
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('Selecciona un actores', style: TextStyle(fontSize: 20)),
          ListView.builder(
            itemCount: actorsProvider.actors!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: InkWell(
                  onTap: () {
                    movieProvider.addActor(actorsProvider.actors![index]);
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    title: Text(actorsProvider.actors![index].name),
                    subtitle: Text(actorsProvider.actors![index].alias),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
