import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:picsel_github/core/theme/colors.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    this.textInputAction,
    this.textInputType,
    this.errorText,
    this.ispassword = false,
    this.fillColor,
    this.mask = '',
    this.enabled = true,
    this.onEditingComplete,
    this.label,
    this.onchanged,
    this.text,
    this.style,
    this.key,
    this.suffixIcon,
    this.controller,
    this.initialValue,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.preffix,
    this.isFloat = false,
  });

  final String? errorText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final String? label;
  final TextCapitalization textCapitalization;
  final String? suffix;
  final String? preffix;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final String mask;
  final String? text;
  final Function(String)? onchanged;
  final Function()? onEditingComplete;
  final bool ispassword;
  final bool isFloat;
  final bool enabled;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Key? key;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    if (widget.controller == null) {
      if (widget.isFloat) {
        _controller = MoneyMaskedTextController(thousandSeparator: '');
      } else {
        if (widget.mask.isNotEmpty) {
          _controller = MaskedTextController(
            mask: widget.mask,
          );
        } else {
          _controller = TextEditingController();
        }
      }
    } else {
      _controller = widget.controller!;
    }

    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }

    _controller.addListener(() {
      if (_controller.selection.start < 0) {
        _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: _controller.text.length));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.text != null) {
      _controller.text = widget.text ?? '';
      if (widget.mask.isNotEmpty && _controller is MaskedTextController) {
        (_controller as MaskedTextController).updateMask(widget.mask);
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label == null
            ? Container()
            : Text('  ${widget.label!}', style: TextStyle(color: Colors.white)),
        SizedBox(
          height: 8,
        ),
        Container(
          child: TextField(
            style: widget.style ?? TextStyle(color: Colors.white),
            textCapitalization: widget.textCapitalization,
            textInputAction: widget.textInputAction,
            key: widget.key,
            textAlignVertical: TextAlignVertical.center,
            expands: false,
            controller: _controller,
            enabled: widget.enabled,
            keyboardType: widget.textInputType,
            onChanged: widget.onchanged,
            onEditingComplete: widget.onEditingComplete,
            obscureText: widget.ispassword,
            inputFormatters: widget.inputFormatters,
            cursorColor: AppColors.border,
            decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                errorText: widget.errorText,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.primaryShade2, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.border, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.error, width: 2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.error, width: 2),
                ),
                fillColor: widget.fillColor ?? AppColors.primaryDarker,
                filled: true),
          ),
        )
      ],
    );
  }
}
