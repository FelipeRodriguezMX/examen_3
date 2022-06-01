part of '../../forms.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieProvider>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: body(context),
      appBar: AppBar(
        title: const Text('Películas'),
        elevation: 3,
      ),
      bottomAppBar: const BottomAppBar(
        elevation: 3,
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: BlankBottomAppBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/formMovie'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget body(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    if (movieProvider.isEmpty() && movieProvider.isLoading == true) {
      movieProvider.getMovies();
      return const Center(child: CircularProgressIndicator());
    }
    if (movieProvider.failure == true && movieProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (movieProvider.failure == true && movieProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (movieProvider.isEmpty() && movieProvider.isLoading == false) {
      return const Center(child: Text('No hay películas'));
    }

    return ListView.builder(
      itemCount: movieProvider.movies!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: InkWell(
            // onTap: () => Navigator.pushNamed(
            //   context,
            //   '/formActor',
            //   arguments: movieProvider.producers![index],
            // ),
            onTap: null,
            child: ListTile(
              title: Text(movieProvider.movies![index].name),
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
