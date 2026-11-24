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
              backgroundColor: AppColors.secondary,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: AppColors.primary,
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).padding.top + 24, 20, 24),
                    child: Row(
                      children: [
                        Image.asset(AppIcons.logo,
                            height: 36, color: Colors.white),
                        SizedBox(width: 12),
                        Text('Github API',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  DrawerComponent(
                    img: AppIcons.search,
                    title: 'Pesquisar',
                    onTap: () {
                      Modular.to.pop();
                      return Modular.to.pushNamed('/search/');
                    },
                  ),
                  DrawerComponent(
                      img: AppIcons.download, title: 'Salvos', onTap: () {}),
                  Spacer(),
                  Divider(height: 1, color: AppColors.border),
                  DrawerComponent(
                    img: AppIcons.logout,
                    title: 'Logout',
                    color: AppColors.error,
                    onTap: () {
                      Modular.to.pop(); // fecha o menu antes de trocar de tela
                      Modular.to.navigate('/login/');
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom + 8),
                ],
              ))
          : null,
      backgroundColor: backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
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
  final Color? color;
  const DrawerComponent({
    required this.title,
    required this.img,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final itemColor = color ?? AppColors.primary;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
      leading: Image.asset(img, height: 22, color: itemColor),
      title: Text(title, style: TextStyle(color: itemColor, fontSize: 18)),
      onTap: onTap,
    );
  }
}
