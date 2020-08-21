import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/domain/entities/despesa.dart';
import 'package:syshouse/app/domain/repositories/despesa_repository.dart';
import 'package:syshouse/app/domain/usecases/despesa_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockDespesaRepository extends Mock implements DespesaRepository {}

void main() {
  FindDespesa findDespesa;
  ListDespesa listDespesa;
  ListPageDespesa listPageDespesa;
  SaveDespesa saveDespesa;
  DeleteDespesa deleteDespesa;
  MockDespesaRepository mockDespesaRepository;

  var params = Params(
    despesa: Despesa(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var despesa = Despesa(id: "1");

  var despesaList = [despesa];

  setUp(() {
    mockDespesaRepository = MockDespesaRepository();
    findDespesa = FindDespesa(
      despesaRepository: mockDespesaRepository,
    );
    listDespesa = ListDespesa(
      despesaRepository: mockDespesaRepository,
    );
    listPageDespesa = ListPageDespesa(
      despesaRepository: mockDespesaRepository,
    );
    saveDespesa = SaveDespesa(
      despesaRepository: mockDespesaRepository,
    );
    deleteDespesa = DeleteDespesa(
      despesaRepository: mockDespesaRepository,
    );
  });

  group("usecase findDespesa", () {
    test("should return Right success", () async {
      when(mockDespesaRepository.findDespesa(params.despesa.id))
          .thenAnswer((_) async => Right(despesa));

      var result = await findDespesa(params);

      expect(result.fold(id, id), isA<Despesa>());
    });

    test("should return Left failure", () async {
      when(mockDespesaRepository.findDespesa(params.despesa.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findDespesa(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listDespesa", () {
    test("should return Right success", () async {
      when(mockDespesaRepository.listDespesa())
          .thenAnswer((_) async => Right(despesaList));

      var result = await listDespesa(noParams);

      expect(result.fold(id, id), isA<List<Despesa>>());
    });

    test("should return Left failure", () async {
      when(mockDespesaRepository.listDespesa())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listDespesa(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageDespesa", () {
    test("should return Right success", () async {
      when(mockDespesaRepository.listPageDespesa(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(despesaList));

      var result = await listPageDespesa(params);

      expect(result.fold(id, id), isA<List<Despesa>>());
    });

    test("should return Left failure", () async {
      when(mockDespesaRepository.listPageDespesa(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageDespesa(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveDespesa", () {
    test("should return Right success", () async {
      when(mockDespesaRepository.saveDespesa(despesa))
          .thenAnswer((_) async => Right(despesa));

      var result = await saveDespesa(params);

      expect(result, Right(despesa));
    });
    test("should return Left failure", () async {
      when(mockDespesaRepository.saveDespesa(despesa))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveDespesa(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteDespesa", () {
    test("should call your repository", () async {
      when(mockDespesaRepository.deleteDespesa(params.despesa.id))
          .thenAnswer((_) async => Right(Despesa));

      await deleteDespesa(params);

      verify(mockDespesaRepository.deleteDespesa(params.despesa.id)).called(1);
    });

    test("should return Left failure", () async {
      when(mockDespesaRepository.deleteDespesa(params.despesa.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteDespesa(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
