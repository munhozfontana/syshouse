import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/models/tipo_renda_model.dart';
import 'package:syshouse/app/domain/entities/tipo_renda.dart';
import 'package:syshouse/app/domain/repositories/tipo_renda_repository.dart';
import 'package:syshouse/app/domain/usecases/tipo_renda_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockTipoRendaRepository extends Mock implements TipoRendaRepository {}

void main() {
  FindTipoRenda findTipoRenda;
  ListTipoRenda listTipoRenda;
  ListPageTipoRenda listPageTipoRenda;
  SaveTipoRenda saveTipoRenda;
  DeleteTipoRenda deleteTipoRenda;
  MockTipoRendaRepository mockTipoRendaRepository;

  var params = Params(
    tipoRendaModel: TipoRendaModel(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var tipoRenda = TipoRenda(id: "1");

  var tipoRendaList = [tipoRenda];

  setUp(() {
    mockTipoRendaRepository = MockTipoRendaRepository();
    findTipoRenda = FindTipoRenda(
      tipoRendaRepository: mockTipoRendaRepository,
    );
    listTipoRenda = ListTipoRenda(
      tipoRendaRepository: mockTipoRendaRepository,
    );
    listPageTipoRenda = ListPageTipoRenda(
      tipoRendaRepository: mockTipoRendaRepository,
    );
    saveTipoRenda = SaveTipoRenda(
      tipoRendaRepository: mockTipoRendaRepository,
    );
    deleteTipoRenda = DeleteTipoRenda(
      tipoRendaRepository: mockTipoRendaRepository,
    );
  });

  group("usecase findTipoRenda", () {
    test("should return Right success", () async {
      when(mockTipoRendaRepository.findTipoRenda(params.tipoRendaModel.id))
          .thenAnswer((_) async => Right(tipoRenda));

      var result = await findTipoRenda(params);

      expect(result.fold(id, id), isA<TipoRenda>());
    });

    test("should return Left failure", () async {
      when(mockTipoRendaRepository.findTipoRenda(params.tipoRendaModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findTipoRenda(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listTipoRenda", () {
    test("should return Right success", () async {
      when(mockTipoRendaRepository.listTipoRenda())
          .thenAnswer((_) async => Right(tipoRendaList));

      var result = await listTipoRenda(noParams);

      expect(result.fold(id, id), isA<List<TipoRenda>>());
    });

    test("should return Left failure", () async {
      when(mockTipoRendaRepository.listTipoRenda())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listTipoRenda(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageTipoRenda", () {
    test("should return Right success", () async {
      when(mockTipoRendaRepository.listPageTipoRenda(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(tipoRendaList));

      var result = await listPageTipoRenda(params);

      expect(result.fold(id, id), isA<List<TipoRenda>>());
    });

    test("should return Left failure", () async {
      when(mockTipoRendaRepository.listPageTipoRenda(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageTipoRenda(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveTipoRenda", () {
    test("should return Right success", () async {
      when(mockTipoRendaRepository.saveTipoRenda(params.tipoRendaModel))
          .thenAnswer((_) async => Right(tipoRenda));

      var result = await saveTipoRenda(params);

      expect(result, Right(tipoRenda));
    });
    test("should return Left failure", () async {
      when(mockTipoRendaRepository.saveTipoRenda(params.tipoRendaModel))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveTipoRenda(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteTipoRenda", () {
    test("should call your repository", () async {
      when(mockTipoRendaRepository.deleteTipoRenda(params.tipoRendaModel.id))
          .thenAnswer((_) async => Right(tipoRenda));

      await deleteTipoRenda(params);

      verify(mockTipoRendaRepository.deleteTipoRenda(params.tipoRendaModel.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockTipoRendaRepository.deleteTipoRenda(params.tipoRendaModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteTipoRenda(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
