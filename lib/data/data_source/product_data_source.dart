import 'dart:convert';
import 'package:apple_market/core/exceptions/product_data_exceptions.dart';
import 'package:flutter/services.dart';

import '../../app/constants/app_constants.dart';
import '../dto/product_dto.dart';

class ProductDataSource {
  Future<List<ProductDto>> loadProductData() async {
    try {
      final csvData = await rootBundle.loadString(AppConstants.csvDataPath);
      final productRows = _extractDataRows(csvData);
      return _convertToProductDtos(productRows);
    } catch (error) {
      throw const ProductDataException();
    }
  }

  List<String> _extractDataRows(String csvContent) {
    final allLines = LineSplitter().convert(csvContent);
    // Skip header rows and return data
    return allLines.skip(2).toList();
  }

  List<ProductDto> _convertToProductDtos(List<String> dataRows) {
    return dataRows.map((row) {
      final columns = _parseRowColumns(row);
      return ProductDto.fromCsvColumns(columns);
    }).toList();
  }

  List<String> _parseRowColumns(String row) {
    List<String> columns = [];
    StringBuffer currentColumn = StringBuffer();
    bool withinQuotes = false;

    for (int i = 0; i < row.length; i++) {
      String character = row[i];

      if (character == '"') {
        withinQuotes = !withinQuotes;
      } else if (character == ',' && !withinQuotes) {
        columns.add(_cleanColumnText(currentColumn.toString()));
        currentColumn.clear();
      } else {
        currentColumn.write(character);
      }
    }

    // Add final column
    columns.add(_cleanColumnText(currentColumn.toString()));
    return columns;
  }

  String _cleanColumnText(String text) {
    return text
        .replaceAll(RegExp(r'\\n\s*\+\s*'), '\n')
        .replaceAll(RegExp(r'\s*\+\s*'), '')
        .replaceAll('\\n', '\n')
        .trim();
  }
}
