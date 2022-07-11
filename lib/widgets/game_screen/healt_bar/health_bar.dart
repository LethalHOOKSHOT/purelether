import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HealthBar extends StatelessWidget
{
  const HealthBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
    [
      Image.asset('assets/img/heart.png',width: 17,height: 17,),
      Image.asset('assets/img/heart.png',width: 17,height: 17,),
      Image.asset('assets/img/heart.png',width: 17,height: 17,),
      Image.asset('assets/img/heart.png',width: 17,height: 17,),
      Image.asset('assets/img/heart.png',width: 17,height: 17,),
    ],
    );
  }
}
