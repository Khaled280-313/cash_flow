// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cash_flow/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  late List<SearchFieldListItem<Search>> suggestions;
  SearchFieldListItem<Search>? selectedValue;

  @override
  void initState() {
    suggestions = [
      Search(name: 'Food'),
      Search(name: 'Transport'),
      Search(name: 'Utilities'),
      Search(name: 'Entertainment'),
      Search(name: 'Health'),
      Search(name: 'Education'),
    ].map((Search item) {
      return SearchFieldListItem<Search>(
        item.name,
        item: item,
        child: Text(item.name),
      );
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Ensure selectedValue is either null or present in suggestions
    if (selectedValue != null && !suggestions.contains(selectedValue)) {
      selectedValue = null;
    }
    return SafeArea(
      child: SizedBox(
        width: 370, // Set a fixed width to avoid overflow
        // Set a fixed width to avoid overflow
        child: SearchField(
          // emptyWidget: const Text(
          //   AppStrings.noResultsFound,
          //   style: TextStyle(color: Colors.grey),
          // ),
          textInputAction: TextInputAction.search,
          searchInputDecoration: SearchInputDecoration(
            textCapitalization: TextCapitalization.words,
            searchStyle: const TextStyle(fontSize: 16, color: Colors.black),
            cursorColor: Colors.black,
            cursorHeight: 20,
            cursorWidth: 2,
            hintText: 'Search for an expense',
            fillColor: AppColor.white,
            filled: true,
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.filter_list_outlined)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColor.black),
            ),
          ),
          suggestionsDecoration: SuggestionDecoration(
            itemPadding: EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(8),
            color: AppColor.white,
            elevation: 2,
            padding: const EdgeInsets.all(10),
            border: Border.all(color: Colors.grey.shade300, width: 1.0),
          ),
          suggestions: suggestions,
          hint: 'Search for an expense',
          dynamicHeight: true,
          animationDuration: const Duration(milliseconds: 500),
          maxSuggestionBoxHeight: 500,
          suggestionState: Suggestion.expand,
          onSuggestionTap: (SearchFieldListItem<Search> suggestion) {
            setState(() {
              selectedValue = suggestion;
            });
          },
          onSearchTextChanged: (searchText) {
            if (searchText.isEmpty) {
              return suggestions;
            }
            // filter the list with your custom search logic
            final filter = List<SearchFieldListItem<Search>>.from(suggestions)
                .where((search) {
              return search.item!.name
                  .toLowerCase()
                  .contains(searchText.toLowerCase());
            }).toList();
            return filter;
          },
          selectedValue: selectedValue,
        ),
      ),
    );
  }
}

class Search {
  final String name;
  Search({
    required this.name,
  });
}
