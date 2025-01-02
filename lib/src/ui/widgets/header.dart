import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String logoAssetPath;
  final IconData icon;
  final VoidCallback onIconPressed;

  

  const Header({
    super.key,
    required this.logoAssetPath,
    required this.icon,
    required this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber, 
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         
          Image.asset(
            logoAssetPath , 
            height: 150, 
          ),
        
          IconButton(
            icon: Icon(icon),
            onPressed: onIconPressed,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); 
}
