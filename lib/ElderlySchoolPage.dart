import 'package:flutter/material.dart';

class ElderlySchoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 本地测试数据
    final List<Map<String, String>> courses = [
      {
        'title': '健康生活',
        'description': '了解如何保持健康的生活方式',
        //'imagePath': 'assets/health.png',
      },
      {
        'title': '智能手机使用',
        'description': '学习如何使用智能手机',
        //'imagePath': 'assets/smartphone.png',
      },
      {
        'title': '理财知识',
        'description': '掌握基本的理财知识',
        //'imagePath': 'assets/finance.png',
      },
    ];

    // 将来从服务器获取课程数据的接口
    Future<List<Map<String, String>>> fetchCourses() async {
      // 模拟从服务器获取数据的延迟
      await Future.delayed(Duration(seconds: 2));

      // 返回测试数据
      return courses;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('老年学堂'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: fetchCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          } else {
            final courses = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    //leading: Image.asset(
                    //  course['imagePath']!,
                    //  width: 50.0,
                    //  height: 50.0,
                    //  fit: BoxFit.cover,
                   // ),
                    title: Text(course['title']!),
                    subtitle: Text(course['description']!),
                    onTap: () {
                      // 处理课程点击事件
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}