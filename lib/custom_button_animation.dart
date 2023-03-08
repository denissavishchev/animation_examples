import 'package:flutter/material.dart';


class CustomButtonAnimation extends StatefulWidget {

  @override
  State<CustomButtonAnimation> createState() => _CustomButtonAnimationState();
}

class _CustomButtonAnimationState extends State<CustomButtonAnimation> {
  var isOpen = true;

  _toggleOpen() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.blue[100],
            child: Stack(
              children: [
                AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                width: isOpen ? 240 : 48,
                height: 48,
                decoration: const ShapeDecoration(
                  color: Colors.deepOrange,
                  shape: StadiumBorder(),
                ),),
                Container(
                  width: 40,
                  margin: const EdgeInsets.only(left: 4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 250),
                    firstChild: IconButton(
                      icon: const Icon(Icons.arrow_circle_right_outlined),
                      onPressed: (){
                        _toggleOpen();
                      },
                    ),
                    secondChild: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: (){
                        _toggleOpen();
                      },
                    ),
                    crossFadeState: !isOpen
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isOpen ? 1 : 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 40),
                    width: 240,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(icon: const Icon(Icons.thumb_up), onPressed: () {},),
                        const Icon(Icons.favorite),
                        const Icon(Icons.thumb_down),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
