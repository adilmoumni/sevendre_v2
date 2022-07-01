import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:popover/popover.dart';

class TableauDeBoard extends StatefulWidget {
  const TableauDeBoard({Key key}) : super(key: key);

  @override
  _TableauDeBoardState createState() => _TableauDeBoardState();
}

class _TableauDeBoardState extends State<TableauDeBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3a6259),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: SvgPicture.asset(
                      "../assets/images/Logo_Sevendre.svg",
                      height: 40,
                      color: Colors.white,
                    ),
                  ),
                  Center(child: Button()),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFfec469)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.teal, width: 2.0)))),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Ajouter un Tableau de bord',
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(Icons.add)
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/StepperScreen');
                },
              ),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
// Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 child: SvgPicture.asset(
//                   "../assets/images/Logo_Sevendre.svg",
//                   height: 40,
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       color: Color(0xFFfec469),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       Icons.person,
//                       color: Color(0xFF3b5c58),
//                       size: 30,
//                     )),
//               )
//             ],
//           ),
//         ),

class Button extends StatelessWidget {
  Button({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Color(0xFFfec469),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.person,
            color: Color(0xFF3b5c58),
            size: 30,
          )),
      onTap: () {
        showPopover(
          context: context,
          transitionDuration: const Duration(milliseconds: 150),
          bodyBuilder: (context) => const ListItems(),
          onPop: () => print('Popover was popped!'),
          direction: PopoverDirection.top,
          width: 200,
          height: 200,
          arrowHeight: 10,
          arrowWidth: 30,
        );
      },
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute<SecondRoute>(
                      builder: (context) => SecondRoute(),
                    ),
                  );
              },
              child: Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Mon compte')),
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[200],
              child: const Center(child: Text('Historique')),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
