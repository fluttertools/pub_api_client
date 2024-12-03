import 'package:dart_mappable/dart_mappable.dart';

part 'search_results_model.mapper.dart';

/// Base class for results that are paginated
abstract class PaginatedResults<T> {
  /// The current results
  List<T> get results;

  /// The URL to the next page of results
  String? get next;

  const PaginatedResults();
}

/// Search Results Model
@MappableClass()
class SearchResults extends PaginatedResults<PackageResult>
    with SearchResultsMappable {
  final List<PackageResult> packages;

  @override
  List<PackageResult> get results => packages;

  @override
  final String? next;

  const SearchResults({
    required this.packages,
    this.next,
  });

  static const fromMap = SearchResultsMapper.fromMap;
  static const fromJson = SearchResultsMapper.fromJson;
}

/// Package Result Model returns within a `SearchResult`
@MappableClass()
class PackageResult with PackageResultMappable {
  final String package;
  const PackageResult({required this.package});

  static const fromMap = PackageResultMapper.fromMap;
  static const fromJson = PackageResultMapper.fromJson;
}
