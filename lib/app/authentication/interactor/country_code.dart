class CountyCode {
  String code;

  String flag;
  String name;

  CountyCode({
    required this.code,
    required this.flag,
    required this.name,
  });
}

final List<CountyCode> countryCodes = [
  CountyCode(
    code: '+44',
    flag: 'assets/images/gb.svg',
    name: 'United Kingdom',
  ),
  CountyCode(
    code: '+39',
    flag: 'assets/images/it.svg',
    name: 'Italy',
  ),
  CountyCode(
    code: '+33',
    flag: 'assets/images/fr.svg',
    name: 'France',
  ),
  CountyCode(
    code: '+49',
    flag: 'assets/images/de.svg',
    name: 'Germany',
  ),
  CountyCode(
    code: '+31',
    flag: 'assets/images/nl.svg',
    name: 'Netherlands',
  ),
];
