import 'package:flutter/material.dart';
import 'package:knowphones/models/details.dart';

class DetailItem extends StatelessWidget {
  final Specs specs;

  const DetailItem({Key? key, required this.specs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: Text(
              specs.title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: specs.spec.length,
              itemBuilder: (context, index) {
                final Spec spec = specs.spec[index];
                return ListTile(
                  dense: true,
                  title: SizedBox(
                    width: double.infinity,
                    child: Text(
                      spec.key,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  trailing: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Text(
                      spec.val.join('\n'),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
