import 'package:flutter/material.dart';
import 'package:knowphones/models/details.dart';

class DetailItem extends StatelessWidget {
  final Specs specs;

  const DetailItem({Key? key, required this.specs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const vpadding = 8.0;
    const hpadding = vpadding * 2;

    final width = MediaQuery.of(context).size.width - (hpadding * 2);
    final valWidth = width / 1.7;
    final keyWidth = width - valWidth;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
              const EdgeInsets.symmetric(
                horizontal: hpadding,
                vertical: vpadding,
              ),
            child: Text(
              specs.title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.subtitle2,
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

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: hpadding,
                    vertical: vpadding,
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                      SizedBox(
                        width: keyWidth,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            spec.key,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: valWidth,
                        child: Text(
                          spec.val
                            .map((item) => item.trim())
                            .join('\n'),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
