import 'package:flutter/material.dart';
import 'package:letstalkbooksfinished/core/color_constants.dart';
import 'package:letstalkbooksfinished/core/tables/book_model.dart';
import 'package:letstalkbooksfinished/data/get_priority_list.dart';
import 'package:letstalkbooksfinished/ui/commonwidgets/custom_app_bar.dart';
import 'package:letstalkbooksfinished/ui/commonwidgets/custom_button_widget.dart';
import 'package:letstalkbooksfinished/ui/commonwidgets/display_priority_grid_widget.dart';
import 'package:letstalkbooksfinished/ui/commonwidgets/display_text_field_widget.dart';
import 'package:letstalkbooksfinished/ui/commonwidgets/display_time_text_field.dart';

import '../../core/managers/book_manager.dart';
import '../../models/priority_model.dart';

class AddBookScreen extends StatelessWidget{
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _bookManager = BookManager();
  int priorityValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        titleText: "Add New Book",
      ),
      body: Padding(
        padding: EdgeInsets.only(left:  20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                DisplayTextFieldWidget(
                  inputController: bookNameController,
                  hintText: "Enter Book Name",
                  maxLength: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                DisplayPriorityGridWidget(
                  onCardClick: (int priorityValueSelected){
                    print("Priority selected $priorityValueSelected");
                    priorityValue = priorityValueSelected;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                DisplayTimeTextField(
                    displayTimeController: timeController
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomButtonWidget(
                      onButtonPress: () async{
                        if(_formKey.currentState != null && _formKey.currentState!.validate()){
                          BookModel bookModel = BookModel(bookName: bookNameController.text, priorityValue: priorityValue, duration: timeController.text);
                          await _bookManager.insertABook(bookModel: bookModel);
                          Navigator.pop(context);
                        }
                      },
                      buttonText: "Add Book"
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

}