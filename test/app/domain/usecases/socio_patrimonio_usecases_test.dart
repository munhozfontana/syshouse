import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/models/socio_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/socio_patrimonio.dart';
import 'package:syshouse/app/domain/repositories/socio_patrimonio_repository.dart';
import 'package:syshouse/app/domain/usecases/socio_patrimonio_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockSocioPatrimonioRepository extends Mock
    implements SocioPatrimonioRepository {}

void main() {
  FindSocioPatrimonio findSocioPatrimonio;
  ListSocioPatrimonio listSocioPatrimonio;
  ListPageSocioPatrimonio listPageSocioPatrimonio;
  SaveSocioPatrimonio saveSocioPatrimonio;
  DeleteSocioPatrimonio deleteSocioPatrimonio;
  MockSocioPatrimonioRepository mockSocioPatrimonioRepository;

  var params = Params(
    socioPatrimonioModel: SocioPatrimonioModel(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var sociopatrimonio = SocioPatrimonio(id: "1");

  var sociopatrimonioList = [sociopatrimonio];

  setUp(() {
    mockSocioPatrimonioRepository = MockSocioPatrimonioRepository();
    findSocioPatrimonio = FindSocioPatrimonio(
      sociopatrimonioRepository: mockSocioPatrimonioRepository,
    );
    listSocioPatrimonio = ListSocioPatrimonio(
      sociopatrimonioRepository: mockSocioPatrimonioRepository,
    );
    listPageSocioPatrimonio = ListPageSocioPatrimonio(
      sociopatrimonioRepository: mockSocioPatrimonioRepository,
    );
    saveSocioPatrimonio = SaveSocioPatrimonio(
      sociopatrimonioRepository: mockSocioPatrimonioRepository,
    );
    deleteSocioPatrimonio = DeleteSocioPatrimonio(
      sociopatrimonioRepository: mockSocioPatrimonioRepository,
    );
  });

  group("usecase findSocioPatrimonio", () {
    test("should return Right success", () async {
      when(mockSocioPatrimonioRepository
              .findSocioPatrimonio(params.socioPatrimonioModel.id))
          .thenAnswer((_) async => Right(sociopatrimonio));

      var result = await findSocioPatrimonio(params);

      expect(result.fold(id, id), isA<SocioPatrimonio>());
    });

    test("should return Left failure", () async {
      when(mockSocioPatrimonioRepository
              .findSocioPatrimonio(params.socioPatrimonioModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findSocioPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listSocioPatrimonio", () {
    test("should return Right success", () async {
      when(mockSocioPatrimonioRepository.listSocioPatrimonio())
          .thenAnswer((_) async => Right(sociopatrimonioList));

      var result = await listSocioPatrimonio(noParams);

      expect(result.fold(id, id), isA<List<SocioPatrimonio>>());
    });

    test("should return Left failure", () async {
      when(mockSocioPatrimonioRepository.listSocioPatrimonio())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listSocioPatrimonio(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageSocioPatrimonio", () {
    test("should return Right success", () async {
      when(mockSocioPatrimonioRepository.listPageSocioPatrimonio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(sociopatrimonioList));

      var result = await listPageSocioPatrimonio(params);

      expect(result.fold(id, id), isA<List<SocioPatrimonio>>());
    });

    test("should return Left failure", () async {
      when(mockSocioPatrimonioRepository.listPageSocioPatrimonio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageSocioPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveSocioPatrimonio", () {
    test("should return Right success", () async {
      when(mockSocioPatrimonioRepository
              .saveSocioPatrimonio(params.socioPatrimonioModel))
          .thenAnswer((_) async => Right(sociopatrimonio));

      var result = await saveSocioPatrimonio(params);

      expect(result, Right(sociopatrimonio));
    });
    test("should return Left failure", () async {
      when(mockSocioPatrimonioRepository
              .saveSocioPatrimonio(params.socioPatrimonioModel))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveSocioPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteSocioPatrimonio", () {
    test("should call your repository", () async {
      when(mockSocioPatrimonioRepository
              .deleteSocioPatrimonio(params.socioPatrimonioModel.id))
          .thenAnswer((_) async => Right(SocioPatrimonio));

      await deleteSocioPatrimonio(params);

      verify(mockSocioPatrimonioRepository
              .deleteSocioPatrimonio(params.socioPatrimonioModel.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockSocioPatrimonioRepository
              .deleteSocioPatrimonio(params.socioPatrimonioModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteSocioPatrimonio(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
