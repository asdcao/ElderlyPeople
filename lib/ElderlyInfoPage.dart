import 'package:flutter/material.dart';


class ElderlyInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('老人信息'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '老人信息详情',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildElderlyMemberCard('张老', '70岁', 'assets/elderly1.png', '13800138000'),
            SizedBox(height: 16.0),
            _buildElderlyMemberCard('李老', '75岁', 'assets/elderly2.png', '13900139000'),
            SizedBox(height: 16.0),
            _buildElderlyMemberCard('王老', '80岁', 'assets/elderly3.png', '13700137000'),
            Divider(height: 32.0, thickness: 2.0),
            Text(
              '健康状况',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(Icons.health_and_safety, color: Colors.green),
                title: Text('张老：健康\n李老：有高血压\n王老：糖尿病'),
              ),
            ),
            Divider(height: 32.0, thickness: 2.0),
            Text(
              '紧急联系人',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.red),
                title: Text('张老 - 13800138000\n李老 - 13900139000\n王老 - 13700137000'),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 处理编辑老人信息
                },
                child: Text('编辑老人信息'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  textStyle: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElderlyMemberCard(String name, String age, String imagePath, String phone) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30.0,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(age),
                ],
              ),
            ),
            Icon(Icons.phone, color: Colors.blue),
            SizedBox(width: 8.0),
            Text(phone),
          ],
        ),
      ),
    );
  }
}
