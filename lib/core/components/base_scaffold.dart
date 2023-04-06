import 'package:flutter/material.dart';
import 'package:picsel_github/core/theme/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/core/theme/icons.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final bool hasDrawer;
  final Color backgroundColor;
  const BaseScaffold(
      {required this.body,
      this.hasDrawer = true,
      this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: hasDrawer
          ? Drawer(
              backgroundColor: AppColors.primaryDarker,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  DrawerComponent(
                    img: AppIcons.search,
                    title: 'Pesquisar',
                    onTap: () {
                      Modular.to.pop();
                      return Modular.to.pushNamed('/search');
                    },
                  ),
                  DrawerComponent(
                      img: AppIcons.download, title: 'Salvos', onTap: () {}),
                  Expanded(child: Container()),
                  DrawerComponent(
                      img: AppIcons.logout,
                      title: 'Logout',
                      onTap: () => Modular.to.navigate('/login')),
                  SizedBox(
                    height: 20,
                  )
                ],
              ))
          : null,
      backgroundColor: backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppIcons.logo,
                  fit: BoxFit.contain,
                  height: 30,
                  width: 30,
                  color: Colors.white),
              SizedBox(
                width: 8,
              ),
              Text('Github API')
            ],
          )),
      body: body,
    );
  }
}

class DrawerComponent extends StatelessWidget {
  final String title;
  final String img;
  final Function() onTap;
  const DrawerComponent({
    required this.title,
    required this.img,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(img,
                height: 20, fit: BoxFit.contain, color: Colors.white),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
