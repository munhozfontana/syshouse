import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/domain/entities/localizacao.dart';
import 'package:syshouse/app/domain/repositories/localizacao_repository.dart';
import 'package:syshouse/app/domain/usecases/localizacao_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockLocalizacaoRepository extends Mock implements LocalizacaoRepository {}

void main() {
  FindLocalizacao findLocalizacao;
  ListLocalizacao listLocalizacao;
  ListPageLocalizacao listPageLocalizacao;
  SaveLocalizacao saveLocalizacao;
  DeleteLocalizacao deleteLocalizacao;
  MockLocalizacaoRepository mockLocalizacaoRepository;

  var params = Params(
    localizacao: Localizacao(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var localizacao = Localizacao(id: "1");

  var localizacaoList = [localizacao];

  setUp(() {
    mockLocalizacaoRepository = MockLocalizacaoRepository();
    findLocalizacao = FindLocalizacao(
      localizacaoRepository: mockLocalizacaoRepository,
    );
    listLocalizacao = ListLocalizacao(
      localizacaoRepository: mockLocalizacaoRepository,
    );
    listPageLocalizacao = ListPageLocalizacao(
      localizacaoRepository: mockLocalizacaoRepository,
    );
    saveLocalizacao = SaveLocalizacao(
      localizacaoRepository: mockLocalizacaoRepository,
    );
    deleteLocalizacao = DeleteLocalizacao(
      localizacaoRepository: mockLocalizacaoRepository,
    );
  });

  group("usecase findLocalizacao", () {
    test("should return Right success", () async {
      when(mockLocalizacaoRepository.findLocalizacao(params.localizacao.id))
          .thenAnswer((_) async => Right(localizacao));

      var result = await findLocalizacao(params);

      expect(result.fold(id, id), isA<Localizacao>());
    });

    test("should return Left failure", () async {
      when(mockLocalizacaoRepository.findLocalizacao(params.localizacao.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findLocalizacao(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listLocalizacao", () {
    test("should return Right success", () async {
      when(mockLocalizacaoRepository.listLocalizacao())
          .thenAnswer((_) async => Right(localizacaoList));

      var result = await listLocalizacao(noParams);

      expect(result.fold(id, id), isA<List<Localizacao>>());
    });

    test("should return Left failure", () async {
      when(mockLocalizacaoRepository.listLocalizacao())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listLocalizacao(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageLocalizacao", () {
    test("should return Right success", () async {
      when(mockLocalizacaoRepository.listPageLocalizacao(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(localizacaoList));

      var result = await listPageLocalizacao(params);

      expect(result.fold(id, id), isA<List<Localizacao>>());
    });

    test("should return Left failure", () async {
      when(mockLocalizacaoRepository.listPageLocalizacao(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageLocalizacao(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveLocalizacao", () {
    test("should return Right success", () async {
      when(mockLocalizacaoRepository.saveLocalizacao(localizacao))
          .thenAnswer((_) async => Right(localizacao));

      var result = await saveLocalizacao(params);

      expect(result, Right(localizacao));
    });
    test("should return Left failure", () async {
      when(mockLocalizacaoRepository.saveLocalizacao(localizacao))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveLocalizacao(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteLocalizacao", () {
    test("should call your repository", () async {
      when(mockLocalizacaoRepository.deleteLocalizacao(params.localizacao.id))
          .thenAnswer((_) async => Right(Localizacao));

      await deleteLocalizacao(params);

      verify(mockLocalizacaoRepository.deleteLocalizacao(params.localizacao.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockLocalizacaoRepository.deleteLocalizacao(params.localizacao.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteLocalizacao(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
