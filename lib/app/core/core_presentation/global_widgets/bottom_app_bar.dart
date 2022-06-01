part of './global_widgets.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.local_movies),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('/'),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('/actors'),
          ),
          IconButton(
            icon: const Icon(Icons.movie),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('/producer'),
          ),
        ],
      ),
    );
  }
}
