import 'package:professional_fee_calculator/constants/scale_of_fee.dart';

class Professional {
  final String title;
  final bool? isPrimeConsultant;
  final Map<dynamic, double> scaleOfFee;
  final int reinburstmentRateInPercent;

  const Professional({
    required this.title,
    required this.scaleOfFee,
    required this.reinburstmentRateInPercent,
    this.isPrimeConsultant = false,
  });

  Professional setScaleOfFee({required Map<dynamic, double> scaleOfFee}) =>
      Professional(
        title: title,
        scaleOfFee: scaleOfFee,
        reinburstmentRateInPercent: reinburstmentRateInPercent,
        isPrimeConsultant: isPrimeConsultant,
      );

  Professional setReinburstMentRate(int reinburstmentRate) => Professional(
        title: title,
        scaleOfFee: scaleOfFee,
        reinburstmentRateInPercent: reinburstmentRateInPercent,
        isPrimeConsultant: isPrimeConsultant,
      );

  Professional setIsPrimeConsultant(bool isPrimeConsultant) => Professional(
        title: title,
        scaleOfFee: scaleOfFee,
        reinburstmentRateInPercent: reinburstmentRateInPercent,
        isPrimeConsultant: isPrimeConsultant,
      );
}

const professionals = <Professional>[
  Professional(
    title: "Structural Engineer",
    scaleOfFee: SCALE_OF_FEE_FOR_STRUCTURAL_ENGINEER,
    reinburstmentRateInPercent: 15,
  ),
  Professional(
    title: "Architect",
    scaleOfFee: SCALE_OF_FEE_FOR_PRIME_CONSULTANT,
    reinburstmentRateInPercent: 40,
    isPrimeConsultant: true,
  ),
  Professional(
    title: "Electrical Engineer",
    scaleOfFee: SCALE_OF_FEE_FOR_ELECTRICAL_ENGINEERS,
    reinburstmentRateInPercent: 10,
  ),
  Professional(
    title: "Mechanical Engineer",
    scaleOfFee: SCALE_OF_FEE_FOR_MECHANICAL_ENGINEERS,
    reinburstmentRateInPercent: 10,
  ),
  Professional(
    title: "Quantity Surveyor",
    scaleOfFee: SCALE_OF_FEE_FOR_QUANTITY_SURVEY,
    reinburstmentRateInPercent: 15,
  ),
];
