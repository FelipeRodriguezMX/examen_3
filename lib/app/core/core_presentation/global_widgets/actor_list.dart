part of './global_widgets.dart';

class ActorList extends StatelessWidget {
  const ActorList({
    Key? key,
    required this.actors,
    required this.route,
    this.physics = const NeverScrollableScrollPhysics(),
  }) : super(key: key);
  final List<Actor> actors;
  final String route;
  final ScrollPhysics physics;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: actors.length,
      shrinkWrap: true,
      physics: physics,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () =>
              Navigator.pushNamed(context, route, arguments: actors[index]),
          child: Card(
            elevation: 4,
            child: ListTile(
              title: Text(actors[index].name),
              subtitle: Text(actors[index].alias),
            ),
          ),
        );
      },
    );
  }
}
