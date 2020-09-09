import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/models/pagador_model.dart';
import 'package:syshouse/app/domain/entities/pagador.dart';
import 'package:syshouse/app/domain/repositories/pagador_repository.dart';
import 'package:syshouse/app/domain/usecases/pagador_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockPagadorRepository extends Mock implements PagadorRepository {}

void main() {
  FindPagador findPagador;
  ListPagador listPagador;
  ListPagePagador listPagePagador;
  SavePagador savePagador;
  DeletePagador deletePagador;
  MockPagadorRepository mockPagadorRepository;

  var params = Params(
    pagadorModel: PagadorModel(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var pagador = Pagador(id: "1");

  var pagadorList = [pagador];

  setUp(() {
    mockPagadorRepository = MockPagadorRepository();
    findPagador = FindPagador(
      pagadorRepository: mockPagadorRepository,
    );
    listPagador = ListPagador(
      pagadorRepository: mockPagadorRepository,
    );
    listPagePagador = ListPagePagador(
      pagadorRepository: mockPagadorRepository,
    );
    savePagador = SavePagador(
      pagadorRepository: mockPagadorRepository,
    );
    deletePagador = DeletePagador(
      pagadorRepository: mockPagadorRepository,
    );
  });

  group("usecase findPagador", () {
    test("should return Right success", () async {
      when(mockPagadorRepository.findPagador(params.pagadorModel.id))
          .thenAnswer((_) async => Right(pagador));

      var result = await findPagador(params);

      expect(result.fold(id, id), isA<Pagador>());
    });

    test("should return Left failure", () async {
      when(mockPagadorRepository.findPagador(params.pagadorModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findPagador(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPagador", () {
    test("should return Right success", () async {
      when(mockPagadorRepository.listPagador())
          .thenAnswer((_) async => Right(pagadorList));

      var result = await listPagador(noParams);

      expect(result.fold(id, id), isA<List<Pagador>>());
    });

    test("should return Left failure", () async {
      when(mockPagadorRepository.listPagador())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPagador(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPagePagador", () {
    test("should return Right success", () async {
      when(mockPagadorRepository.listPagePagador(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(pagadorList));

      var result = await listPagePagador(params);

      expect(result.fold(id, id), isA<List<Pagador>>());
    });

    test("should return Left failure", () async {
      when(mockPagadorRepository.listPagePagador(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPagePagador(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase savePagador", () {
    test("should return Right success", () async {
      when(mockPagadorRepository.savePagador(params.pagadorModel))
          .thenAnswer((_) async => Right(pagador));

      var result = await savePagador(params);

      expect(result, Right(pagador));
    });
    test("should return Left failure", () async {
      when(mockPagadorRepository.savePagador(params.pagadorModel))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await savePagador(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deletePagador", () {
    test("should call your repository", () async {
      when(mockPagadorRepository.deletePagador(params.pagadorModel.id))
          .thenAnswer((_) async => Right(Pagador));

      await deletePagador(params);

      verify(mockPagadorRepository.deletePagador(params.pagadorModel.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockPagadorRepository.deletePagador(params.pagadorModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deletePagador(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
