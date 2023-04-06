import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:picsel_github/modules/user/domain/entities/repository_entity.dart';
import '../../../../core/data_parser.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/icons.dart';

class RepoComponent extends StatelessWidget {
  final RepositoryEntity repo;
  const RepoComponent(this.repo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.border)),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 250,
              child: Text(repo.name,
                  style: TextStyle(color: AppColors.blue, fontSize: 16)),
            ),
            Text('updated at ${DateParser.getDateString(repo.updated_at)}',
                style: TextStyle(
                    color: AppColors.primary.withOpacity(.3), fontSize: 12)),
          ]),
          Container(
            child: Row(
              children: [
                // Image.asset(
                //   AppIcons.download,
                //   height: 20,
                //   fit: BoxFit.fitHeight,
                // ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(repo.url));
                  },
                  child: Image.asset(
                    AppIcons.open,
                    height: 16,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
