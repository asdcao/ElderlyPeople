import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ElderlyInfoPage(),
    );
  }
}

class ElderlyInfoPage extends StatelessWidget {
  // 本地测试数据
  final Map<String, String> elderlyData = {
    'name': '张老',
    'age': '70岁',
    'imagePath': 'assets/elderly1.png',
    'phone': '13800138000',
    'healthStatus': '健康',
    'birthdate': '1950年1月1日',
    'address': '北京市朝阳区XX街道XX号',
    'hobbies': '下棋, 唱歌, 散步',
  };

  // 将来从服务器获取数据的接口
  Future<Map<String, String>> fetchElderlyData() async {
    // 模拟从服务器获取数据的延迟
    await Future.delayed(Duration(seconds: 2));

    // 返回测试数据
    return elderlyData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('老人信息'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<Map<String, String>>(
        future: fetchElderlyData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          } else {
            final data = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '老人信息详情',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    _buildElderlyMemberCard(data['name']!, data['age']!, data['imagePath']!, data['phone']!),
                    Divider(height: 32.0, thickness: 2.0),
                    _buildInfoItem(Icons.cake, '出生日期', data['birthdate']!),
                    _buildInfoItem(Icons.home, '地址', data['address']!),
                    //_buildInfoItem(Icons.favorite, '兴趣爱好', data['hobbies']!),
                    Divider(height: 32.0, thickness: 2.0),
                    Text(
                      '健康状况',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: Icon(Icons.health_and_safety, color: Colors.green),
                        title: Text(data['healthStatus']!),
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
                        title: Text('${data['name']} - ${data['phone']}'),
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
        },
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

  Widget _buildInfoItem(IconData icon, String title, String content) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(content),
      ),
    );
  }
}
