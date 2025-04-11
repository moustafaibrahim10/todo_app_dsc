import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constatns.dart';

Widget buildTaskItem() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text('12:00', style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Go to UNI', style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(
                height: 5,
              ),
              Text('oct 4, 2024', style: TextStyle(
                color: Colors.black38,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Spacer(),
          IconButton(onPressed: () {},
              icon: Icon(Icons.check_box_outlined, color: primaryColor,)),
          IconButton(onPressed: () {},
              icon: Icon(Icons.archive, color: Colors.black54,))
        ],
      ),
    );

Widget buildTaskList(
{
  required int count,
}) => ListView.separated(
  itemBuilder: (context, index) => buildTaskItem(),
  separatorBuilder: (context, index) => Divider(color: Colors.grey),
  itemCount: 20,
);