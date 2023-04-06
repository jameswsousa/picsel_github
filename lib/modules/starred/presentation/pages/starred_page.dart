import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:picsel_github/core/components/base_scaffold.dart';
import 'package:picsel_github/core/components/loading_widget.dart';
import 'package:picsel_github/core/theme/colors.dart';
import 'package:picsel_github/modules/starred/presentation/controller/starred_controller.dart';
import 'package:picsel_github/modules/user/presentation/components/repo_component.dart';

class StarredPage extends StatefulWidget {
  final String username;

  const StarredPage(this.username);

  @override
  State<StarredPage> createState() => _StarredPageState();
}

class _StarredPageState extends State<StarredPage> {
  final _controller = Modular.get<StarredController>();
  @override
  void initState() {
    Future.delayed(Duration.zero,
        (() async => await _controller.getStarred(widget.username)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BaseScaffold(
        body: _controller.starredRepos == null
            ? Center(child: LoadingWidget())
            : SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'Favoritos de ${widget.username}',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.primaryDarker),
                              ))
                        ] +
                        _controller.starredRepos!
                            .map((e) => RepoComponent(e))
                            .toList()),
              ),
      );
    });
  }
}
