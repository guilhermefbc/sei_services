abstract class Persistence {
  Future<void> save(dynamic element) async {
    await saveInLocalDB(element);
  }
  Future<void> saveInLocalDB(dynamic element) async {}
}