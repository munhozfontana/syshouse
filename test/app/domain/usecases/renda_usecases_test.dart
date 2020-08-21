import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/domain/entities/renda.dart';
import 'package:syshouse/app/domain/repositories/renda_repository.dart';
import 'package:syshouse/app/domain/usecases/renda_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockRendaRepository extends Mock implements RendaRepository {}

void main() {
  FindRenda findRenda;
  ListRenda listRenda;
  ListPageRenda listPageRenda;
  SaveRenda saveRenda;
  DeleteRenda deleteRenda;
  MockRendaRepository mockRendaRepository;

  var params = Params(
    renda: Renda(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var renda = Renda(id: "1");

  var rendaList = [renda];

  setUp(() {
    mockRendaRepository = MockRendaRepository();
    findRenda = FindRenda(
      rendaRepository: mockRendaRepository,
    );
    listRenda = ListRenda(
      rendaRepository: mockRendaRepository,
    );
    listPageRenda = ListPageRenda(
      rendaRepository: mockRendaRepository,
    );
    saveRenda = SaveRenda(
      rendaRepository: mockRendaRepository,
    );
    deleteRenda = DeleteRenda(
      rendaRepository: mockRendaRepository,
    );
  });

  group("usecase findRenda", () {
    test("should return Right success", () async {
      when(mockRendaRepository.findRenda(params.renda.id))
          .thenAnswer((_) async => Right(renda));

      var result = await findRenda(params);

      expect(result.fold(id, id), isA<Renda>());
    });

    test("should return Left failure", () async {
      when(mockRendaRepository.findRenda(params.renda.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findRenda(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listRenda", () {
    test("should return Right success", () async {
      when(mockRendaRepository.listRenda())
          .thenAnswer((_) async => Right(rendaList));

      var result = await listRenda(noParams);

      expect(result.fold(id, id), isA<List<Renda>>());
    });

    test("should return Left failure", () async {
      when(mockRendaRepository.listRenda())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listRenda(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageRenda", () {
    test("should return Right success", () async {
      when(mockRendaRepository.listPageRenda(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(rendaList));

      var result = await listPageRenda(params);

      expect(result.fold(id, id), isA<List<Renda>>());
    });

    test("should return Left failure", () async {
      when(mockRendaRepository.listPageRenda(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageRenda(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveRenda", () {
    test("should return Right success", () async {
      when(mockRendaRepository.saveRenda(renda))
          .thenAnswer((_) async => Right(renda));

      var result = await saveRenda(params);

      expect(result, Right(renda));
    });
    test("should return Left failure", () async {
      when(mockRendaRepository.saveRenda(renda))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveRenda(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteRenda", () {
    test("should call your repository", () async {
      when(mockRendaRepository.deleteRenda(params.renda.id))
          .thenAnswer((_) async => Right(Renda));

      await deleteRenda(params);

      verify(mockRendaRepository.deleteRenda(params.renda.id)).called(1);
    });

    test("should return Left failure", () async {
      when(mockRendaRepository.deleteRenda(params.renda.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteRenda(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
