import 'package:first_application/components/components.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
          leading: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black.withOpacity(0.7),
                elevation: 0,
                padding: const EdgeInsets.all(5),
                minimumSize: const Size(0, 0),
                alignment: Alignment.center,
              ),
            ),
          ),
          foregroundColor: Colors.black87,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const CheckoutCustomer(),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Note..',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[300],
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const CheckoutInformation(),
                    const CheckoutMethod(),
                  ],
                ),
              ),
              const CheckoutFooter()
            ],
          ),
        ));
  }
}
