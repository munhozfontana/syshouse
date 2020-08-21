import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/domain/entities/contato.dart';
import 'package:syshouse/app/domain/repositories/contato_repository.dart';
import 'package:syshouse/app/domain/usecases/contato_usecases.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/usecases/params.dart';

class MockContatoRepository extends Mock implements ContatoRepository {}

void main() {
  FindContato findContato;
  ListContato listContato;
  ListPageContato listPageContato;
  SaveContato saveContato;
  DeleteContato deleteContato;
  MockContatoRepository mockContatoRepository;

  var params = Params(
    contato: Contato(id: "1"),
    pagination: Pagination(
      page: 1,
      size: 1,
    ),
  );
  var noParams = NoParams();

  var contato = Contato(id: "1");

  var contatoList = [contato];

  setUp(() {
    mockContatoRepository = MockContatoRepository();
    findContato = FindContato(
      contatoRepository: mockContatoRepository,
    );
    listContato = ListContato(
      contatoRepository: mockContatoRepository,
    );
    listPageContato = ListPageContato(
      contatoRepository: mockContatoRepository,
    );
    saveContato = SaveContato(
      contatoRepository: mockContatoRepository,
    );
    deleteContato = DeleteContato(
      contatoRepository: mockContatoRepository,
    );
  });

  group("usecase findContato", () {
    test("should return Right success", () async {
      when(mockContatoRepository.findContato(params.contato.id))
          .thenAnswer((_) async => Right(contato));

      var result = await findContato(params);

      expect(result.fold(id, id), isA<Contato>());
    });

    test("should return Left failure", () async {
      when(mockContatoRepository.findContato(params.contato.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await findContato(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listContato", () {
    test("should return Right success", () async {
      when(mockContatoRepository.listContato())
          .thenAnswer((_) async => Right(contatoList));

      var result = await listContato(noParams);

      expect(result.fold(id, id), isA<List<Contato>>());
    });

    test("should return Left failure", () async {
      when(mockContatoRepository.listContato())
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listContato(noParams);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase listPageContato", () {
    test("should return Right success", () async {
      when(mockContatoRepository.listPageContato(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Right(contatoList));

      var result = await listPageContato(params);

      expect(result.fold(id, id), isA<List<Contato>>());
    });

    test("should return Left failure", () async {
      when(mockContatoRepository.listPageContato(
        params.pagination.page,
        params.pagination.size,
      )).thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await listPageContato(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase saveContato", () {
    test("should return Right success", () async {
      when(mockContatoRepository.saveContato(contato))
          .thenAnswer((_) async => Right(contato));

      var result = await saveContato(params);

      expect(result, Right(contato));
    });
    test("should return Left failure", () async {
      when(mockContatoRepository.saveContato(contato))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await saveContato(params);

      expect(result.fold(id, id), isA<ServerFailure>());
    });
  });
  group("usecase deleteContato", () {
    test("should call your repository", () async {
      when(mockContatoRepository.deleteContato(params.contato.id))
          .thenAnswer((_) async => Right(Contato));

      await deleteContato(params);

      verify(mockContatoRepository.deleteContato(params.contato.id)).called(1);
    });

    test("should return Left failure", () async {
      when(mockContatoRepository.deleteContato(params.contato.id))
          .thenAnswer((_) async => Left(ServerFailure(menssagem: "Any error")));

      var result = await deleteContato(params);

      expect(result.fold(id, null), isA<ServerFailure>());
    });
  });
}
