import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CartLocationCard extends StatelessWidget {
  const CartLocationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[600],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  children: const [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Your location',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Voluptate labore est anim dolor dolore in. Occaecat velit dolore id voluptate eu est minim mollit magna ex cillum sunt esse labore. Laboris non est enim velit id commodo officia culpa voluptate dolor. In adipisicing veniam laborum nisi nisi esse sit ut ea nulla commodo minim.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Icon(
                  Icons.edit,
                  color: Colors.black87,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[100],
                  shape: const CircleBorder(),
                  fixedSize: const Size(50, 50),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
