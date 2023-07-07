import 'package:flutter/material.dart';
import 'package:prueba/design/colors.dart';

class CalendarCustom extends StatefulWidget {
  
  const CalendarCustom({
    Key? key,
    required this.label,
    required this.controller, 
  }
  ) : super(key: key);

  @override
  State<CalendarCustom> createState() => _CalendarCustomState();
    final String label;
    final TextEditingController controller;
}

class _CalendarCustomState extends State<CalendarCustom> {
  Future _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await _calendarCustom(context, widget.label);
    if (picked != null) {
      setState(() { widget.controller.text = "${picked.day}/${picked.month}/${picked.year}";});
    }
  }
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _selectDateFromPicker(context),
      child: Container(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: BukDoubleColors.brandSecondaryColor,width: 1),
          borderRadius: BorderRadius.circular(6)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.controller.text.isEmpty 
            ? Text(widget.label, style: const TextStyle(color: Colors.black54, fontSize: 20))
            : Text(widget.controller.text, style: Theme.of(context).textTheme.bodyLarge,),
            IconButton(
                        onPressed: () => _selectDateFromPicker(context),
                        icon: const Icon(Icons.calendar_today_outlined, color: BukDoubleColors.brandPrimaryColor,),
                      ),
          ],
        ),
      ),
    );
  }
}

Future _calendarCustom(context,label) async{
return showDatePicker(
      helpText: label,
      context: context,
      locale: const Locale('es', ''),
      initialDate: DateTime(DateTime.now().year- 18),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year- 18),
    );
}

