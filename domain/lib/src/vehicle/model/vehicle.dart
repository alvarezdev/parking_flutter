class Vehicle{

  Vehicle(this._plate) {
    if(_plate.isEmpty || _plate.length > 6){
      throw Exception(_isEmptyVehiclePlateMsg);
    }
  }

  final String _plate;

  final String _isEmptyVehiclePlateMsg = "Invalid vehicle plate format";

  String get plate => _plate;

}