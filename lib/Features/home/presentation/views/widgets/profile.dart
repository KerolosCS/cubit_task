import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            const CircleAvatar(
                radius: 40,
                child: Text(
                  'K',
                  style: TextStyle(fontSize: 40),
                )),
            const SizedBox(height: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : Kerolos Fady"),
                SizedBox(height: 8),
                Text("Email : kero@gmail.com"),
                SizedBox(height: 8),
                Text("Phone : 01227447196"),
              ],
            ),
            const Spacer(),
            Container(
              height: 50,
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                onPressed: () {},
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
