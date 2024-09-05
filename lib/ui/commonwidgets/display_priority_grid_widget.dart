import 'package:flutter/material.dart';

import '../../core/color_constants.dart';
import '../../data/get_priority_list.dart';
import '../../models/priority_model.dart';

class DisplayPriorityGridWidget extends StatefulWidget{

  Function(int prioritySelected) onCardClick;


  DisplayPriorityGridWidget({required this.onCardClick});

  @override
  State<DisplayPriorityGridWidget> createState() => _DisplayPriorityGridWidgetState();
}

class _DisplayPriorityGridWidgetState extends State<DisplayPriorityGridWidget> {
  final List<PriorityModel> priorityList = GetPriorityList().getData();
  int selectedValue = -1;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: priorityList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
        ),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          PriorityModel currentPriorityModel = priorityList[index];
          return GestureDetector(
            onTap: (){
              selectedValue = index;
              widget.onCardClick(currentPriorityModel.priorityValue);
              setState(() {

              });
            },
            child: Card(
              color: (selectedValue == index) ? ColorConstants.kOrangeColor : ColorConstants.kPurpleColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.flag,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "${currentPriorityModel.priorityValue}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Text(
                    currentPriorityModel.prorityDesc,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}