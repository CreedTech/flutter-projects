import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthdayWidget extends StatefulWidget {
  const BirthdayWidget({Key? key, required this.birthday, required this.onChangedBirthday}) : super(key: key);
  final DateTime birthday;
  final ValueChanged<DateTime> onChangedBirthday;

  @override
  _BirthdayWidgetState createState() => _BirthdayWidgetState();
}

class _BirthdayWidgetState extends State<BirthdayWidget> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    setDate();
  }

  @override
  void didUpdateWidget(covariant BirthdayWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    setDate();
  }

  void setDate(){
    setState(() {
      controller.text = widget.birthday  == null ? '' : DateFormat.yMd().format(widget.birthday);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FocusBuilder(
      onChangedVisibility: (isVisible){
        if(isVisible){
          selectDate(context);
        }
        else {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      focusNode: focusNode,
      builder: (bool hasFocus) => TextFormField(
        controller: controller,
        validator: (value) => value!.isEmpty ? 'Is Required' : null,
        decoration: const InputDecoration(
          prefixText: '',
          hintText: 'Your Birthday',
          prefixIcon: Icon(Icons.calendar_today_rounded),
          border: OutlineInputBorder(),
        ),
      ),

    );
  }
  Future selectDate(BuildContext context) async {
    final birthday = await showDatePicker(
        context: context,
        initialDate: widget.birthday,
        firstDate: DateTime(1950),
        lastDate: DateTime(2100)
    );

    if(birthday == null ) return;
    widget.onChangedBirthday(birthday);
  }
}

class FocusBuilder extends StatefulWidget {
  const FocusBuilder({Key? key, required this.focusNode, required this.builder, required this.onChangedVisibility}) : super(key: key);
  final FocusNode focusNode;
  final Widget Function(bool hasFocus) builder;
  final ValueChanged<bool> onChangedVisibility;

  @override
  _FocusBuilderState createState() => _FocusBuilderState();
}

class _FocusBuilderState extends State<FocusBuilder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => widget.onChangedVisibility(true),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: widget.onChangedVisibility,
        child: widget.builder(widget.focusNode.hasFocus),
      ),
    );
  }
}

