class CustomizationOption{
  int SugarLevel;
  int nata;
  int CoffeeJelly;
  int Pearl;
  int CheeseCake;
  int CupSize;
  int Quantity;
  double TotalAmount;


  CustomizationOption({
    required this.SugarLevel,
    required this.nata,
    required this.CoffeeJelly,
    required this.Pearl,
    required this.CheeseCake,
    required this.CupSize,
    required this.Quantity,
    required this.TotalAmount,});

  factory CustomizationOption.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
      'SugarLevel' : int SugarLevel,
      'nata' : int nata,
      'CoffeeJelly' : int CoffeeJelly,
      'Pearl' :   int Pearl,
      'CheeseCake' : int CheeseCake,
      'CupSize' : int CupSize,
      'Quantity' : int Quantity,
      'TotalAmount' :  double TotalAmount,
      } =>
          CustomizationOption(
            SugarLevel:  SugarLevel,
            nata: nata,
            CoffeeJelly: CoffeeJelly,
            Pearl: Pearl,
            CheeseCake: CheeseCake,
            CupSize: CupSize,
            Quantity: Quantity,
            TotalAmount: TotalAmount,
          ),
      _ => throw const FormatException('Failed to ')
    };
  }
}