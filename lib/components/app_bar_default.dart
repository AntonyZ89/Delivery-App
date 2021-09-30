import 'package:flutter/material.dart';

class AppBarDefault extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  final VoidCallback? onBack;
  final List<Widget>? actions;

  const AppBarDefault({Key? key, this.title, this.onBack, this.actions})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _AppBarDefaultState createState() => _AppBarDefaultState();
}

class _AppBarDefaultState extends State<AppBarDefault> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title,
      leading: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            if (widget.onBack != null) {
              widget.onBack!();
            } else {
              Navigator.of(context).pop();
            }
          },
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
      actions: widget.actions,
      foregroundColor: Colors.black87,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
