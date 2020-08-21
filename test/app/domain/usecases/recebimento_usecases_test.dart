import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/domain/entities/recebimento.dart';
import 'package:syshouse/app/domain/repositories/recebimento_repository.dart';
import 'package:syshouse/app/domain/usecases/recebimento_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockRecebimentoRepository extends Mock implements RecebimentoRepository {}

void main() {
  FindRecebimento findRecebimento;
  ListRecebimento listRecebimento;
  ListPageRecebimento listPageRecebimento;
  SaveRecebimento saveRecebimento;
  DeleteRecebimento deleteRecebimento;
  MockRecebimentoRepository mockRecebimentoRepository;

  var params = Params(
    recebimento: Recebimento(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var recebimento = Recebimento(id: "1");

  var recebimentoList = [recebimento];

  setUp(() {
    mockRecebimentoRepository = MockRecebimentoRepository();
    findRecebimento = FindRecebimento(
      recebimentoRepository: mockRecebimentoRepository,
    );
    listRecebimento = ListRecebimento(
      recebimentoRepository: mockRecebimentoRepository,
    );
    listPageRecebimento = ListPageRecebimento(
      recebimentoRepository: mockRecebimentoRepository,
    );
    saveRecebimento = SaveRecebimento(
      recebimentoRepository: mockRecebimentoRepository,
    );
    deleteRecebimento = DeleteRecebimento(
      recebimentoRepository: mockRecebimentoRepository,
    );
  });

  group("usecase findRecebimento", () {
    test("should return Right success", () async {
      when(mockRecebimentoRepository.findRecebimento(params.recebimento.id))
          .thenAnswer((_) async => Right(recebimento));

      var result = await findRecebimento(params);

      expect(result.fold(id, id), isA<Recebimento>());
    });

    test("should return Left failure", () async {
      when(mockRecebimentoRepository.findRecebimento(params.recebimento.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findRecebimento(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listRecebimento", () {
    test("should return Right success", () async {
      when(mockRecebimentoRepository.listRecebimento())
          .thenAnswer((_) async => Right(recebimentoList));

      var result = await listRecebimento(noParams);

      expect(result.fold(id, id), isA<List<Recebimento>>());
    });

    test("should return Left failure", () async {
      when(mockRecebimentoRepository.listRecebimento())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listRecebimento(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageRecebimento", () {
    test("should return Right success", () async {
      when(mockRecebimentoRepository.listPageRecebimento(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(recebimentoList));

      var result = await listPageRecebimento(params);

      expect(result.fold(id, id), isA<List<Recebimento>>());
    });

    test("should return Left failure", () async {
      when(mockRecebimentoRepository.listPageRecebimento(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageRecebimento(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveRecebimento", () {
    test("should return Right success", () async {
      when(mockRecebimentoRepository.saveRecebimento(recebimento))
          .thenAnswer((_) async => Right(recebimento));

      var result = await saveRecebimento(params);

      expect(result, Right(recebimento));
    });
    test("should return Left failure", () async {
      when(mockRecebimentoRepository.saveRecebimento(recebimento))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveRecebimento(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteRecebimento", () {
    test("should call your repository", () async {
      when(mockRecebimentoRepository.deleteRecebimento(params.recebimento.id))
          .thenAnswer((_) async => Right(Recebimento));

      await deleteRecebimento(params);

      verify(mockRecebimentoRepository.deleteRecebimento(params.recebimento.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockRecebimentoRepository.deleteRecebimento(params.recebimento.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteRecebimento(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
