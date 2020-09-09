import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/domain/entities/municipio.dart';
import 'package:syshouse/app/domain/repositories/municipio_repository.dart';
import 'package:syshouse/app/domain/usecases/municipio_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockMunicipioRepository extends Mock implements MunicipioRepository {}

void main() {
  FindMunicipio findMunicipio;
  ListMunicipio listMunicipio;
  ListPageMunicipio listPageMunicipio;
  SaveMunicipio saveMunicipio;
  DeleteMunicipio deleteMunicipio;
  MockMunicipioRepository mockMunicipioRepository;

  var params = Params(
    municipioModel: MunicipioModel(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var municipio = Municipio(id: "1");

  var municipioList = [municipio];

  setUp(() {
    mockMunicipioRepository = MockMunicipioRepository();
    findMunicipio = FindMunicipio(
      municipioRepository: mockMunicipioRepository,
    );
    listMunicipio = ListMunicipio(
      municipioRepository: mockMunicipioRepository,
    );
    listPageMunicipio = ListPageMunicipio(
      municipioRepository: mockMunicipioRepository,
    );
    saveMunicipio = SaveMunicipio(
      municipioRepository: mockMunicipioRepository,
    );
    deleteMunicipio = DeleteMunicipio(
      municipioRepository: mockMunicipioRepository,
    );
  });

  group("usecase findMunicipio", () {
    test("should return Right success", () async {
      when(mockMunicipioRepository.findMunicipio(params.municipioModel.id))
          .thenAnswer((_) async => Right(municipio));

      var result = await findMunicipio(params);

      expect(result.fold(id, id), isA<Municipio>());
    });

    test("should return Left failure", () async {
      when(mockMunicipioRepository.findMunicipio(params.municipioModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findMunicipio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listMunicipio", () {
    test("should return Right success", () async {
      when(mockMunicipioRepository.listMunicipio())
          .thenAnswer((_) async => Right(municipioList));

      var result = await listMunicipio(noParams);

      expect(result.fold(id, id), isA<List<Municipio>>());
    });

    test("should return Left failure", () async {
      when(mockMunicipioRepository.listMunicipio())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listMunicipio(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageMunicipio", () {
    test("should return Right success", () async {
      when(mockMunicipioRepository.listPageMunicipio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(municipioList));

      var result = await listPageMunicipio(params);

      expect(result.fold(id, id), isA<List<Municipio>>());
    });

    test("should return Left failure", () async {
      when(mockMunicipioRepository.listPageMunicipio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageMunicipio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveMunicipio", () {
    test("should return Right success", () async {
      when(mockMunicipioRepository.saveMunicipio(params.municipioModel))
          .thenAnswer((_) async => Right(municipio));

      var result = await saveMunicipio(params);

      expect(result, Right(municipio));
    });
    test("should return Left failure", () async {
      when(mockMunicipioRepository.saveMunicipio(params.municipioModel))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveMunicipio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteMunicipio", () {
    test("should call your repository", () async {
      when(mockMunicipioRepository.deleteMunicipio(params.municipioModel.id))
          .thenAnswer((_) async => Right(Municipio));

      await deleteMunicipio(params);

      verify(mockMunicipioRepository.deleteMunicipio(params.municipioModel.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockMunicipioRepository.deleteMunicipio(params.municipioModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteMunicipio(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
