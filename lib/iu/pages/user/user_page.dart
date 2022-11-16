import 'package:chatapp/data/models/user.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final users = [
    User(false, "Juan", "juan@gmail.com", "1"),
    User(true, "Maria", "Maria@gmail.com", "2"),
    User(false, "Jose", "Jose@gmail.com", "3"),
    User(true, "Julia", "Julia@gmail.com", "4"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My name",
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.exit_to_app, color: Colors.black54)),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.check_circle,
                color: Colors.blueAccent,
              ),
            )
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          onRefresh: _loadingUsers,
          header: const WaterDropHeader(
            waterDropColor: Colors.blue,
          ),
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => CustomListTile(user: users[index]),
              separatorBuilder: (_, index) => const Divider(),
              itemCount: users.length),
        ));
  }

  void _loadingUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, Routes.CHAT),
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(user.name.substring(0, 2)),
      ),
      trailing: CircleAvatar(
        radius: 5,
        backgroundColor: user.online ? Colors.green : Colors.red,
      ),
    );
  }
}
