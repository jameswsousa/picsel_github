import 'package:flutter/material.dart';
import 'package:picsel_github/modules/user/domain/entities/user_entity.dart';

import '../../../../core/theme/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/theme/icons.dart';

class UserComponent extends StatelessWidget {
  final UserEntity user;
  const UserComponent(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.secondary,
            border: Border.all(color: AppColors.border)),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        user.avatar_url,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name ?? user.login,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        if (user.name != null)
                          Text(
                            user.login,
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.primary.withOpacity(.5)),
                          ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () =>
                      Modular.to.pushNamed('/starred', arguments: user.login),
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: Image.asset(
                      AppIcons.favorited,
                      color: AppColors.golden,
                      height: 30,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            if (user.bio != null)
              SizedBox(
                height: 10,
              ),
            if (user.bio != null)
              Text(
                user.bio!,
                style: TextStyle(color: AppColors.primary.withOpacity(.8)),
              )
          ],
        ));
  }
}
