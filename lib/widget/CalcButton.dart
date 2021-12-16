import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String? text;
  final Color? fillcolor;
  final int? textcolor;
  final double textsize;
  final Function? callBack;
  final bool isIcon;

  const CalcButton(
      {Key? key,
      this.text,
      this.callBack,
      this.isIcon = false,
      this.textcolor = 0xFFFFFFFF,
      this.textsize = 24,
      this.fillcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;
    double btnheight = MediaQuery.of(context).size.height * 0.093;
    if (wdth >= 500) {
      btnheight = MediaQuery.of(context).size.height * 0.11;
    }
    return Container(
      //margin: EdgeInsets.all(10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          //color: Colors.black.withOpacity(0.15),
          color: Color(0xffbfafb2).withOpacity(0.4),
          blurRadius: 14,
          offset: Offset(5, 7),
        ),
      ]),
      child: SizedBox(
        width: 75, //height: 65,
        height: btnheight,
        //width: MediaQuery.of(context).size.width * 0.17,

        // ignore: deprecated_member_use
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {
            callBack!(text, context);
          },
          color: fillcolor != null ? fillcolor : null,
          child: isIcon
              ? Icon(Icons.backspace_outlined)
              : Text(
                  text!,
                  style: TextStyle(
                      fontSize: textsize, fontWeight: FontWeight.w300),
                ),
        ),
      ),
    );
  }
}
