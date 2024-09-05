import 'package:flutter/material.dart';
import 'package:letstalkbooksfinished/core/managers/book_manager.dart';
import 'package:letstalkbooksfinished/ui/commonwidgets/custom_app_bar.dart';
import 'package:letstalkbooksfinished/ui/screens/add_book_screen.dart';

import '../../core/app_constants.dart';
import '../../core/tables/book_model.dart';

class DisplayBooksListScreen extends StatelessWidget{
  final _bookManager = BookManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "Books List",
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 100,
              height: 100,
            ),
            Text(
              AppConstants.kAppName,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),
            ),
            StreamBuilder(
                stream: _bookManager.listenToBooks(),
                builder: (BuildContext context, AsyncSnapshot<List<BookModel>> snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  else{
                    if(snapshot.hasData){
                      List<BookModel> booksList = snapshot.data!;
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: booksList.length,
                          itemBuilder: (BuildContext context, int index){
                            BookModel currentBookModel = booksList[index];
                            return Container(
                              height: 100,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white
                                ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentBookModel.bookName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Time - ",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        currentBookModel.duration,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                            Icons.flag,
                                            size: 20,
                                            color: Colors.white,
                                        ),
                                        Text(
                                            "${currentBookModel.priorityValue}",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                      );
                    }
                    else{
                      return Container();
                    }
                  }
                }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddBookScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

}