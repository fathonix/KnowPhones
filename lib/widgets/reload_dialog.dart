import 'package:flutter/material.dart';

class ReloadDialog extends StatelessWidget {
  final String desc;
  final void Function() callback;

  const ReloadDialog(
      {Key? key, this.desc = 'An error occurred.', required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(desc),
          MaterialButton(
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            onPressed: callback,
          )
        ],
      ),
    );
  }
}
