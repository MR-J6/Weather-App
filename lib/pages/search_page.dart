import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_remake/components/countries_list.dart';
import 'package:weather_app_remake/pages/weather_info_page.dart';
import 'search/models/country_model.dart';
import 'search/widgets/search_field.dart';
import 'search/widgets/country_tile.dart';
import 'search/widgets/header_tile.dart';
import 'search/widgets/index_bar.dart';
import 'search/utils/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<CountryModel> _displayList;
  late List<CountryModel> _allCountries;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializeCountries();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _initializeCountries() {
    _allCountries = countriesList
        .map((name) => CountryModel(name: name))
        .toList();
    _allCountries.sort((a, b) {
      final tagComparison = a.tag.compareTo(b.tag);
      return tagComparison == 0 ? a.name.compareTo(b.name) : tagComparison;
    });
    setState(() => _displayList = List<CountryModel>.from(_allCountries));
  }

  void _filterCountries(String query) {
    if (query.isEmpty) {
      setState(() => _displayList = List<CountryModel>.from(_allCountries));
      return;
    }

    final filtered = _allCountries
        .where(
          (country) => country.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    setState(() => _displayList = filtered);
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return ;
      },
      child: Scaffold(
        backgroundColor: SearchPageConstants.backgroundColor,
        body: Column(
          children: [
            const SizedBox(height: 25),
            SearchField(onChanged: _filterCountries),
            Expanded(
              child: Stack(
                children: [
                  _buildCountriesList(),
                  IndexBar(
                    letters: _getUniqueLetters(),
                    onDrag: _handleIndexDrag,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountriesList() {
    return ListView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      children: _buildGroupedCountries(),
    );
  }

  List<Widget> _buildGroupedCountries() {
    final widgets = <Widget>[];
    String? currentTag;

    for (final country in _displayList) {
      if (country.tag != currentTag) {
        currentTag = country.tag;
        widgets.add(HeaderTile(tag: currentTag));
      }
      widgets.add(
        CountryTile(
          country: country,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    WeatherInfoPage(countryName: country.name),
              ),
            );
          },
        ),
      );
    }

    return widgets;
  }

  List<String> _getUniqueLetters() {
    final letters = _displayList.map((c) => c.tag).toSet().toList();
    return letters..sort();
  }

  void _handleIndexDrag(Offset globalPosition, List<String> letters) {
    if (letters.isEmpty || _displayList.isEmpty) return;

    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return;

    final listViewY = box.localToGlobal(Offset.zero).dy;
    final relativeY =
        globalPosition.dy -
        listViewY -
        SearchPageConstants.searchAndPaddingHeight;
    final expandedHeight =
        box.size.height - SearchPageConstants.searchAndPaddingHeight;
    final itemHeight = expandedHeight / letters.length;
    final index = (relativeY / itemHeight)
        .clamp(0.0, letters.length - 1.0)
        .toInt();

    if (index >= 0 && index < letters.length) {
      _scrollToLetter(letters[index]);
    }
  }

  void _scrollToLetter(String letter) {
    int headerCount = 0;
    int itemCount = 0;
    String? lastTag;

    for (final country in _displayList) {
      if (country.tag == letter) break;

      if (country.tag != lastTag) {
        headerCount++;
        lastTag = country.tag;
      }
      itemCount++;
    }

    final offset =
        (headerCount * SearchPageConstants.headerHeight) +
        (itemCount * SearchPageConstants.itemHeight);

    _scrollController.animateTo(
      offset,
      duration: SearchPageConstants.scrollDuration,
      curve: Curves.easeInOut,
    );
  }
}