import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/models/patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/patrimonio.dart';
import 'package:syshouse/app/domain/repositories/patrimonio_repository.dart';
import 'package:syshouse/app/domain/usecases/patrimonio_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockPatrimonioRepository extends Mock implements PatrimonioRepository {}

void main() {
  FindPatrimonio findPatrimonio;
  ListPatrimonio listPatrimonio;
  ListPagePatrimonio listPagePatrimonio;
  SavePatrimonio savePatrimonio;
  DeletePatrimonio deletePatrimonio;
  MockPatrimonioRepository mockPatrimonioRepository;

  var params = Params(
    patrimonioModel: PatrimonioModel(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var patrimonio = Patrimonio(id: "1");

  var patrimonioList = [patrimonio];

  setUp(() {
    mockPatrimonioRepository = MockPatrimonioRepository();
    findPatrimonio = FindPatrimonio(
      patrimonioRepository: mockPatrimonioRepository,
    );
    listPatrimonio = ListPatrimonio(
      patrimonioRepository: mockPatrimonioRepository,
    );
    listPagePatrimonio = ListPagePatrimonio(
      patrimonioRepository: mockPatrimonioRepository,
    );
    savePatrimonio = SavePatrimonio(
      patrimonioRepository: mockPatrimonioRepository,
    );
    deletePatrimonio = DeletePatrimonio(
      patrimonioRepository: mockPatrimonioRepository,
    );
  });

  group("usecase findPatrimonio", () {
    test("should return Right success", () async {
      when(mockPatrimonioRepository.findPatrimonio(params.patrimonioModel.id))
          .thenAnswer((_) async => Right(patrimonio));

      var result = await findPatrimonio(params);

      expect(result.fold(id, id), isA<Patrimonio>());
    });

    test("should return Left failure", () async {
      when(mockPatrimonioRepository.findPatrimonio(params.patrimonioModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPatrimonio", () {
    test("should return Right success", () async {
      when(mockPatrimonioRepository.listPatrimonio())
          .thenAnswer((_) async => Right(patrimonioList));

      var result = await listPatrimonio(noParams);

      expect(result.fold(id, id), isA<List<Patrimonio>>());
    });

    test("should return Left failure", () async {
      when(mockPatrimonioRepository.listPatrimonio())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPatrimonio(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPagePatrimonio", () {
    test("should return Right success", () async {
      when(mockPatrimonioRepository.listPagePatrimonio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(patrimonioList));

      var result = await listPagePatrimonio(params);

      expect(result.fold(id, id), isA<List<Patrimonio>>());
    });

    test("should return Left failure", () async {
      when(mockPatrimonioRepository.listPagePatrimonio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPagePatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase savePatrimonio", () {
    test("should return Right success", () async {
      when(mockPatrimonioRepository.savePatrimonio(params.patrimonioModel))
          .thenAnswer((_) async => Right(patrimonio));

      var result = await savePatrimonio(params);

      expect(result, Right(patrimonio));
    });
    test("should return Left failure", () async {
      when(mockPatrimonioRepository.savePatrimonio(params.patrimonioModel))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await savePatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deletePatrimonio", () {
    test("should call your repository", () async {
      when(mockPatrimonioRepository.deletePatrimonio(params.patrimonioModel.id))
          .thenAnswer((_) async => Right(Patrimonio));

      await deletePatrimonio(params);

      verify(mockPatrimonioRepository
              .deletePatrimonio(params.patrimonioModel.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockPatrimonioRepository.deletePatrimonio(params.patrimonioModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deletePatrimonio(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
