import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/models/pagamento_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/pagamento_patrimonio.dart';
import 'package:syshouse/app/domain/repositories/pagamento_patrimonio_repository.dart';
import 'package:syshouse/app/domain/usecases/pagamento_patrimonio_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockPagamentoPatrimonioRepository extends Mock
    implements PagamentoPatrimonioRepository {}

void main() {
  FindPagamentoPatrimonio findPagamentoPatrimonio;
  ListPagamentoPatrimonio listPagamentoPatrimonio;
  ListPagePagamentoPatrimonio listPagePagamentoPatrimonio;
  SavePagamentoPatrimonio savePagamentoPatrimonio;
  DeletePagamentoPatrimonio deletePagamentoPatrimonio;
  MockPagamentoPatrimonioRepository mockPagamentoPatrimonioRepository;

  var params = Params(
    pagamentoPatrimonioModel: PagamentoPatrimonioModel(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var pagamentoPatrimonio = PagamentoPatrimonio(id: "1");

  var pagamentopatrimonioList = [pagamentoPatrimonio];

  setUp(() {
    mockPagamentoPatrimonioRepository = MockPagamentoPatrimonioRepository();
    findPagamentoPatrimonio = FindPagamentoPatrimonio(
      pagamentopatrimonioRepository: mockPagamentoPatrimonioRepository,
    );
    listPagamentoPatrimonio = ListPagamentoPatrimonio(
      pagamentopatrimonioRepository: mockPagamentoPatrimonioRepository,
    );
    listPagePagamentoPatrimonio = ListPagePagamentoPatrimonio(
      pagamentopatrimonioRepository: mockPagamentoPatrimonioRepository,
    );
    savePagamentoPatrimonio = SavePagamentoPatrimonio(
      pagamentopatrimonioRepository: mockPagamentoPatrimonioRepository,
    );
    deletePagamentoPatrimonio = DeletePagamentoPatrimonio(
      pagamentopatrimonioRepository: mockPagamentoPatrimonioRepository,
    );
  });

  group("usecase findPagamentoPatrimonio", () {
    test("should return Right success", () async {
      when(mockPagamentoPatrimonioRepository
              .findPagamentoPatrimonio(params.pagamentoPatrimonioModel.id))
          .thenAnswer((_) async => Right(pagamentoPatrimonio));

      var result = await findPagamentoPatrimonio(params);

      expect(result.fold(id, id), isA<PagamentoPatrimonio>());
    });

    test("should return Left failure", () async {
      when(mockPagamentoPatrimonioRepository
              .findPagamentoPatrimonio(params.pagamentoPatrimonioModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findPagamentoPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPagamentoPatrimonio", () {
    test("should return Right success", () async {
      when(mockPagamentoPatrimonioRepository.listPagamentoPatrimonio())
          .thenAnswer((_) async => Right(pagamentopatrimonioList));

      var result = await listPagamentoPatrimonio(noParams);

      expect(result.fold(id, id), isA<List<PagamentoPatrimonio>>());
    });

    test("should return Left failure", () async {
      when(mockPagamentoPatrimonioRepository.listPagamentoPatrimonio())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPagamentoPatrimonio(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPagePagamentoPatrimonio", () {
    test("should return Right success", () async {
      when(mockPagamentoPatrimonioRepository.listPagePagamentoPatrimonio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(pagamentopatrimonioList));

      var result = await listPagePagamentoPatrimonio(params);

      expect(result.fold(id, id), isA<List<PagamentoPatrimonio>>());
    });

    test("should return Left failure", () async {
      when(mockPagamentoPatrimonioRepository.listPagePagamentoPatrimonio(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPagePagamentoPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase savePagamentoPatrimonio", () {
    test("should return Right success", () async {
      when(mockPagamentoPatrimonioRepository
              .savePagamentoPatrimonio(params.pagamentoPatrimonioModel))
          .thenAnswer((_) async => Right(pagamentoPatrimonio));

      var result = await savePagamentoPatrimonio(params);

      expect(result, Right(pagamentoPatrimonio));
    });
    test("should return Left failure", () async {
      when(mockPagamentoPatrimonioRepository
              .savePagamentoPatrimonio(params.pagamentoPatrimonioModel))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await savePagamentoPatrimonio(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deletePagamentoPatrimonio", () {
    test("should call your repository", () async {
      when(mockPagamentoPatrimonioRepository
              .deletePagamentoPatrimonio(params.pagamentoPatrimonioModel.id))
          .thenAnswer((_) async => Right(PagamentoPatrimonio));

      await deletePagamentoPatrimonio(params);

      verify(mockPagamentoPatrimonioRepository
              .deletePagamentoPatrimonio(params.pagamentoPatrimonioModel.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockPagamentoPatrimonioRepository
              .deletePagamentoPatrimonio(params.pagamentoPatrimonioModel.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deletePagamentoPatrimonio(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
