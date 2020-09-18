import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';


class GeneralTextField extends StatelessWidget {
  final TextInputAction action;
  final Function validate, onFieldSubmitted;
  final Function(String) save, edit;
  final TextStyle style;
  final TextInputType keyboard;
  final FocusNode focus, nextFocus;
  final bool fill, enabled;
  final double radius, padding;
  final String initialValue;
  final Widget prefixIcon, suffixIcon;
  final int maxLine;
  final String hintText;
  final String prefixText;
  final bool obscureText;
  final TextEditingController textEditingController;
  final TextCapitalization capitalization;
  final Function onTap;


  const GeneralTextField({
    Key key,
    this.capitalization = TextCapitalization.none,
    this.initialValue,
    this.obscureText = false,
    this.textEditingController,
    this.focus,
    this.action = TextInputAction.next,
    this.validate,
    this.style,
    this.fill = true,
    this.keyboard = TextInputType.text,
    this.save,
    this.edit,
    this.onFieldSubmitted,
    this.nextFocus,
    this.radius = 4,
    this.padding = 12,
    this.prefixIcon,
    this.enabled = true,
    this.suffixIcon,
    this.maxLine,
    this.hintText,
    this.prefixText,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TextFormField(
        obscureText: obscureText,
        controller: textEditingController,
        maxLines: maxLine ?? 1,
        cursorColor: primaryColor,
        textCapitalization: capitalization,
        initialValue: initialValue,
        enabled: enabled,
        keyboardType: keyboard,
        onTap: onTap ?? () {},
        focusNode: focus ?? FocusNode(),
        onFieldSubmitted: onFieldSubmitted ??
                (term) {
              if (nextFocus != null && focus != null)
                Injector.appInstance
                    .getDependency<Utils>()
                    .switchFocus(context, focus, nextFocus);
            },
        validator: validate ?? (val) => null,
        textInputAction: action,

        style: style ?? TextStyle(color: primaryColor, height: 1.5),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: primaryColor.withOpacity(0.3)),
          contentPadding: EdgeInsets.all(padding),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide.none),
          filled: fill,
          prefixText: prefixText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixStyle: TextStyle(
            color: primaryColor,
            fontSize: 20,
          ),
        ),
        onSaved: save ?? (val) {},
        onChanged: edit ?? (val) {},
      ),
    );
  }
}
