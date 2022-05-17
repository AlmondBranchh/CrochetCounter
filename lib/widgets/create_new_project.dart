import 'package:flutter/material.dart';

class NewProjectWindow extends StatefulWidget {
  const NewProjectWindow({Key? key}) : super(key: key);

  @override
  State<NewProjectWindow> createState() => _NewProjectWindowState();
}

class _NewProjectWindowState extends State<NewProjectWindow> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
          width: 200,
          height: 200,
          child: Column(
            children: [
              TextField(

              )
            ],
          ),
        ),
    );
  }
}
