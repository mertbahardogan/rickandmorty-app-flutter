abstract class ApiService{

  Future<int> getCharId(String charName);

  Future<Object> getChar(int charId);
}