class BoardEntity{
  final int columnsNumber;
  final int rowsNumber;
  late List<List<int>> _board;

  BoardEntity({required this.columnsNumber, required this.rowsNumber}){
    _board = List.generate(rowsNumber, (index) => List.generate(columnsNumber, (index)=>0));
  } 
  List<List<int>> get() => _board;
  void set({required int column, required int row, required int player}) => _board[row][column] = player; 
  
  @override
  String toString() {
    
    return '${_board[0]} \n${_board[1]}\n${_board[2]} \n${_board[3]}\n${_board[4]} \n${_board[5]}';
  }
}