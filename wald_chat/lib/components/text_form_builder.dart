import 'package:flutter/material.dart';
import 'package:wald_chat/components/custom_card.dart';

class TextFormBuilder extends StatefulWidget {
  final String? initialValue;
  final bool? enabled;
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final FormFieldValidator<String> validateFunction;
  final void Function(String) onSaved;
  final void Function(String)? onChange;
  final IconData? prefix;
  final IconData? suffix;

  const TextFormBuilder(
      {Key? key,
      this.prefix,
      this.suffix,
      this.initialValue,
      this.enabled,
      this.hintText,
      this.textInputType,
      this.controller,
      this.textInputAction,
      this.nextFocusNode,
      this.focusNode,
      this.submitAction,
      this.obscureText = false,
      required this.validateFunction,
      required this.onSaved,
      this.onChange})
      : super(key: key);

  @override
  State<TextFormBuilder> createState() => _TextFormBuilderState();
}

class _TextFormBuilderState extends State<TextFormBuilder> {
  String? error;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCard(
            borderRadius: BorderRadius.circular(40.0),
            child: Theme(
              data: ThemeData(
                primaryColor: Theme.of(context).colorScheme.secondary,
                colorScheme: ColorScheme.fromSwatch().copyWith(
                    secondary: Theme.of(context).colorScheme.secondary),
              ),
              child: TextFormField(
                textCapitalization: TextCapitalization.sentences,
                initialValue: widget.initialValue,
                enabled: widget.enabled,
                onChanged: (val) {
                  error = widget.validateFunction(val);
                  setState(() {});
                  widget.onSaved(val);
                },
                style: const TextStyle(
                  fontSize: 15.0,
                ),
                key: widget.key,
                controller: widget.controller,
                obscureText: widget.obscureText,
                keyboardType: widget.textInputType,
                validator: widget.validateFunction,
                onSaved: (val) {
                  error = widget.validateFunction(val);
                  setState(() {});
                  widget.onSaved(val!);
                },
                textInputAction: widget.textInputAction,
                focusNode: widget.focusNode,
                onFieldSubmitted: (String term) {
                  if (widget.nextFocusNode != null) {
                    widget.focusNode?.unfocus();
                    FocusScope.of(context).requestFocus(widget.nextFocusNode);
                  } else {
                    widget.submitAction!();
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    widget.prefix,
                    size: 15.0,
                  ),
                  suffixIcon: Icon(
                    widget.suffix,
                    size: 15.0,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  border: border(context),
                  enabledBorder: border(context),
                  focusedBorder: focusBorder(context),
                  errorStyle: const TextStyle(height: 0.0, fontSize: 0.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          // Visibility(
          //   visible: error != null,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 10.0),
          //     child: Text(
          //       error!,
          //       style: TextStyle(
          //         color: Colors.red[700],
          //         fontSize: 12.0,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  border(BuildContext context) {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(
        color: Colors.white,
        width: 0.0,
      ),
    );
  }

  focusBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 1.0,
      ),
    );
  }
}
