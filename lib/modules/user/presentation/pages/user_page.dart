import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:picsel_github/modules/user/presentation/components/repo_component.dart';
import 'package:picsel_github/core/components/base_scaffold.dart';
import 'package:picsel_github/core/components/loading_widget.dart';
import 'package:picsel_github/modules/user/presentation/components/user_component.dart';
import 'package:picsel_github/modules/user/presentation/controller/user_controller.dart';

class UserPage extends StatefulWidget {
  final String? username;
  const UserPage(this.username);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _controller = Modular.get<UserController>();
  @override
  void initState() {
    if (widget.username != null) _controller.username = widget.username!;
    Future.delayed(Duration.zero, (() async => await _controller.getUser()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SafeArea(
        child: Observer(builder: (context) {
          if (_controller.user == null)
            return Center(child: LoadingWidget());
          else
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                UserComponent(_controller.user!),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: Column(
                      children: _controller.user!.repos
                          .map((e) => RepoComponent(e))
                          .toList(),
                    ),
                  ),
                )
              ],
            );
        }),
      ),
    );
  }
}
