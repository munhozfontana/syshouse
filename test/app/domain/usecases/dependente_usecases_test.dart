import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/models/dependente_model.dart';
import 'package:syshouse/app/domain/entities/dependente.dart';
import 'package:syshouse/app/domain/repositories/dependente_repository.dart';
import 'package:syshouse/app/domain/usecases/dependente_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockDependenteRepository extends Mock implements DependenteRepository {}

void main() {
  FindDependente findDependente;
  ListDependente listDependente;
  ListPageDependente listPageDependente;
  SaveDependente saveDependente;
  DeleteDependente deleteDependente;
  MockDependenteRepository mockDependenteRepository;

  var params = Params(
    dependenteModel: DependenteModel(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var dependente = Dependente(id: "1");

  var dependenteList = [dependente];

  setUp(() {
    mockDependenteRepository = MockDependenteRepository();
    findDependente = FindDependente(
      dependenteRepository: mockDependenteRepository,
    );
    listDependente = ListDependente(
      dependenteRepository: mockDependenteRepository,
    );
    listPageDependente = ListPageDependente(
      dependenteRepository: mockDependenteRepository,
    );
    saveDependente = SaveDependente(
      dependenteRepository: mockDependenteRepository,
    );
    deleteDependente = DeleteDependente(
      dependenteRepository: mockDependenteRepository,
    );
  });

  group("usecase findDependente", () {
    test("should return Right success", () async {
      when(mockDependenteRepository.findDependente(params.dependenteModel.id))
          .thenAnswer((_) async => Right(dependente));

      var result = await findDependente(params);

      expect(result.fold(id, id), isA<Dependente>());
    });

    test("should return Left failure", () async {
      when(mockDependenteRepository.findDependente(params.dependenteModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findDependente(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listDependente", () {
    test("should return Right success", () async {
      when(mockDependenteRepository.listDependente())
          .thenAnswer((_) async => Right(dependenteList));

      var result = await listDependente(noParams);

      expect(result.fold(id, id), isA<List<Dependente>>());
    });

    test("should return Left failure", () async {
      when(mockDependenteRepository.listDependente())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listDependente(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageDependente", () {
    test("should return Right success", () async {
      when(mockDependenteRepository.listPageDependente(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(dependenteList));

      var result = await listPageDependente(params);

      expect(result.fold(id, id), isA<List<Dependente>>());
    });

    test("should return Left failure", () async {
      when(mockDependenteRepository.listPageDependente(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageDependente(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveDependente", () {
    test("should return Right success", () async {
      when(mockDependenteRepository.saveDependente(params.dependenteModel))
          .thenAnswer((_) async => Right(dependente));

      var result = await saveDependente(params);

      expect(result, Right(dependente));
    });
    test("should return Left failure", () async {
      when(mockDependenteRepository.saveDependente(params.dependenteModel))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveDependente(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteDependente", () {
    test("should call your repository", () async {
      when(mockDependenteRepository.deleteDependente(params.dependenteModel.id))
          .thenAnswer((_) async => Right(Dependente));

      await deleteDependente(params);

      verify(mockDependenteRepository
              .deleteDependente(params.dependenteModel.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockDependenteRepository.deleteDependente(params.dependenteModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteDependente(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
