part of '../../forms.dart';

class ActorsListPage extends StatefulWidget {
  const ActorsListPage({Key? key}) : super(key: key);

  @override
  State<ActorsListPage> createState() => _ActorsListPageState();
}

class _ActorsListPageState extends State<ActorsListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ActorProvider>(context, listen: false).clear();
  }

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
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: BlankBottomAppBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/formActor'),
        child: const Icon(Icons.add),
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
    return ListView.builder(
      itemCount: actorsProvider.actors!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: InkWell(
            onTap: null,
            child: ListTile(
              title: Text(actorsProvider.actors![index].name),
              subtitle: Text(actorsProvider.actors![index].alias),
            ),
          ),
        );
      },
    );
  }
}
