import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/bloc/app_data/app_data_cubit.dart';
import 'package:gts_learn/presentation/feature/dictionary/cubit/dictionary_cubit.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DictionaryCubit, DictionaryState>(
      listener: (context, state) => state.maybeWhen(
        failure: () => _onFailure(context),
        orElse: () => null,
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const AppLoading(),
        idle: _DictionaryPageBody.new,
        orElse: () => const SizedBox(),
      ),
    );
  }

  void _onFailure(BuildContext context) {}
}

class _DictionaryPageBody extends StatelessWidget {
  const _DictionaryPageBody(this.searchPhrase);

  final String searchPhrase;

  @override
  Widget build(BuildContext context) {
    final words = context.read<AppDataCubit>().getLessonsWords();
    final uniqueWords = context.read<DictionaryCubit>().getUniqueWords(
          words,
          searchPhrase,
        );

    return BlocBuilder<AppDataCubit, AppDataState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.d16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.str.dictionary__dictionary,
                style: appTextTheme().headline3,
              ),
              const SizedBox(height: AppDimens.d12),
              Text(context.str.dictionary__search),
              const SizedBox(height: AppDimens.d20),
              SizedBox(
                height: AppDimens.dictionarySearchFieldHeight,
                child: TextField(
                  onChanged: (value) => _onSearchFieldChanged(context, value),
                  decoration: InputDecoration(
                    hintText: context.str.dictionary__hint_text,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: AppDimens.d8),
                      child: Icon(
                        AppIcons.search,
                        size: AppDimens.iconSizeLarge,
                      ),
                    ),
                  ),
                ),
              ),
              AppSpacers.h20,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ..._buildDictionaryEntries(
                        context,
                        uniqueWords,
                        searchPhrase,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _onSearchFieldChanged(
    BuildContext context,
    String value,
  ) async =>
      context.read<DictionaryCubit>().updateSearchPhrase(value);

  List<Widget> _buildDictionaryEntries(
    BuildContext context,
    List<WordEntity> words,
    String searchPhrase,
  ) {
    final dictionaryList = <Widget>[];
    words.sort((a, b) => a.name.compareTo(b.name));
    final letters = words.map((e) => e.name[0]).toSet();
    for (final letter in letters) {
      dictionaryList.addAll([
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.d8),
          child: Text(
            letter,
            style: appTextTheme().headline3,
          ),
        ),
      ]);
      final wordsWithLetter = words.where((e) => e.name.startsWith(letter));
      dictionaryList.addAll(
        wordsWithLetter.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.d10),
            child: EasyRichText(
              e.name,
              patternList: [
                EasyRichTextPattern(
                  targetString: searchPhrase,
                  matchWordBoundaries: false,
                  style: appTextTheme().bodyText1,
                ),
                EasyRichTextPattern(
                  targetString: searchPhrase.isNotEmpty
                      ? searchPhrase[0].toUpperCase() +
                          searchPhrase.substring(1).toLowerCase()
                      : '',
                  matchWordBoundaries: false,
                  style: appTextTheme().bodyText1,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return dictionaryList;
  }
}
