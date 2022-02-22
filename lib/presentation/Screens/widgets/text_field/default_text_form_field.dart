import 'package:flutter/material.dart';

class DefaultTextFormField extends StatefulWidget {
  final TextEditingController ?textEditingController;
  final TextInputType ?textInputType;
  final double?defaultBorderRadius;
  final Color?borderSideColor;
  final double?enabledBorderRadius;
  final Color?enabledBorderSideColor;
  final bool ?obSecureText;
  final String? Function(String?)? validator;
  final String? hintText;
  final Color? fillColor;
  final IconData? suffixIcon;

  final TextStyle?hintTextStyle;
  final TextStyle?textStyle;
  final String?labelText;
  final TextStyle?labelTextStyle;
  final int ?maxLine;
  const DefaultTextFormField({Key? key,this.textEditingController,this.textInputType,this.enabledBorderRadius,this.enabledBorderSideColor,this.borderSideColor,this.defaultBorderRadius,this.obSecureText,this.validator,this.hintText,this.fillColor,this.hintTextStyle,this.textStyle,this.labelText,this.labelTextStyle,this.suffixIcon,this.maxLine}) : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine,
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
    //  obscureText:widget.obSecureText!,
      validator:widget.validator,
      style: widget.textStyle,

obscureText: widget.obSecureText == null ? false : widget.obSecureText!,

      decoration: InputDecoration(
        suffixIcon: IconButton(icon:Icon(widget.suffixIcon),onPressed: (){},),
        hintText:widget.hintText,
        fillColor: widget.fillColor,
        filled: true,
        hintStyle: widget.hintTextStyle,
        labelText: widget.labelText,
        labelStyle: widget.labelTextStyle,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.enabledBorderRadius!),
          borderSide:BorderSide(color:widget.enabledBorderSideColor!),
        ),
        //default border and color for textfield
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.enabledBorderRadius!),
          borderSide:BorderSide(color:widget.enabledBorderSideColor!),
        ) ,
        //on click border
        border:OutlineInputBorder(

          borderRadius: BorderRadius.all(Radius.circular(widget.defaultBorderRadius!)),
          borderSide: BorderSide(color:widget.borderSideColor!),
        ),

      ),
    );
  }
}
