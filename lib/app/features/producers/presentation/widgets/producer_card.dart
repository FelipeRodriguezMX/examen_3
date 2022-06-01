import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:flutter/material.dart';

class ProducerCard extends StatelessWidget {
  const ProducerCard({Key? key, required this.producer}) : super(key: key);
  final Producer producer;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, '/producerMovie', arguments: producer),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
              width: 120,
              child: Image(
                image: NetworkImage(
                    'https://static.thenounproject.com/png/908418-200.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Text(
                producer.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
