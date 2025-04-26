import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_dsc/components/components.dart';
import 'package:todo_dsc/cubit/cubit.dart';
import 'package:todo_dsc/cubit/states.dart';
import 'package:todo_dsc/modules/done_tasks/done_tasks.dart';
import 'package:todo_dsc/modules/new_tasks/new_tasks.dart';

class LayoutScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit()..createDatabase(),
      child: BlocConsumer<TodoCubit, TodoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TodoCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal,
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () async {
                showModalBottomSheet(
                  isDismissible: true,
                  isScrollControlled: false,
                  context: context,
                  builder: (context) {
                    return WillPopScope(
                      onWillPop: () async
                      {
                        if(formkey.currentState!.validate())
                         {
                           cubit.insertToDatabase(title: titleController.text, date: dateController.text, time: timeController.text);
                           Navigator.pop(context);}
                        return false;
                      },
                      child: Container(
                        height: 400,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    labelText: 'Task title',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Title must not be empty";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20,),
                                defultTextFormField(controller: timeController, labelText: "Task Time"),
                                SizedBox(height: 20),
                                defultTextFormField(controller: dateController, labelText: "Task Date"),
                                SizedBox(height: 40),
                                ElevatedButton(
                                  onPressed: () {
                                    if(formkey.currentState!.validate()) {
                                      cubit.insertToDatabase(title: titleController.text, date: dateController.text, time: timeController.text);
                                      Navigator.pop(context);
                                    }                                  },
                                  child: Text('Close',style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    backgroundColor: Colors.teal
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 16,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'New Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archive Tasks',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<String> getName() async {
    return "Moustafa";
  }

}
