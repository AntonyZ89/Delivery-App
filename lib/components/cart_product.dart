import 'package:first_application/components/components.dart';
import 'package:first_application/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final ProductModel item;
  final Animation<double> animation;

  const CartProduct({Key? key, required this.item, required this.animation})
      : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    CartModel provider = Provider.of<CartModel>(context, listen: false);

    return FadeTransition(
      opacity: widget.animation,
      child: SizeTransition(
        sizeFactor: widget.animation,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Slidable(
            key: Key(widget.item.id),
            actionPane: const SlidableDrawerActionPane(),
            actionExtentRatio: 0.2,
            secondaryActions: [
              IconSlideAction(
                color: Colors.transparent,
                iconWidget: ElevatedButton(
                  onPressed: () {
                    int index = provider.items.indexOf(widget.item);
                    AnimatedList.of(context).removeItem(
                      index,
                      (context, animation) => CartProduct(
                        item: widget.item,
                        animation: animation,
                      ),
                    );
                    provider.remove(widget.item.id);
                  },
                  child: const Icon(Icons.delete),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: const EdgeInsets.all(5),
                    minimumSize: const Size(0, 0),
                  ),
                ),
              ),
            ],
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.item.image,
                    width: 100,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.item.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                CartProductQuantity(item: widget.item),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
