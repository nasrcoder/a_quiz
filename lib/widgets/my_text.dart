import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  
  final String mytext;
  final TextStyle? style;   // ① custom style (overrides everything)
  final bool useAlt;        // ② if true, try the alt style


  const MyText({
    required this.mytext,
    this.style,
    this.useAlt = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ── default style (always available)
    const defaultStyle = TextStyle(
      color: Colors.white,
       fontSize: 28,
       fontWeight: FontWeight.w900,
       letterSpacing: 2,
       );

    // ── alt style – set to null on purpose
    const TextStyle? altStyle = null;   // “no style” case

    // ── pick the first non‑null option:
    //    1️⃣ custom style,
    //    2️⃣ alt style (null → falls through),
    //    3️⃣ default style
    final effective = style ??
        (useAlt ? altStyle : null) ??
        defaultStyle;

    return Text(mytext, style: effective);
  }
}






/*
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String mytext;
  final TextStyle? style;        
  const MyText({
    required this.mytext,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text(
        mytext,
        style: style ??
            const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
      );
}

*/



// import 'package:flutter/material.dart';
// class MyText extends StatelessWidget {
//   final String mytext;
//   final TextStyle? style;   // optional custom style

//   const MyText({required this.mytext, super.key, this.style});

//   @override
//   Widget build(BuildContext context) {
//     // Base style that the widget uses by default
//     const defaultStyle = TextStyle(
//       color: Colors.white,
//       fontSize: 30,
//     );
//     // If a custom style is provided, combine it with the defaults.
//     // `merge` keeps the defaults for any property the caller didn’t set.
//     final effectiveStyle = defaultStyle.merge(style);

//     return Text(
//       mytext,
//        style: effectiveStyle);
//   }
// }
