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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            desc,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 10.0),
          MaterialButton(
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            onPressed: callback,
            child: Text(
              'Try again',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
