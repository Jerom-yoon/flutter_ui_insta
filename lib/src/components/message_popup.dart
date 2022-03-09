import 'package:flutter/material.dart';

class MessagePopup extends StatelessWidget {
  final String title;
  final String message;
  final Function()? okCallback;
  final Function()? cancelCallback;

  const MessagePopup({
    Key? key,
    required this.title,
    required this.message,
    required this.okCallback,
    this.cancelCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: okCallback,
                          child: Text('OK')),
                      SizedBox(width: 10),
                      ElevatedButton(onPressed: cancelCallback,
                          child: Text('Cancell'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                        ),),

                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
