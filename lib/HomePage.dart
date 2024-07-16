import 'package:flutter/material.dart';
import 'package:elderlypeople/FamilyInfoPage.dart';
import 'package:elderlypeople/ElderlyInfoPage.dart';
import 'package:elderlypeople/ElderlySchoolPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _navigateToFamilyInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FamilyInfoPage()),
    );
  }

  void _navigateToElderlyInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ElderlyInfoPage()),
    );
  }

  void _navigateToElderlySchool(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ElderlySchoolPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.blue[100],
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '夕阳红活动',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('立即参加'),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.event, size: 100.0), // 使用图标替代图片
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildGridItem(Icons.home, '家庭信息', () => _navigateToFamilyInfo(context)),
                _buildGridItem(Icons.info, '老人信息', () => _navigateToElderlyInfo(context)),
                _buildGridItem(Icons.group, '老人关联', () {}),
                _buildGridItem(Icons.school, '老年学堂', () => _navigateToElderlySchool(context)),
              ],
            ),
          ),
          Divider(thickness: 2, color: Colors.grey[300]),
          _buildServiceSection('社区服务', [
            _buildServiceItem(Icons.restaurant, '助餐', Colors.green),
            _buildServiceItem(Icons.cleaning_services, '助洁', Colors.blue),
            _buildServiceItem(Icons.bathtub, '助浴', Colors.purple),
          ]),
          Divider(thickness: 2, color: Colors.grey[300]),
          _buildRecommendedArticlesSection(),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String title, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30.0,
            child: Icon(icon, size: 30.0),
          ),
          SizedBox(height: 8.0),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildServiceItem(IconData icon, String title, Color color) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 40.0),
            SizedBox(height: 8.0),
            Text(title, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceSection(String title, List<Widget> items) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: items,
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedArticlesSection() {
    final articles = [
      '保持健康的10个秘诀',
      '老年人如何预防跌倒',
      '老年人饮食指南',
      '老年人如何保持心理健康',
      '老年人如何进行家庭锻炼',
    ];

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '推荐阅读',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Icon(Icons.article, color: Colors.blue),
                  title: Text(articles[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
