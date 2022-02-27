import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MorseCodeMain(),
  ));
}

class MorseCodeMain extends StatefulWidget {
  const MorseCodeMain({Key? key}) : super(key: key);

  @override
  _MorseCodeMainState createState() => _MorseCodeMainState();
}

class _MorseCodeMainState extends State<MorseCodeMain> {

  String Morse = ". . . _ _ _ . . . __ . . . . ..";
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MorseCode TCC'),
        backgroundColor: Color(0xff654ea3),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xff654ea3),
                Color(0xffeaafc8),
              ],
            )
        ),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text(Morse,
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 60
            ),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child:  TextField(
                  controller: textController,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      color: Color(0xff654ea3)
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: (){
                        setState(() {
                          Morse = textController.text; // the text from controller must be passed to a morse parser function and then to a flash function
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
