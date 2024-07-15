import 'package:flutter/material.dart';


class FamilyInfoPage extends StatelessWidget {
  void _navigateToEditFamilyInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditFamilyInfoPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('家庭信息'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '家庭信息详情',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildFamilyMemberCard('张三', '父亲', 'assets/father.png', '13800138000'),
            SizedBox(height: 16.0),
            _buildFamilyMemberCard('李四', '母亲', 'assets/mother.png', '13900139000'),
            SizedBox(height: 16.0),
            _buildFamilyMemberCard('王五', '儿子', 'assets/son.png', '13700137000'),
            Divider(height: 32.0, thickness: 2.0),
            Text(
              '地址',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.blue),
                title: Text('北京市朝阳区XX街道XX号'),
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
                title: Text('张三 - 13800138000'),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () => _navigateToEditFamilyInfo(context),
                child: Text('编辑家庭信息'),
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

  Widget _buildFamilyMemberCard(String name, String role, String imagePath, String phone) {
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
                  Text(role),
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

class EditFamilyInfoPage extends StatelessWidget {
  final TextEditingController _fatherController = TextEditingController(text: '张三');
  final TextEditingController _motherController = TextEditingController(text: '李四');
  final TextEditingController _sonController = TextEditingController(text: '王五');
  final TextEditingController _addressController = TextEditingController(text: '北京市朝阳区XX街道XX号');
  final TextEditingController _fatherPhoneController = TextEditingController(text: '13800138000');
  final TextEditingController _motherPhoneController = TextEditingController(text: '13900139000');
  final TextEditingController _sonPhoneController = TextEditingController(text: '13700137000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('编辑家庭信息'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '编辑家庭信息',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildTextField('父亲', _fatherController),
            _buildTextField('母亲', _motherController),
            _buildTextField('儿子', _sonController),
            _buildTextField('地址', _addressController),
            _buildTextField('父亲电话', _fatherPhoneController),
            _buildTextField('母亲电话', _motherPhoneController),
            _buildTextField('儿子电话', _sonPhoneController),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 处理保存操作
                },
                child: Text('保存'),
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