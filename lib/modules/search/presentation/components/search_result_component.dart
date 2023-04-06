import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/modules/search/domain/entities/user_result_entity.dart';

import '../../../../core/theme/colors.dart';

class SearchResultComponent extends StatelessWidget {
  final UserResultEntity searchResult;
  const SearchResultComponent({required this.searchResult});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pop();
        Modular.to.popAndPushNamed('/user/', arguments: searchResult.login);
      },
      child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(10),
          child: Text(searchResult.login)),
    );
  }
}
