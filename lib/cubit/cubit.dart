import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_dsc/cubit/states.dart';
import 'package:todo_dsc/modules/archive_tasks/archive_tasks.dart';
import 'package:todo_dsc/modules/done_tasks/done_tasks.dart';
import 'package:todo_dsc/modules/new_tasks/new_tasks.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(InitialState());

  static TodoCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void changeBottomIndex(index) {
    currentIndex = index;
    emit(ChangeBottomIndexState());
  }

  List<Widget> screens = [
    NewTasks(), //0
    DoneTasks(), //1
    ArchiveTasks(), //2
  ];

  Future<String> getName() async {
    String name = "moustafa";
    print(name);
    return name;
  }

  Database? database;

  /*
1-create Database
2-create tables
3-open Database
4-insert to database
5-get from database
6-update in database
7-delete from database
 */
  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date Text , time TEXT , status TEXT) ',
        );
        print('Database created successfully');
      },
      onOpen: (database) {
        print("Database opened successfully");
      },
    );
  }

  void insertToDatabase(
      {
        required String title,
        required String date,
        required String time,
      }) async {
    await database?.transaction((txn) async {
      await txn.rawInsert(
        "INSERT INTO tasks (title,date,time,status) VALUES('$title','$date','$time','new')",
      );
      print("data inserted");
    });
  }

  //textFormFIeld
}
