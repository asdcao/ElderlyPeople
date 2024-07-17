import 'package:flutter/material.dart';

class DietRecommendationPage extends StatelessWidget {
  final List<Map<String, String>> _dietRecommendations = [
    {'meal': '早餐', 'recommendation': '燕麦粥，鸡蛋，水果'},
    {'meal': '午餐', 'recommendation': '清蒸鱼，蔬菜沙拉，全麦面包'},
    {'meal': '晚餐', 'recommendation': '鸡肉汤，蒸蔬菜，糙米'},
    {'meal': '零食', 'recommendation': '坚果，酸奶，水果'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('饮食推荐'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '每日饮食推荐',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _dietRecommendations.length,
                itemBuilder: (context, index) {
                  final recommendation = _dietRecommendations[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.restaurant, color: Colors.blue),
                      title: Text('${recommendation['meal']} - ${recommendation['recommendation']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
