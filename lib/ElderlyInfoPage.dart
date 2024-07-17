import 'package:flutter/material.dart';

class ElderlyInfoPage extends StatelessWidget {
  void _navigateToEditElderlyInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditElderlyInfoPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '个人信息详情',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildInfoRow('姓名', '张三'),
            _buildInfoRow('性别', '男'),
            _buildInfoRow('年龄', '80'),
            _buildInfoRow('电话', '13800138000'),
            _buildInfoRow('地址', '北京市朝阳区XX街道XX号'),
            Divider(height: 32.0, thickness: 2.0),
            Center(
              child: ElevatedButton(
                onPressed: () => _navigateToEditElderlyInfo(context),
                child: Text('编辑个人信息'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}

class EditElderlyInfoPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController(text: '张三');
  final TextEditingController _genderController = TextEditingController(text: '男');
  final TextEditingController _ageController = TextEditingController(text: '80');
  final TextEditingController _phoneController = TextEditingController(text: '13800138000');
  final TextEditingController _addressController = TextEditingController(text: '北京市朝阳区XX街道XX号');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('编辑个人信息'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '编辑个人信息',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildTextField('姓名', _nameController),
            _buildTextField('性别', _genderController),
            _buildTextField('年龄', _ageController),
            _buildTextField('电话', _phoneController),
            _buildTextField('地址', _addressController),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 处理保存操作
                },
                child: Text('保存'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
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

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
