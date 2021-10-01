import 'package:first_application/models/models.dart';
import 'package:first_application/models/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailStep extends StatelessWidget {
  final int status;

  const OrderDetailStep(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        children: [
          _Icons(status),
          _Labels(status),
        ],
      ),
    );
  }
}

class _Icons extends StatelessWidget {
  final int status;

  const _Icons(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Step(
          activated: status == OrderModel.statusWaiting,
          icon: Icons.pending_actions,
        ),
        _Divider(activated: status <= OrderModel.statusWaiting),
        _Step(
          activated: status == OrderModel.statusAccept,
          icon: Icons.hourglass_top_sharp,
        ),
        _Divider(activated: status <= OrderModel.statusAccept),
        _Step(
          activated: status == OrderModel.statusDelivery,
          icon: Icons.map,
        ),
        _Divider(activated: status <= OrderModel.statusDelivery),
        _Step(
          activated: status == OrderModel.statusFinished,
          icon: Icons.inventory,
        )
      ],
    );
  }
}

class _Labels extends StatelessWidget {
  final int status;

  const _Labels(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'On Order',
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: status == OrderModel.statusWaiting
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        Expanded(flex: 2, child: Container()),
        Text(
          'Process',
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: status == OrderModel.statusAccept
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        Expanded(flex: 2, child: Container()),
        Text(
          'Delivery',
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: status == OrderModel.statusDelivery
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        Expanded(flex: 2, child: Container()),
        Text(
          'Received',
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: status == OrderModel.statusFinished
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class _Step extends StatelessWidget {
  final bool activated;
  final IconData icon;

  const _Step({
    Key? key,
    required this.activated,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: activated ? Colors.yellow[600] : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: activated ? Colors.transparent : Colors.black.withOpacity(0.7),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 40,
          color: Colors.black.withOpacity(0.7),
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  final bool activated;

  const _Divider({Key? key, required this.activated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        color: activated ? Colors.yellow[600] : Colors.grey[300],
      ),
    );
  }
}
