import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/domain/entities/pagamento.dart';
import 'package:syshouse/app/domain/repositories/pagamento_repository.dart';
import 'package:syshouse/app/domain/usecases/pagamento_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockPagamentoRepository extends Mock implements PagamentoRepository {}

void main() {
  FindPagamento findPagamento;
  ListPagamento listPagamento;
  ListPagePagamento listPagePagamento;
  SavePagamento savePagamento;
  DeletePagamento deletePagamento;
  MockPagamentoRepository mockPagamentoRepository;

  var params = Params(
    pagamento: Pagamento(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var pagamento = Pagamento(id: "1");

  var pagamentoList = [pagamento];

  setUp(() {
    mockPagamentoRepository = MockPagamentoRepository();
    findPagamento = FindPagamento(
      pagamentoRepository: mockPagamentoRepository,
    );
    listPagamento = ListPagamento(
      pagamentoRepository: mockPagamentoRepository,
    );
    listPagePagamento = ListPagePagamento(
      pagamentoRepository: mockPagamentoRepository,
    );
    savePagamento = SavePagamento(
      pagamentoRepository: mockPagamentoRepository,
    );
    deletePagamento = DeletePagamento(
      pagamentoRepository: mockPagamentoRepository,
    );
  });

  group("usecase findPagamento", () {
    test("should return Right success", () async {
      when(mockPagamentoRepository.findPagamento(params.pagamento.id))
          .thenAnswer((_) async => Right(pagamento));

      var result = await findPagamento(params);

      expect(result.fold(id, id), isA<Pagamento>());
    });

    test("should return Left failure", () async {
      when(mockPagamentoRepository.findPagamento(params.pagamento.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findPagamento(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPagamento", () {
    test("should return Right success", () async {
      when(mockPagamentoRepository.listPagamento())
          .thenAnswer((_) async => Right(pagamentoList));

      var result = await listPagamento(noParams);

      expect(result.fold(id, id), isA<List<Pagamento>>());
    });

    test("should return Left failure", () async {
      when(mockPagamentoRepository.listPagamento())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPagamento(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPagePagamento", () {
    test("should return Right success", () async {
      when(mockPagamentoRepository.listPagePagamento(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(pagamentoList));

      var result = await listPagePagamento(params);

      expect(result.fold(id, id), isA<List<Pagamento>>());
    });

    test("should return Left failure", () async {
      when(mockPagamentoRepository.listPagePagamento(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPagePagamento(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase savePagamento", () {
    test("should return Right success", () async {
      when(mockPagamentoRepository.savePagamento(pagamento))
          .thenAnswer((_) async => Right(pagamento));

      var result = await savePagamento(params);

      expect(result, Right(pagamento));
    });
    test("should return Left failure", () async {
      when(mockPagamentoRepository.savePagamento(pagamento))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await savePagamento(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deletePagamento", () {
    test("should call your repository", () async {
      when(mockPagamentoRepository.deletePagamento(params.pagamento.id))
          .thenAnswer((_) async => Right(Pagamento));

      await deletePagamento(params);

      verify(mockPagamentoRepository.deletePagamento(params.pagamento.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockPagamentoRepository.deletePagamento(params.pagamento.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deletePagamento(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
