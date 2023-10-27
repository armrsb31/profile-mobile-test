import 'package:flutter/material.dart';
import '../../user_profile/view/list_user_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ListUserPage())),
          child: const Text('ข้อมูลผู้ใช้งาน'),
        ),
      ),
    );
  }
}
