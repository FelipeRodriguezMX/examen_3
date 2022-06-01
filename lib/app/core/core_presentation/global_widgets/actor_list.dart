part of './global_widgets.dart';

class ActorList extends StatelessWidget {
  const ActorList({Key? key, required this.actors}) : super(key: key);
  final List<Actor> actors;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: actors.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.pushNamed(context, '/actorMovie',
              arguments: actors[index]),
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
