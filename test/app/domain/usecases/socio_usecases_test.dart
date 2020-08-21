import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/domain/entities/socio.dart';
import 'package:syshouse/app/domain/repositories/socio_repository.dart';
import 'package:syshouse/app/domain/usecases/socio_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockSocioRepository extends Mock implements SocioRepository {}

void main() {
  FindSocio findSocio;
  ListSocio listSocio;
  ListPageSocio listPageSocio;
  SaveSocio saveSocio;
  DeleteSocio deleteSocio;
  MockSocioRepository mockSocioRepository;

  var params = Params(
    socio: Socio(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var socio = Socio(id: "1");

  var socioList = [socio];

  setUp(() {
    mockSocioRepository = MockSocioRepository();
    findSocio = FindSocio(
      socioRepository: mockSocioRepository,
    );
    listSocio = ListSocio(
      socioRepository: mockSocioRepository,
    );
    listPageSocio = ListPageSocio(
      socioRepository: mockSocioRepository,
    );
    saveSocio = SaveSocio(
      socioRepository: mockSocioRepository,
    );
    deleteSocio = DeleteSocio(
      socioRepository: mockSocioRepository,
    );
  });

  group("usecase findSocio", () {
    test("should return Right success", () async {
      when(mockSocioRepository.findSocio(params.socio.id))
          .thenAnswer((_) async => Right(socio));

      var result = await findSocio(params);

      expect(result.fold(id, id), isA<Socio>());
    });

    test("should return Left failure", () async {
      when(mockSocioRepository.findSocio(params.socio.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findSocio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listSocio", () {
    test("should return Right success", () async {
      when(mockSocioRepository.listSocio())
          .thenAnswer((_) async => Right(socioList));

      var result = await listSocio(noParams);

      expect(result.fold(id, id), isA<List<Socio>>());
    });

    test("should return Left failure", () async {
      when(mockSocioRepository.listSocio())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listSocio(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageSocio", () {
    test("should return Right success", () async {
      when(mockSocioRepository.listPageSocio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(socioList));

      var result = await listPageSocio(params);

      expect(result.fold(id, id), isA<List<Socio>>());
    });

    test("should return Left failure", () async {
      when(mockSocioRepository.listPageSocio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageSocio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveSocio", () {
    test("should return Right success", () async {
      when(mockSocioRepository.saveSocio(socio))
          .thenAnswer((_) async => Right(socio));

      var result = await saveSocio(params);

      expect(result, Right(socio));
    });
    test("should return Left failure", () async {
      when(mockSocioRepository.saveSocio(socio))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveSocio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteSocio", () {
    test("should call your repository", () async {
      when(mockSocioRepository.deleteSocio(params.socio.id))
          .thenAnswer((_) async => Right(Socio));

      await deleteSocio(params);

      verify(mockSocioRepository.deleteSocio(params.socio.id)).called(1);
    });

    test("should return Left failure", () async {
      when(mockSocioRepository.deleteSocio(params.socio.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteSocio(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
