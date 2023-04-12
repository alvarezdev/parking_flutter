class Vehicle{
  final String _isEmptyVehiclePlateMsg = "Invalid vehicle plate format";

  final String? _plate;

  Vehicle({required String? plate}) :
        _plate = plate{
    if(_plate!.isEmpty || _plate!.length > 6){
      throw Exception(_isEmptyVehiclePlateMsg);
    }
  }

  String? get plate => _plate;

}