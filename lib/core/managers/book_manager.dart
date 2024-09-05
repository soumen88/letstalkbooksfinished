
import 'package:isar/isar.dart';
import 'package:letstalkbooksfinished/core/tables/book_model.dart';
import 'package:path_provider/path_provider.dart';

class BookManager{

  Isar? _isar;

  ///Step1 - Create the database for first time
  Future<void> initDatabase() async{
    var directory = await getApplicationDocumentsDirectory();

    await Isar.open([BookModelSchema], directory: directory.path)
        .then((value){
      _isar = value;
    });
  }

  ///Step 2- Insert a book that user wants to save
  Future<void> insertABook({required BookModel bookModel}) async{
    if(_isar == null){
      _isar = await Isar.getInstance();
    }

    await _isar?.writeTxn(() async{
      int? rowId = await _isar?.bookModels.put(bookModel);
      print("Row id inserted $rowId");
    });
  }

  Stream<List<BookModel>>? listenToBooks() async* {
    _isar ??= Isar.getInstance();
    var listOfCardsStream = _isar?.bookModels.where().watch(fireImmediately: true);
    yield* listOfCardsStream!;
  }

  Future<bool?> deleteTask({required int bookId}) async{
    _isar ??= Isar.getInstance();
    bool? wasDeleteSuccessful;
    await _isar?.writeTxn(()async{
      wasDeleteSuccessful = await _isar?.bookModels.delete(bookId);
      print("Was delete successful $wasDeleteSuccessful");
    });
  }

}