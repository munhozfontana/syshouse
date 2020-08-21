import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/domain/entities/tipo_patrimonio.dart';
import 'package:syshouse/app/domain/repositories/tipo_patrimonio_repository.dart';
import 'package:syshouse/app/domain/usecases/tipo_patrimonio_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockTipoPatrimonioRepository extends Mock
    implements TipoPatrimonioRepository {}

void main() {
  FindTipoPatrimonio findTipoPatrimonio;
  ListTipoPatrimonio listTipoPatrimonio;
  ListPageTipoPatrimonio listPageTipoPatrimonio;
  SaveTipoPatrimonio saveTipoPatrimonio;
  DeleteTipoPatrimonio deleteTipoPatrimonio;
  MockTipoPatrimonioRepository mockTipoPatrimonioRepository;

  var params = Params(
    tipoPatrimonio: TipoPatrimonio(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var tipoPatrimonio = TipoPatrimonio(id: "1");

  var tipoPatrimonioList = [tipoPatrimonio];

  setUp(() {
    mockTipoPatrimonioRepository = MockTipoPatrimonioRepository();
    findTipoPatrimonio = FindTipoPatrimonio(
      tipoPatrimonioRepository: mockTipoPatrimonioRepository,
    );
    listTipoPatrimonio = ListTipoPatrimonio(
      tipoPatrimonioRepository: mockTipoPatrimonioRepository,
    );
    listPageTipoPatrimonio = ListPageTipoPatrimonio(
      tipoPatrimonioRepository: mockTipoPatrimonioRepository,
    );
    saveTipoPatrimonio = SaveTipoPatrimonio(
      tipoPatrimonioRepository: mockTipoPatrimonioRepository,
    );
    deleteTipoPatrimonio = DeleteTipoPatrimonio(
      tipoPatrimonioRepository: mockTipoPatrimonioRepository,
    );
  });

  group("usecase findTipoPatrimonio", () {
    test("should return Right success", () async {
      when(mockTipoPatrimonioRepository
              .findTipoPatrimonio(params.tipoPatrimonio.id))
          .thenAnswer((_) async => Right(tipoPatrimonio));

      var result = await findTipoPatrimonio(params);

      expect(result.fold(id, id), isA<TipoPatrimonio>());
    });

    test("should return Left failure", () async {
      when(mockTipoPatrimonioRepository
              .findTipoPatrimonio(params.tipoPatrimonio.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findTipoPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listTipoPatrimonio", () {
    test("should return Right success", () async {
      when(mockTipoPatrimonioRepository.listTipoPatrimonio())
          .thenAnswer((_) async => Right(tipoPatrimonioList));

      var result = await listTipoPatrimonio(noParams);

      expect(result.fold(id, id), isA<List<TipoPatrimonio>>());
    });

    test("should return Left failure", () async {
      when(mockTipoPatrimonioRepository.listTipoPatrimonio())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listTipoPatrimonio(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageTipoPatrimonio", () {
    test("should return Right success", () async {
      when(mockTipoPatrimonioRepository.listPageTipoPatrimonio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(tipoPatrimonioList));

      var result = await listPageTipoPatrimonio(params);

      expect(result.fold(id, id), isA<List<TipoPatrimonio>>());
    });

    test("should return Left failure", () async {
      when(mockTipoPatrimonioRepository.listPageTipoPatrimonio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageTipoPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveTipoPatrimonio", () {
    test("should return Right success", () async {
      when(mockTipoPatrimonioRepository.saveTipoPatrimonio(tipoPatrimonio))
          .thenAnswer((_) async => Right(tipoPatrimonio));

      var result = await saveTipoPatrimonio(params);

      expect(result, Right(tipoPatrimonio));
    });
    test("should return Left failure", () async {
      when(mockTipoPatrimonioRepository.saveTipoPatrimonio(tipoPatrimonio))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveTipoPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteTipoPatrimonio", () {
    test("should call your repository", () async {
      when(mockTipoPatrimonioRepository
              .deleteTipoPatrimonio(params.tipoPatrimonio.id))
          .thenAnswer((_) async => Right(tipoPatrimonio));

      await deleteTipoPatrimonio(params);

      verify(mockTipoPatrimonioRepository
              .deleteTipoPatrimonio(params.tipoPatrimonio.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockTipoPatrimonioRepository
              .deleteTipoPatrimonio(params.tipoPatrimonio.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteTipoPatrimonio(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
