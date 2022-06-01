import 'package:examen_3/app/core/core_presentation/global_states/producer_provider.dart';
import 'package:examen_3/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:examen_3/app/features/producers/presentation/widgets/producer_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProducersPage extends StatefulWidget {
  const ProducersPage({Key? key}) : super(key: key);

  @override
  State<ProducersPage> createState() => _ProducersPageState();
}

class _ProducersPageState extends State<ProducersPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProducerProvider>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SimplePage(
        child: body(context),
        appBar: AppBar(
          title: const Text('Productoras'),
          elevation: 3,
          automaticallyImplyLeading: false,
        ),
        bottomAppBar: const BottomAppBar(
          elevation: 3,
          color: Colors.blue,
          child: CustomBottomAppBar(),
        ),
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

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: producerProvider.producers!.length,
      itemBuilder: (BuildContext context, int index) =>
          ProducerCard(producer: producerProvider.producers![index]),
    );
  }
}
