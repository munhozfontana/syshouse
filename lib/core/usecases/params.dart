import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../app/domain/entities/tipo_renda.dart';

class Params extends Equatable {
  final TipoRenda tipoRenda;
  final Pagination pagination;

  Params({this.tipoRenda, this.pagination});

  @override
  List<Object> get props => [
        tipoRenda,
        pagination,
      ];
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class Pagination {
  int page;
  int size;

  Pagination({
    @required this.page,
    @required this.size,
  });
}
