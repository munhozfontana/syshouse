import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/domain/entities/tipo_despesa.dart';
import 'package:syshouse/app/domain/repositories/tipo_despesa_repository.dart';
import 'package:syshouse/app/domain/usecases/tipo_despesa_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockTipoDespesaRepository extends Mock implements TipoDespesaRepository {}

void main() {
  FindTipoDespesa findTipoDespesa;
  ListTipoDespesa listTipoDespesa;
  ListPageTipoDespesa listPageTipoDespesa;
  SaveTipoDespesa saveTipoDespesa;
  DeleteTipoDespesa deleteTipoDespesa;
  MockTipoDespesaRepository mockTipoDespesaRepository;

  var params = Params(
    tipoDespesa: TipoDespesa(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var tipoDespesa = TipoDespesa(id: "1");

  var tipoDespesaList = [tipoDespesa];

  setUp(() {
    mockTipoDespesaRepository = MockTipoDespesaRepository();
    findTipoDespesa = FindTipoDespesa(
      tipoDespesaRepository: mockTipoDespesaRepository,
    );
    listTipoDespesa = ListTipoDespesa(
      tipoDespesaRepository: mockTipoDespesaRepository,
    );
    listPageTipoDespesa = ListPageTipoDespesa(
      tipoDespesaRepository: mockTipoDespesaRepository,
    );
    saveTipoDespesa = SaveTipoDespesa(
      tipoDespesaRepository: mockTipoDespesaRepository,
    );
    deleteTipoDespesa = DeleteTipoDespesa(
      tipoDespesaRepository: mockTipoDespesaRepository,
    );
  });

  group("usecase findTipoDespesa", () {
    test("should return Right success", () async {
      when(mockTipoDespesaRepository.findTipoDespesa(params.tipoDespesa.id))
          .thenAnswer((_) async => Right(tipoDespesa));

      var result = await findTipoDespesa(params);

      expect(result.fold(id, id), isA<TipoDespesa>());
    });

    test("should return Left failure", () async {
      when(mockTipoDespesaRepository.findTipoDespesa(params.tipoDespesa.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findTipoDespesa(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listTipoDespesa", () {
    test("should return Right success", () async {
      when(mockTipoDespesaRepository.listTipoDespesa())
          .thenAnswer((_) async => Right(tipoDespesaList));

      var result = await listTipoDespesa(noParams);

      expect(result.fold(id, id), isA<List<TipoDespesa>>());
    });

    test("should return Left failure", () async {
      when(mockTipoDespesaRepository.listTipoDespesa())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listTipoDespesa(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageTipoDespesa", () {
    test("should return Right success", () async {
      when(mockTipoDespesaRepository.listPageTipoDespesa(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(tipoDespesaList));

      var result = await listPageTipoDespesa(params);

      expect(result.fold(id, id), isA<List<TipoDespesa>>());
    });

    test("should return Left failure", () async {
      when(mockTipoDespesaRepository.listPageTipoDespesa(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageTipoDespesa(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveTipoDespesa", () {
    test("should return Right success", () async {
      when(mockTipoDespesaRepository.saveTipoDespesa(tipoDespesa))
          .thenAnswer((_) async => Right(tipoDespesa));

      var result = await saveTipoDespesa(params);

      expect(result, Right(tipoDespesa));
    });
    test("should return Left failure", () async {
      when(mockTipoDespesaRepository.saveTipoDespesa(tipoDespesa))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveTipoDespesa(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteTipoDespesa", () {
    test("should call your repository", () async {
      when(mockTipoDespesaRepository.deleteTipoDespesa(params.tipoDespesa.id))
          .thenAnswer((_) async => Right(tipoDespesa));

      await deleteTipoDespesa(params);

      verify(mockTipoDespesaRepository.deleteTipoDespesa(params.tipoDespesa.id))
          .called(1);
    });

    test("should return Left failure", () async {
      when(mockTipoDespesaRepository.deleteTipoDespesa(params.tipoDespesa.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteTipoDespesa(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
