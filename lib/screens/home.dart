import 'package:first_app/constants/colors.dart';
import 'package:first_app/models/todo.dart';
import 'package:first_app/widgets/app_bar/app_bar.dart';
import 'package:first_app/widgets/search/search_box/search_box.dart';
import 'package:first_app/widgets/todo_item/todo_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = Todo.todoList();
  List<Todo> foundList = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    foundList = todosList;
    super.initState();
  }

  void _handleToDoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDeleteItem(String id) {
    setState(() {
      todosList.removeWhere((element) => element.id == id);
    });
  }

  void _addTodo(String todo) {
    setState(() {
      todosList.add(Todo(id: todosList.length.toString(), todoText: todo));
    });
    _todoController.clear();
  }

  void _filterItems(String keyword) {
    List<Todo> results = [];

    if (keyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((element) =>
              element.todoText.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: const CustomAppBar(),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  SearchBox(
                    onChangeText: _filterItems,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: foundList.length,
                      itemBuilder: (context, index) {
                        final todo = foundList[index];
                        return TodoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _handleDeleteItem,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                    child: Container(
                  margin:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none),
                  ),
                )),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addTodo(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: const Size(55, 55),
                        elevation: 10),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                )
              ]),
            )
          ],
        ));
  }
}
