import 'package:tennis_court_app/features/reserve/reserve.dart';

class CourtRepositoryImpl extends CourtRepository {
  final CourtDataSource? dataSource;

  CourtRepositoryImpl({CourtDataSource? dataSource})
      : dataSource = dataSource ?? CourtDatasourceImpl();

  @override
  Future<List<Court?>?> getCourts() async {
    return await dataSource!.getCourts();
  }

  @override
  Future<bool?> registerAllCourts(List<Map<String, dynamic>> courts) async {
    return await dataSource!.registerAllCourts(courts);
  }

  @override
  Future<bool?> registerCourt({required Map<String, dynamic> court}) async {
    return await dataSource!.registerCourt(court: court);
  }

  @override
  Future<Court?> getCourt({required String courtId}) async {
    return await dataSource!.getCourt(courtId: courtId);
  }
}
