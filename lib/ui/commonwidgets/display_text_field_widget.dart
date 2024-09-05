import 'package:flutter/material.dart';

class DisplayTextFieldWidget extends StatelessWidget{
  TextEditingController inputController;
  String hintText;
  int maxLength;
  double fieldHeight;
  TextInputType inputType;
  DisplayTextFieldWidget({required this.inputController, required this.hintText, this.maxLength = 300, this.fieldHeight = 110, this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (fieldHeight != 110) ? fieldHeight : 140,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10.0),
      child:  ConstrainedBox(
        constraints:  BoxConstraints(
          maxHeight: (fieldHeight != 110) ? fieldHeight : 120,
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: SizedBox(
              height: fieldHeight,
              child: TextFormField(
                textInputAction: (inputType == TextInputType.multiline) ? TextInputAction.newline : TextInputAction.done,
                controller: inputController,
                keyboardType: inputType,
                maxLines: 100,
                maxLength: maxLength,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  contentPadding: EdgeInsets.all(10),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: Colors.redAccent
                      )
                  ),
                ),
                buildCounter: (BuildContext context, {required currentLength, maxLength, required isFocused}){
                  return Column(
                    children: [
                      const Divider(
                        color: Colors.grey,
                        thickness: 2,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "$currentLength/$maxLength chars",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12
                          ),
                        ),
                      ),
                    ],
                  );
                },
                validator: (String? input){
                  if(input != null && input.isNotEmpty){
                    return null;
                  }
                  else{
                    return "Enter valid input";
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

}