import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'commons.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final String initialValue;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final IconData icon;
  final Function onChanged;
  final Function validator;
  final Function onSaved;
  final Function onTap;
  final num maxLength;
  final Widget trailing;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText, enableSuggestions, autocorrect, autofocus;

  const AppTextField(
      {Key key,
      this.hint,
      this.textEditingController,
      this.keyboardType,
      this.icon,
      this.onChanged,
      this.onTap,
      this.maxLength,
      this.inputFormatters,
      this.validator,
      this.autocorrect = false,
      this.enableSuggestions = false,
      this.obscureText = false,
      this.autofocus = false,
      this.trailing,
      this.onSaved,
      this.initialValue})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Commons.bgColor.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(widget.icon, color: Commons.bgColor, size: 30),
          ),
          Expanded(
            child: TextFormField(
              autofocus: widget.autofocus,
              controller: widget.textEditingController,
              keyboardType: widget.keyboardType,
              initialValue: widget.initialValue,
              cursorColor: Commons.bgColor,
              onChanged: widget.onChanged,
              validator: widget.validator,
              obscureText: widget.obscureText,
              enableSuggestions: widget.enableSuggestions,
              autocorrect: widget.autocorrect,
              onTap: widget.onTap,
              onSaved: widget.onSaved,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                  labelText: widget.hint,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border:
                      const OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          if (widget.trailing != null) widget.trailing
        ],
      ),
    );
  }
}
