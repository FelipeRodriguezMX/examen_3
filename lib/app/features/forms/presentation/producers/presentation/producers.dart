part of '../../forms.dart';

class ProducersListPage extends StatefulWidget {
  const ProducersListPage({Key? key}) : super(key: key);

  @override
  State<ProducersListPage> createState() => _ProducersListPageState();
}

class _ProducersListPageState extends State<ProducersListPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProducerProvider>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: body(context),
      appBar: AppBar(
        title: const Text('Productoras'),
        elevation: 3,
      ),
      bottomAppBar: const BottomAppBar(
        elevation: 3,
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: BlankBottomAppBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/formProducer'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget body(BuildContext context) {
    final producerProvider = Provider.of<ProducerProvider>(context);
    if (producerProvider.isEmpty() && producerProvider.isLoading == true) {
      producerProvider.getProducers();
      return const Center(child: CircularProgressIndicator());
    }
    if (producerProvider.failure == true &&
        producerProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (producerProvider.failure == true &&
        producerProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (producerProvider.producers!.isEmpty &&
        producerProvider.isLoading == false) {
      return const Center(child: Text('No hay productores'));
    }

    return ListView.builder(
      itemCount: producerProvider.producers!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: InkWell(
            // onTap: () => Navigator.pushNamed(
            //   context,
            //   '/formActor',
            //   arguments: producerProvider.producers![index],
            // ),
            onTap: null,
            child: ListTile(
              title: Text(producerProvider.producers![index].name),
              // trailing: Column(
              //   children: [
              //     CustomIconButton(
              //       icon: Icons.edit,
              //       onPress: () {},
              //       backgroundColor: Colors.black,
              //     ),
              //   ],
              // ),
            ),
          ),
        );
      },
    );
  }
}
