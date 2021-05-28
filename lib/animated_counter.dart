
import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  final int value;
  final Duration duration;

  //加上大括號, 變成命名參數
  AnimatedCounter({@required this.duration, @required this.value});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween(end: value.toDouble()),
      builder: (BuildContext context, value, Widget child) {
        // print(value);
        //拆解數字, 整數＆小數部分
        //整數的部分把數值轉換成Int
        final whole = value ~/ 1; //除完取整
        final decimal = value - whole; //減去整數部分, 取得小數
        print("$whole + $decimal");

        return Stack(children: [
          Positioned(
            top: -100 * decimal, //需要從0~-100來讓數字消失
            child: Opacity(
              opacity: 1.0 - decimal,
              child: Text(
                "$whole",
                style: TextStyle(fontSize: 100),
              ),
            ),
          ),
          Positioned(
            top: 100 - decimal * 100, //需要一個100~0的動畫效果
            child: Opacity(
              opacity: decimal,
              child: Text(
                "${whole + 1}",
                style: TextStyle(fontSize: 100),
              ),
            ),
          ),
        ]);
      },
    );
  }
}