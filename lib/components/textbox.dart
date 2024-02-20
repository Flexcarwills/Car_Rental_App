import 'package:flutter/material.dart';

class mytextbox extends StatelessWidget {
  final String text;
  final String sectionname;
  final void Function()? onpressed;
  const mytextbox(
      {super.key,
      required this.text,
      required this.sectionname,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionname,
                style: TextStyle(color: Colors.grey[400]),
              ),
              IconButton(
                  onPressed: onpressed,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.grey[400],
                  ))
            ],
          ),
          Text(
            text,
            style: TextStyle(color: Colors.grey[500]),
          )
        ],
      ),
    );
  }
}
