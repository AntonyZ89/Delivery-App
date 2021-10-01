import 'package:flutter/material.dart';
import 'package:first_application/components/components.dart';
import 'package:first_application/models/models.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)?.settings.arguments as OrderModel;

    final viewPadding = MediaQuery.of(context).viewPadding;

    return Scaffold(
      appBar: AppBarDefault(
        onBack: () {
          Navigator.of(context).pushNamed('order_list');
        },
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.yellow[600],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(Icons.gps_fixed, size: 20),
              ),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        margin: EdgeInsets.only(
          bottom: viewPadding.bottom,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const _Map(),
                OrderDetailStep(item.status),
                const OrderDetailHistoric(children: [
                  OrderDetailHistoricItem(
                    icon: Icons.watch_later,
                    title: 'Estimated time',
                    subtitle: '25 minutes',
                  ),
                  OrderDetailHistoricItem(
                    icon: Icons.place,
                    title: 'Your location',
                    subtitle:
                        'Deserunt aliqua non occaecat ea. Ipsum nulla consectetur ut minim mollit ullamco. Laboris consectetur fugiat officia duis exercitation nisi excepteur magna occaecat ex velit aliqua anim elit.',
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Map extends StatelessWidget {
  const _Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          'assets/images/map.png',
          height: 400,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
