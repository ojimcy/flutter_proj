import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_proj/util/hexcolor.dart';

class Billing extends StatefulWidget {
  @override
  _BillingState createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  Color _purple = HexColor("6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 120.0),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.2), //Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Per Person",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: _purple)),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "\$123",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 39.5,
                            color: _purple),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.grey.shade100, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        prefixText: "Bill Amount ",
                        prefixIcon: Icon(Icons.money_off)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                }
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purple.withOpacity(0.1)),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: _purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                                color: _purple,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: _purple.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                      color: _purple),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  //Tip row

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("\$54",
                            style: TextStyle(
                                fontSize: 17.0,
                                color: _purple,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),

                  //Slider

                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage %",
                          style: TextStyle(
                              color: _purple,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold)),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: _purple,
                          inactiveColor: Colors.grey,
                          
                          value: _tipPercentage.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _tipPercentage = value.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class Wisdom extends StatefulWidget {
//   @override
//   _WisdomState createState() => _WisdomState();
// }

// class _WisdomState extends State<Wisdom> {
//   int _index = 0;

//   List quotes = [
//     "I love you the more in that I believe you had liked me for my own sake and for nothing else.",
//     "The most difficult thing is the decision to act, the rest is merely tenacity. The fears are paper tigers.",
//     "If you cannot do great things, do small things in a great way. Napoleon Hill. ",
//     "Happiness can exist only in acceptance."
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Expanded(
//             child: Center(
//               child: Container(
//                   width: 350,
//                   height: 250,
//                   margin: EdgeInsets.all(30.0),
//                   decoration: BoxDecoration(
//                       color: Colors.greenAccent,
//                       borderRadius: BorderRadius.circular(15.0)),
//                   child: Text(quotes[_index % quotes.length])),
//             ),
//           ),
//           Divider(
//             thickness: 2.5,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 18.0),
//             child: FlatButton.icon(
//               onPressed: _showQuote,
//               icon: Icon(Icons.info),
//               label: Text(
//                 "Get Quote",
//                 style: TextStyle(fontSize: 14, color: Colors.white),
//               ),
//               color: Colors.greenAccent.shade400,
//             ),
//           ),
//           Spacer()
//         ],
//       )),
//     );
//   }

//   void _showQuote() {
//     setState(() {
//       _index += 1;
//     });
//   }
// }

// class BizCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BizCard"),
//       ),
//       backgroundColor: Colors.amberAccent.shade700,
//       body: Container(
//         alignment: Alignment.center,
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: <Widget>[_getCard(), _getAvatar()],
//         ),
//       ),
//     );
//   }

//   Container _getCard() {
//     return Container(
//       width: 350,
//       height: 100,
//       margin: EdgeInsets.all(50),
//       decoration: BoxDecoration(
//         color: Colors.pinkAccent,
//         borderRadius: BorderRadius.circular(14.5),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             "Emmanuel",
//             style: TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
//           ),
//           Text("OjimaOjotule 2024"),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//             Icon(Icons.person_outline),
//             Text("Twitter: @ojimcy247")
//           ])
//         ],
//       ),
//     );
//   }

//   Container _getAvatar() {
//     return Container(
//       width: 100,
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(50.0)),
//         border: Border.all(color: Colors.redAccent, width: 1.2),
//         image: DecorationImage(
//             image: NetworkImage("https://picsum.photos/300/300")),
//       ),
//     );
//   }
// }

// class Scaffolding extends StatelessWidget {
//   _logo() {
//     debugPrint("Logo Clicked!");
//   }

//   _emailButton() {
//     debugPrint("Email Pressed!");
//   }

//   // _doubleTapped() {
//   //   debugPrint("double tapped....");
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("MuzShare"),
//         backgroundColor: Colors.blueAccent.shade700,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.music_note),
//             onPressed: _logo,
//           ),
//           IconButton(
//             icon: Icon(Icons.alternate_email),
//             onPressed: _emailButton,
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.greenAccent,
//         child: Icon(Icons.call),
//         onPressed: null,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle), title: Text("Account")),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.ac_unit), title: Text("Unit")),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.verified_user), title: Text("User")),
//         ],
//         onTap: (int i) => debugPrint("Item $i tapped.."),
//       ),
//       backgroundColor: Colors.redAccent.shade100,
//       body: Container(
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               CustomButton()
//               // InkWell(
//               //   child: Container(
//               //     child: Text(
//               //       "Tap me",
//               //       style: TextStyle(fontSize: 24),
//               //     ),
//               //   ),
//               //   onTap: () => debugPrint("taped...."),
//               //   onDoubleTap: _doubleTapped,
//               // )
//             ],
//           )),
//     );
//   }
// }

// class CustomButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         final snackBar = SnackBar(
//             content: Text("Helo Again"),
//             backgroundColor: Colors.blueAccent.shade700);
//         Scaffold.of(context).showSnackBar(snackBar);
//       },
//       child: Container(
//         padding: EdgeInsets.all(10.0),
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
//         child: Text("Button"),
//       ),
//     );
//   }
// }

// class ScafoldExample extends StatelessWidget {
//   _error() {
//     debugPrint("Error Occured!");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("muzShare"),
//         centerTitle: true,
//         backgroundColor: Colors.amberAccent.shade400,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.email),
//             onPressed: () => debugPrint("email Pressed"),
//           ),
//           IconButton(
//             icon: Icon(Icons.error),
//             onPressed: _error,
//           )
//         ],
//       ),
//       body: Center(child: Text("Here again")),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.deepOrange,
//       child: Center(
//         child: Text(
//           "Hello Home",
//           textDirection: TextDirection.ltr,
//           style: TextStyle (
//             fontWeight: FontWeight.w600,
//             fontSize: 40,
//             fontStyle: FontStyle.italic,

//           ),
//         ),
//       ),
//     );
//   }
// }
