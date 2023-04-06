import 'package:flutter/material.dart';
import 'package:picsel_github/core/components/base_scaffold.dart';
import 'package:picsel_github/core/components/default_text_field.dart';
import 'package:picsel_github/core/components/loading_widget.dart';
import 'package:picsel_github/core/enums/app_states.dart';
import 'package:picsel_github/core/theme/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/core/theme/icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:picsel_github/modules/search/presentation/components/search_result_component.dart';
import 'package:picsel_github/modules/search/presentation/controller/search_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = Modular.get<SearchController>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            DefaultTextField(
              onchanged: (value) {
                _controller.text = value;
              },
              style: TextStyle(color: AppColors.primary),
              textInputAction: TextInputAction.done,
              onEditingComplete:
                  _controller.text != null && _controller.text!.isNotEmpty
                      ? () {
                          _controller.search();
                        }
                      : null,
              fillColor: AppColors.secondary,
              suffixIcon: Observer(builder: (context) {
                return InkWell(
                  onTap:
                      _controller.text != null && _controller.text!.isNotEmpty
                          ? () {
                              _controller.search();
                            }
                          : null,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      AppIcons.search,
                      color: AppColors.primary.withOpacity(.3),
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }),
            ),
            Observer(builder: (context) {
              if (_controller.searchState == AppStatesEnum.loading)
                return LoadingWidget();
              if (_controller.searchState == AppStatesEnum.loaded &&
                  _controller.searchResults.isEmpty)
                return Text(
                  'Não há resultados para esta busca',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                );
              if (_controller.searchState == AppStatesEnum.loaded &&
                  _controller.searchResults.isNotEmpty)
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[SizedBox(height: 10)] +
                          _controller.searchResults
                              .map(
                                  (e) => SearchResultComponent(searchResult: e))
                              .toList(),
                    ),
                  ),
                );
              else
                return Container();
            })
          ],
        ),
      ),
    );
  }
}
