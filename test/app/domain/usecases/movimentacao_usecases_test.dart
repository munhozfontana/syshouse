import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/domain/entities/movimentacao.dart';
import 'package:syshouse/app/domain/repositories/movimentacao_repository.dart';
import 'package:syshouse/app/domain/usecases/movimentacao_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockMovimentacaoRepository extends Mock
    implements MovimentacaoRepository {}

void main() {
  FindMovimentacao findMovimentacao;
  ListMovimentacao listMovimentacao;
  ListPageMovimentacao listPageMovimentacao;
  SaveMovimentacao saveMovimentacao;
  DeleteMovimentacao deleteMovimentacao;
  MockMovimentacaoRepository mockMovimentacaoRepository;

  var params = Params(
    movimentacao: Movimentacao(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var movimentacao = Movimentacao(id: "1");

  var movimentacaoList = [movimentacao];

  setUp(() {
    mockMovimentacaoRepository = MockMovimentacaoRepository();
    findMovimentacao = FindMovimentacao(
      movimentacaoRepository: mockMovimentacaoRepository,
    );
    listMovimentacao = ListMovimentacao(
      movimentacaoRepository: mockMovimentacaoRepository,
    );
    listPageMovimentacao = ListPageMovimentacao(
      movimentacaoRepository: mockMovimentacaoRepository,
    );
    saveMovimentacao = SaveMovimentacao(
      movimentacaoRepository: mockMovimentacaoRepository,
    );
    deleteMovimentacao = DeleteMovimentacao(
      movimentacaoRepository: mockMovimentacaoRepository,
    );
  });

  group("usecase findMovimentacao", () {
    test("should return Right success", () async {
      when(mockMovimentacaoRepository.findMovimentacao(params.movimentacao.id))
          .thenAnswer((_) async => Right(movimentacao));

      var result = await findMovimentacao(params);

      expect(result.fold(id, id), isA<Movimentacao>());
    });

    test("should return Left failure", () async {
      when(mockMovimentacaoRepository.findMovimentacao(params.movimentacao.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findMovimentacao(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listMovimentacao", () {
    test("should return Right success", () async {
      when(mockMovimentacaoRepository.listMovimentacao())
          .thenAnswer((_) async => Right(movimentacaoList));

      var result = await listMovimentacao(noParams);

      expect(result.fold(id, id), isA<List<Movimentacao>>());
    });

    test("should return Left failure", () async {
      when(mockMovimentacaoRepository.listMovimentacao())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listMovimentacao(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageMovimentacao", () {
    test("should return Right success", () async {
      when(mockMovimentacaoRepository.listPageMovimentacao(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(movimentacaoList));

      var result = await listPageMovimentacao(params);

      expect(result.fold(id, id), isA<List<Movimentacao>>());
    });

    test("should return Left failure", () async {
      when(mockMovimentacaoRepository.listPageMovimentacao(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageMovimentacao(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveMovimentacao", () {
    test("should return Right success", () async {
      when(mockMovimentacaoRepository.saveMovimentacao(movimentacao))
          .thenAnswer((_) async => Right(movimentacao));

      var result = await saveMovimentacao(params);

      expect(result, Right(movimentacao));
    });
    test("should return Left failure", () async {
      when(mockMovimentacaoRepository.saveMovimentacao(movimentacao))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveMovimentacao(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteMovimentacao", () {
    test("should call your repository", () async {
      when(mockMovimentacaoRepository
              .deleteMovimentacao(params.movimentacao.id))
          .thenAnswer((_) async => Right(Movimentacao));

      await deleteMovimentacao(params);

      verify(mockMovimentacaoRepository
              .deleteMovimentacao(params.movimentacao.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockMovimentacaoRepository
              .deleteMovimentacao(params.movimentacao.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteMovimentacao(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
