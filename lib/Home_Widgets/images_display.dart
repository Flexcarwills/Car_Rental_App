import 'package:flutter/widgets.dart';

class ImageDisplays extends StatelessWidget {
  const ImageDisplays({super.key, required this.images});

  final List images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (ctx, index) {
            return Image.network(
              images[index],
            );
          }),
    );
  }
}
