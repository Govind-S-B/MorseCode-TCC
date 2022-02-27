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

  String Morse = "";
  TextEditingController textController = TextEditingController();

  Map<String, String> MorseMap = { 'A':'. - ', 'B':'- . . . ',
    'C':'- . - . ', 'D':'- . . ', 'E':'. ',
    'F':'. . - . ', 'G':'- - . ', 'H':'. . . . ',
    'I':'. . ', 'J':'. - - - ', 'K':'- . - ',
    'L':'. - . . ', 'M':'- - ', 'N':'- . ',
    'O':'- - - ', 'P':'. - - . ', 'Q':'- - . - ',
    'R':'. - . ', 'S':'. . . ', 'T':'- ',
    'U':'. . - ', 'V':'. . . - ', 'W':'. - - ',
    'X':'- . . - ', 'Y':'- . - - ', 'Z':'- - . . ',
    '1':'. - - - - ', '2':'. . - - - ', '3':'. . . - - ',
    '4':'. . . . - ', '5':'. . . . . ', '6':'- . . . . ',
    '7':'- - . . . ', '8':'- - - . . ', '9':'- - - - . ',
    '0':'- - - - - ', ', ':'- - . . - - ', '.':'. - . - . - ',
    '?':'. . - - . . ', '/':'- . . - . ', '-':'- . . . . - ',
    '(':'- . - - . ', ')':'- . - - . - '," ":"       "};

  String morse_parser(String text_to_convert){
    String morse = "";
    for (var x = 0; x < text_to_convert.length ;++x){
      print(text_to_convert[x]);
      morse += MorseMap[text_to_convert[x]]!;
      morse += "   ";
    }
    return morse;
  }

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(Morse,
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40
              ),),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child:  TextField(
                  controller: textController,
                  onSubmitted: (value){
                    setState(() {
                      Morse = morse_parser(value.toUpperCase()); // the text from controller must be passed to a morse parser function and then to a flash function
                    });
                  },
                  cursorColor: Colors.black,
                  style: TextStyle(
                      color: Color(0xff654ea3)
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: (){
                        setState(() {
                          Morse = morse_parser(textController.text.toUpperCase()); // the text from controller must be passed to a morse parser function and then to a flash function
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
