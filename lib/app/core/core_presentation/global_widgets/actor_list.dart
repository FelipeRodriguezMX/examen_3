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


// return ListView.builder(
    //   itemCount: actorsProvider.actors!.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     final actor = actorsProvider.actors![index];
    //     return InkWell(
    //       onTap: () =>
    //           Navigator.pushNamed(context, '/actorMovie', arguments: actor),
    //       child: Card(
    //         elevation: 4,
    //         child: ListTile(
    //           title: Text(actor.name),
    //           subtitle: Text(actor.alias),
    //         ),
    //       ),
    //     );
    //   },
    // );