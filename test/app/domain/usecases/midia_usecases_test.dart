import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/models/midia_model.dart';
import 'package:syshouse/app/domain/entities/midia.dart';
import 'package:syshouse/app/domain/repositories/midia_repository.dart';
import 'package:syshouse/app/domain/usecases/midia_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockMidiaRepository extends Mock implements MidiaRepository {}

void main() {
  FindMidia findMidia;
  ListMidia listMidia;
  ListPageMidia listPageMidia;
  SaveMidia saveMidia;
  DeleteMidia deleteMidia;
  MockMidiaRepository mockMidiaRepository;

  var params = Params(
    midiaModel: MidiaModel(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var midia = Midia(id: "1");

  var midiaList = [midia];

  setUp(() {
    mockMidiaRepository = MockMidiaRepository();
    findMidia = FindMidia(
      midiaRepository: mockMidiaRepository,
    );
    listMidia = ListMidia(
      midiaRepository: mockMidiaRepository,
    );
    listPageMidia = ListPageMidia(
      midiaRepository: mockMidiaRepository,
    );
    saveMidia = SaveMidia(
      midiaRepository: mockMidiaRepository,
    );
    deleteMidia = DeleteMidia(
      midiaRepository: mockMidiaRepository,
    );
  });

  group("usecase findMidia", () {
    test("should return Right success", () async {
      when(mockMidiaRepository.findMidia(params.midiaModel.id))
          .thenAnswer((_) async => Right(midia));

      var result = await findMidia(params);

      expect(result.fold(id, id), isA<Midia>());
    });

    test("should return Left failure", () async {
      when(mockMidiaRepository.findMidia(params.midiaModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findMidia(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listMidia", () {
    test("should return Right success", () async {
      when(mockMidiaRepository.listMidia())
          .thenAnswer((_) async => Right(midiaList));

      var result = await listMidia(noParams);

      expect(result.fold(id, id), isA<List<Midia>>());
    });

    test("should return Left failure", () async {
      when(mockMidiaRepository.listMidia())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listMidia(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageMidia", () {
    test("should return Right success", () async {
      when(mockMidiaRepository.listPageMidia(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(midiaList));

      var result = await listPageMidia(params);

      expect(result.fold(id, id), isA<List<Midia>>());
    });

    test("should return Left failure", () async {
      when(mockMidiaRepository.listPageMidia(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageMidia(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveMidia", () {
    test("should return Right success", () async {
      when(mockMidiaRepository.saveMidia(params.midiaModel))
          .thenAnswer((_) async => Right(midia));

      var result = await saveMidia(params);

      expect(result, Right(midia));
    });
    test("should return Left failure", () async {
      when(mockMidiaRepository.saveMidia(params.midiaModel))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveMidia(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteMidia", () {
    test("should call your repository", () async {
      when(mockMidiaRepository.deleteMidia(params.midiaModel.id))
          .thenAnswer((_) async => Right(Midia));

      await deleteMidia(params);

      verify(mockMidiaRepository.deleteMidia(params.midiaModel.id)).called(1);
    });

    test("should return Left failure", () async {
      when(mockMidiaRepository.deleteMidia(params.midiaModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteMidia(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
