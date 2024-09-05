

import '../models/priority_model.dart';

class GetPriorityList{

  List<PriorityModel> getData(){
    List<PriorityModel> prioritiesList = [];
    PriorityModel one = PriorityModel(priorityValue: 1, prorityDesc: "Most Important and Urgent");
    PriorityModel two = PriorityModel(priorityValue: 2, prorityDesc: "Important but not urgent");
    PriorityModel three = PriorityModel(priorityValue: 3, prorityDesc: "Normal Importance and can be done later");
    PriorityModel four = PriorityModel(priorityValue: 4, prorityDesc: "Least important");
    prioritiesList.add(one);
    prioritiesList.add(two);
    prioritiesList.add(three);
    prioritiesList.add(four);

    return prioritiesList;

  }


}