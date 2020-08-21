import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/domain/entities/recebimento_patrimonio.dart';
import 'package:syshouse/app/domain/repositories/recebimento_patrimonio_repository.dart';
import 'package:syshouse/app/domain/usecases/recebimento_patrimonio_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockRecebimentoPatrimonioRepository extends Mock
    implements RecebimentoPatrimonioRepository {}

void main() {
  FindRecebimentoPatrimonio findRecebimentoPatrimonio;
  ListRecebimentoPatrimonio listRecebimentoPatrimonio;
  ListPageRecebimentoPatrimonio listPageRecebimentoPatrimonio;
  SaveRecebimentoPatrimonio saveRecebimentoPatrimonio;
  DeleteRecebimentoPatrimonio deleteRecebimentoPatrimonio;
  MockRecebimentoPatrimonioRepository mockRecebimentoPatrimonioRepository;

  var params = Params(
    recebimentopatrimonio: RecebimentoPatrimonio(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var recebimentopatrimonio = RecebimentoPatrimonio(id: "1");

  var recebimentopatrimonioList = [recebimentopatrimonio];

  setUp(() {
    mockRecebimentoPatrimonioRepository = MockRecebimentoPatrimonioRepository();
    findRecebimentoPatrimonio = FindRecebimentoPatrimonio(
      recebimentopatrimonioRepository: mockRecebimentoPatrimonioRepository,
    );
    listRecebimentoPatrimonio = ListRecebimentoPatrimonio(
      recebimentopatrimonioRepository: mockRecebimentoPatrimonioRepository,
    );
    listPageRecebimentoPatrimonio = ListPageRecebimentoPatrimonio(
      recebimentopatrimonioRepository: mockRecebimentoPatrimonioRepository,
    );
    saveRecebimentoPatrimonio = SaveRecebimentoPatrimonio(
      recebimentopatrimonioRepository: mockRecebimentoPatrimonioRepository,
    );
    deleteRecebimentoPatrimonio = DeleteRecebimentoPatrimonio(
      recebimentopatrimonioRepository: mockRecebimentoPatrimonioRepository,
    );
  });

  group("usecase findRecebimentoPatrimonio", () {
    test("should return Right success", () async {
      when(mockRecebimentoPatrimonioRepository
              .findRecebimentoPatrimonio(params.recebimentopatrimonio.id))
          .thenAnswer((_) async => Right(recebimentopatrimonio));

      var result = await findRecebimentoPatrimonio(params);

      expect(result.fold(id, id), isA<RecebimentoPatrimonio>());
    });

    test("should return Left failure", () async {
      when(mockRecebimentoPatrimonioRepository
              .findRecebimentoPatrimonio(params.recebimentopatrimonio.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findRecebimentoPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listRecebimentoPatrimonio", () {
    test("should return Right success", () async {
      when(mockRecebimentoPatrimonioRepository.listRecebimentoPatrimonio())
          .thenAnswer((_) async => Right(recebimentopatrimonioList));

      var result = await listRecebimentoPatrimonio(noParams);

      expect(result.fold(id, id), isA<List<RecebimentoPatrimonio>>());
    });

    test("should return Left failure", () async {
      when(mockRecebimentoPatrimonioRepository.listRecebimentoPatrimonio())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listRecebimentoPatrimonio(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageRecebimentoPatrimonio", () {
    test("should return Right success", () async {
      when(mockRecebimentoPatrimonioRepository.listPageRecebimentoPatrimonio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(recebimentopatrimonioList));

      var result = await listPageRecebimentoPatrimonio(params);

      expect(result.fold(id, id), isA<List<RecebimentoPatrimonio>>());
    });

    test("should return Left failure", () async {
      when(mockRecebimentoPatrimonioRepository.listPageRecebimentoPatrimonio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageRecebimentoPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveRecebimentoPatrimonio", () {
    test("should return Right success", () async {
      when(mockRecebimentoPatrimonioRepository
              .saveRecebimentoPatrimonio(recebimentopatrimonio))
          .thenAnswer((_) async => Right(recebimentopatrimonio));

      var result = await saveRecebimentoPatrimonio(params);

      expect(result, Right(recebimentopatrimonio));
    });
    test("should return Left failure", () async {
      when(mockRecebimentoPatrimonioRepository
              .saveRecebimentoPatrimonio(recebimentopatrimonio))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveRecebimentoPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteRecebimentoPatrimonio", () {
    test("should call your repository", () async {
      when(mockRecebimentoPatrimonioRepository
              .deleteRecebimentoPatrimonio(params.recebimentopatrimonio.id))
          .thenAnswer((_) async => Right(RecebimentoPatrimonio));

      await deleteRecebimentoPatrimonio(params);

      verify(mockRecebimentoPatrimonioRepository
              .deleteRecebimentoPatrimonio(params.recebimentopatrimonio.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockRecebimentoPatrimonioRepository
              .deleteRecebimentoPatrimonio(params.recebimentopatrimonio.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteRecebimentoPatrimonio(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
