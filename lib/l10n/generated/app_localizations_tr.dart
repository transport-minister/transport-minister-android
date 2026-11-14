// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Transport Minister';

  @override
  String get appTagline => 'Şehri yürüt. Halkı kazan.';

  @override
  String get commonBack => 'Geri';

  @override
  String get commonGotIt => 'Anladım';

  @override
  String get splashTitleTop => 'Transport';

  @override
  String get splashTitleBottom => 'Minister';

  @override
  String get splashLoading => 'Şehir hazırlanıyor…';

  @override
  String get citySelectionTitle => 'Şehrini seç';

  @override
  String get citySelectionSubtitle => 'Ulaştırma Bakanı olarak nerede görev yapacaksın?';

  @override
  String get cityPlay => 'Oyna';

  @override
  String get cityStatusPlayable => 'Oynanabilir';

  @override
  String get cityStatusComingSoon => 'Çok yakında';

  @override
  String cityComingSoonTitle(String city) {
    return '$city yolda!';
  }

  @override
  String get cityComingSoonBody =>
      'Sokaklarını ve sefer saatlerini hâlâ çiziyoruz. Bu arada Bakü\'de kariyerini büyüt.';

  @override
  String cityLockedTitle(String city) {
    return '$city kilitli';
  }

  @override
  String get cityFeatureBuses => 'Otobüsler';

  @override
  String get cityFeatureRoads => 'Yollar';

  @override
  String get cityFeatureBikeLanes => 'Bisiklet yolları';

  @override
  String get cityBakuName => 'Bakü';

  @override
  String get cityBakuTagline => 'Hazar kıyısındaki rüzgarlı başkent';

  @override
  String get cityIstanbulName => 'İstanbul';

  @override
  String get cityIstanbulTagline => 'İki kıta, tek trafik sıkışıklığı';

  @override
  String get cityLondonName => 'Londra';

  @override
  String get cityLondonTagline => 'Çift katlı otobüsler ve yağmurlu yoğun saatler';

  @override
  String get cityTokyoName => 'Tokyo';

  @override
  String get cityTokyoTagline => 'Dünyanın en kalabalık istasyonları';

  @override
  String get cityNewYorkName => 'New York';

  @override
  String get cityNewYorkTagline => 'Asla park etmeyen şehir';

  @override
  String get rankJuniorOfficial => 'Ulaştırma Memuru';

  @override
  String get rankInspector => 'Ulaştırma Müfettişi';

  @override
  String get rankDirector => 'Ulaştırma Müdürü';

  @override
  String get rankDeputyMinister => 'Ulaştırma Bakan Yardımcısı';

  @override
  String get rankMinister => 'Ulaştırma Bakanı';

  @override
  String get rankSeniorMinister => 'Kıdemli Ulaştırma Bakanı';

  @override
  String get rankRegionalGovernor => 'Bölge Ulaştırma Valisi';

  @override
  String get rankNationalLeader => 'Ulusal Altyapı Lideri';

  @override
  String get rankInternationalAuthority => 'Uluslararası Ulaştırma Otoritesi';

  @override
  String get districtOldFortress => 'Eski Kale';

  @override
  String get districtSeasideBoulevard => 'Sahil Bulvarı';

  @override
  String get districtFlameHills => 'Alev Tepeleri';

  @override
  String get districtOilHarbor => 'Petrol Limanı';

  @override
  String get districtWindHeights => 'Rüzgarlı Yamaçlar';

  @override
  String get districtCaspianGardens => 'Hazar Bahçeleri';

  @override
  String get districtOldFortressTagline => 'Dar sokaklar, eski surlar, turist kalabalığı';

  @override
  String get districtSeasideBoulevardTagline => 'Deniz kenarında yürüyüşçülerin sevdiği sahil yolu';

  @override
  String get districtFlameHillsTagline => 'Cam kuleler ve yoğun ofisler';

  @override
  String get districtOilHarborTagline => 'Vinçler, kamyonlar ve şehrin yük kapısı';

  @override
  String get districtWindHeightsTagline => 'Rüzgarlı tepelerdeki en büyük mahalle';

  @override
  String get districtCaspianGardensTagline => 'Kıyıda hızla büyüyen yeni evler';

  @override
  String hudSatisfaction(int value) {
    return '%$value';
  }

  @override
  String get hudBudgetLabel => 'Bütçe';

  @override
  String get hudDiplomacyLabel => 'Diplomasi puanı';

  @override
  String get diamondsLabel => 'Elmaslar';

  @override
  String diamondsPlus(int count) {
    return '+$count';
  }

  @override
  String get diamondsBody =>
      'Acelesi olan bakanlar için nadir mücevherler. İnşaatı anında bitirmek, beklemeyi atlamak veya görevden alınmaktan kurtulmak için harca.';

  @override
  String get diamondsEarnTitle => 'Nasıl kazanılır';

  @override
  String diamondsEarnLevel(int count) {
    return 'Her şehir seviyesi için +$count';
  }

  @override
  String diamondsEarnAchievement(int count) {
    return 'Her başarım için +$count';
  }

  @override
  String diamondsEarnStreak(int count) {
    return 'Günlük hediyenin 7. gününde +$count';
  }

  @override
  String diamondsEarnCity(int count) {
    return 'Bir şehri tamamlamak için +$count';
  }

  @override
  String get diamondsSpendTitle => 'Nasıl harcanır';

  @override
  String get boostFinishNow => 'Hemen bitir';

  @override
  String get boostDeliverNow => 'Hemen teslim et';

  @override
  String get boostReadyNow => 'Hemen hazırla';

  @override
  String get boostContinue => 'Koltuğumu koru';

  @override
  String get boostDouble => '10 dakika çift kazanç';

  @override
  String boostDoubleActive(String time) {
    return '2x kazanç · $time';
  }

  @override
  String get welcomeTitle => 'Tekrar hoş geldin Bakanım!';

  @override
  String welcomeBody(String time, String city) {
    return 'Sen $time yokken $city kazanmaya devam etti.';
  }

  @override
  String welcomeCollect(String amount) {
    return '$amount topla';
  }

  @override
  String welcomeCollectDouble(String amount) {
    return '$amount topla · video izle';
  }

  @override
  String get adsWatchContinue => 'Koltuğumu koru · video izle';

  @override
  String get adsDiamondMine => 'Elmas madeni';

  @override
  String adsDiamondMineBody(int count, int left) {
    return 'Kısa bir video için +$count · bugün $left hak kaldı';
  }

  @override
  String get adsWatch => 'İzle';

  @override
  String get shopTitle => 'Elmas dükkânı';

  @override
  String get shopStarterTitle => 'Başlangıç paketi';

  @override
  String shopStarterBody(int count, int minutes) {
    return '$count elmas ve $minutes dakika 2x kazanç. Yalnızca bir kez.';
  }

  @override
  String get shopPackHandful => 'Bir avuç elmas';

  @override
  String get shopPackBag => 'Bir torba elmas';

  @override
  String get shopPackChest => 'Bir sandık elmas';

  @override
  String get shopPopular => 'Popüler';

  @override
  String get shopBestValue => 'En avantajlı';

  @override
  String get shopSoon => 'Yakında';

  @override
  String get shopUnavailable =>
      'Google Play şu anda kullanılamıyor, bu yüzden elmas paketleri satın alınamıyor. Aşağıdan yine de elmas kazanabilirsin!';

  @override
  String get shopThanksTitle => 'Teşekkürler Bakanım!';

  @override
  String shopThanksBody(int count) {
    return 'Cüzdanına $count elmas eklendi.';
  }

  @override
  String get shopFailedTitle => 'Ücret alınmadı';

  @override
  String get shopFailedBody => 'Satın alma tamamlanamadı. Lütfen daha sonra tekrar dene.';

  @override
  String get shopEarnTitle => 'Ücretsiz kazan';

  @override
  String get diamondsGetMore => 'Daha fazla elmas al';

  @override
  String get oathTitle => 'Atama kararnamesi';

  @override
  String get oathBody =>
      'Cumhurbaşkanının emriyle bu kararnamenin sahibi Ulaştırma Bakanı olarak atanmış; şehirlerimizin otobüsleri, yolları ve metroları kendisine emanet edilmiştir.';

  @override
  String get oathSignatureLine => 'Bakanın imzası';

  @override
  String get oathSign => 'Kararnameyi imzala';

  @override
  String get oathStamp => 'ONAYLANDI';

  @override
  String get oathWelcome => 'Göreve hoş geldin Bakanım!';

  @override
  String oathGift(int count) {
    return 'Başlangıç için +$count elmas';
  }

  @override
  String get oathTakeOffice => 'Göreve başla';

  @override
  String get hudSatisfactionLabel => 'Memnuniyet';

  @override
  String get hudIncomeLabel => 'Saniyelik kazanç';

  @override
  String get hudPopulationLabel => 'Nüfus';

  @override
  String statIncome(String amount) {
    return '$amount/sn';
  }

  @override
  String get hudBackToCities => 'Şehirler';

  @override
  String get crisisGridlock => 'Trafik kilitlendi! Şehir tıkandı. Cumhurbaşkanı fark etmeden aç!';

  @override
  String get crisisAngry => 'Vatandaşlar sinirleniyor. Cumhurbaşkanı fark etmeden harekete geç!';

  @override
  String get crisisDebt => 'Bütçe derin ekside. Cumhurbaşkanı fark etmeden düzelt!';

  @override
  String crisisWarningGridlock(int level) {
    return 'Cumhurbaşkanı uyarısı $level/3: trafiği aç!';
  }

  @override
  String crisisWarningUnhappy(int level) {
    return 'Cumhurbaşkanı uyarısı $level/3: vatandaşları mutlu et!';
  }

  @override
  String crisisWarningDebt(int level) {
    return 'Cumhurbaşkanı uyarısı $level/3: bütçeyi düzelt!';
  }

  @override
  String get statWaiting => 'Bekleme';

  @override
  String get statCongestion => 'Trafik';

  @override
  String get statRoad => 'Yol';

  @override
  String get statBuses => 'Otobüs';

  @override
  String statMinutes(int minutes) {
    return '$minutes dk';
  }

  @override
  String statPercent(int value) {
    return '%$value';
  }

  @override
  String districtRidersServed(String capacity, String demand) {
    return 'Saniyede $demand yolcunun $capacity tanesini taşıyor';
  }

  @override
  String districtResidents(String count, String growth) {
    return '$count kişi · +$growth/sn';
  }

  @override
  String get ledgerTickets => 'Bilet satışı';

  @override
  String get ledgerSubsidy => 'Destek';

  @override
  String get ledgerGovernmentBudget => 'Kabine bütçesi';

  @override
  String get ledgerVehicleSales => 'Otobüs satışı';

  @override
  String get ledgerLoanReceived => 'Kredi';

  @override
  String get ledgerEnergy => 'Yakıt ve enerji';

  @override
  String get ledgerSalaries => 'Şoför maaşları';

  @override
  String get ledgerVehicleMaintenance => 'Otobüs tamiri';

  @override
  String get ledgerRoadMaintenance => 'Yol bakımı';

  @override
  String get ledgerAdministration => 'Bakanlık ofisi';

  @override
  String get ledgerLoanRepayment => 'Kredi ödemesi';

  @override
  String get ledgerVehiclePurchases => 'Yeni otobüsler';

  @override
  String get ledgerVehicleUpgrades => 'Otobüs yükseltmeleri';

  @override
  String get ledgerConstruction => 'İnşaat';

  @override
  String get projectRoadRepair => 'Yol tamiri';

  @override
  String get projectRoadExpansion => 'Yol genişletme';

  @override
  String get projectBikeLanes => 'Bisiklet yolları';

  @override
  String get projectSmartSignals => 'Akıllı trafik ışıkları';

  @override
  String get projectModernStops => 'Modern duraklar';

  @override
  String get projectCityPark => 'Şehir parkı';

  @override
  String get projectParkAndRide => 'Park Et-Devam Et';

  @override
  String get projectChargingDepot => 'Şarj garajı';

  @override
  String get projectDepotExpansion => 'Garaj genişletme';

  @override
  String get rejectInsufficientFunds => 'Bunun için bütçe yetmiyor';

  @override
  String get rejectDepotFull => 'Otobüs garajı dolu';

  @override
  String get rejectMaxLevel => 'Zaten en yüksek seviyede';

  @override
  String get rejectProjectLimit => 'Aynı anda çok fazla şantiye var';

  @override
  String get rejectAlreadyInProgress => 'Burada zaten çalışma var';

  @override
  String get rejectAlreadyBuilt => 'Bu zaten yapıldı';

  @override
  String get rejectRequiresChargingDepot => 'Önce bir şarj garajı kur';

  @override
  String get rejectInvalidTarget => 'Şu an bu mümkün değil';

  @override
  String get rejectLoanActive => 'Önce mevcut krediyi öde';

  @override
  String get rejectFareOutOfRange => 'Bu bilet fiyatına izin yok';

  @override
  String eventBusesDelivered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Filoya $count yeni otobüs katıldı',
      one: 'Filoya yeni bir otobüs katıldı',
    );
    return '$_temp0';
  }

  @override
  String eventProjectCompleted(String project) {
    return '$project hazır!';
  }

  @override
  String eventBudgetAllocated(String amount) {
    return 'Kabine $amount gönderdi';
  }

  @override
  String eventCrisisWarning(int level) {
    return 'Cumhurbaşkanı uyarısı $level/3';
  }

  @override
  String get dismissedTitle => 'Görevden alındın';

  @override
  String dismissedBody(String reason) {
    return '$reason Rütben ve başarımların seninle kalıyor. Yeni bir başlangıçla tekrar dene!';
  }

  @override
  String get dismissedGridlock => 'Bitmeyen trafik sıkışıklığı Bakü\'yü felç etti.';

  @override
  String get dismissedUnhappy => 'Bakü liderliğine olan inancını kaybetti.';

  @override
  String get dismissedDebt => 'Bakü\'nün parası bitti.';

  @override
  String get dismissedRestart => 'Baştan başla';

  @override
  String dismissedContinueHint(int count) {
    return '$count elmas harca, Cumhurbaşkanı sana bir şans daha versin.';
  }

  @override
  String get loadingCity => 'Şehir açılıyor…';

  @override
  String get loadingFailed => 'Şehir açılamadı.';

  @override
  String get commonRetry => 'Tekrar dene';

  @override
  String get mapRecenter => 'Haritayı ortala';

  @override
  String get advisorTitle => 'Mr. Bus diyor ki';

  @override
  String get advisorShowMe => 'Göster';

  @override
  String get tipNegativeBudget =>
      'Bütçemiz sıfırın altında! Cumhurbaşkanı fark etmeden bilet fiyatını biraz artır ya da eski otobüsleri sat.';

  @override
  String get tipPresidentWatching =>
      'Cumhurbaşkanı bizi izliyor. Memnuniyeti hızla artır: daha çok otobüs, daha iyi yollar!';

  @override
  String tipLongWaits(String district, int minutes) {
    return '$district bölgesinde insanlar otobüsü $minutes dakika bekliyor. Oraya otobüs ekleyelim!';
  }

  @override
  String tipBrokenRoads(String district, int condition) {
    return '$district yolları dökülüyor (%$condition). Bir tamir sürücüleri ve kamyonları mutlu eder.';
  }

  @override
  String tipTrafficJam(String district) {
    return '$district tıkandı. Bisiklet yolları yapılırken trafiği yavaşlatır ama sonra çok yardım eder.';
  }

  @override
  String get tipOldFleet =>
      'Eski otobüslerimiz sürekli bozuluyor. Yükseltmeler ya da yeni modeller şehri hareket halinde tutar.';

  @override
  String get tipAllGood => 'Her şey sakin görünüyor Bakanım! En kalabalık bölgelere göz kulak ol.';

  @override
  String get citySectionNext => 'Sıradaki şehirler';

  @override
  String cityLockedBody(String city) {
    return 'Açmak için $city şehrini tamamla.';
  }

  @override
  String cityRequirement(String city) {
    return '$city tamamla';
  }

  @override
  String cityLevelChip(int level, int target) {
    return 'Seviye $level · Hedef $target';
  }

  @override
  String get ledgerLevelRewards => 'Seviye ödülleri';

  @override
  String levelBarLabel(int level) {
    return 'Seviye $level';
  }

  @override
  String levelBarPoints(int points, int next) {
    return '$points / $next puan';
  }

  @override
  String get levelBarMax => 'En yüksek seviyeye ulaşıldı';

  @override
  String levelSheetTitle(String city) {
    return '$city gelişimi';
  }

  @override
  String get levelSheetBody =>
      'Vatandaşları mutlu ve bütçeyi büyüyen tutarak sürekli şehir puanı kazan. Yeni otobüsler, yükseltmeler, biten projeler ve akıllı kararlar ek puan verir. Her seviye bir Kabine ödülü ve diplomasi puanı getirir.';

  @override
  String levelUpTitle(String city, int level) {
    return '$city $level. seviyeye ulaştı!';
  }

  @override
  String levelUpReward(String amount, int diplomacy, int percent) {
    return 'Kabine $amount ve $diplomacy diplomasi puanı gönderdi, bütçen de %$percent büyüdü!';
  }

  @override
  String get levelUpContinue => 'Yaşasın!';

  @override
  String get eventCrisisAverted => 'Kriz atlatıldı! Cumhurbaşkanı yine sakin.';

  @override
  String get profileTitle => 'Bakan profili';

  @override
  String get profileOpen => 'Profili aç';

  @override
  String get profileReputation => 'İtibar';

  @override
  String profileXp(String xp, String next) {
    return '$xp / $next XP';
  }

  @override
  String profileXpMax(String xp) {
    return '$xp XP · En yüksek rütbe';
  }

  @override
  String get profileRanks => 'Rütbeler';

  @override
  String get profileCityBadges => 'Şehir rozetleri';

  @override
  String profileAchievements(int done, int total) {
    return 'Başarımlar $done/$total';
  }

  @override
  String get profileCareer => 'Kariyer';

  @override
  String get careerTime => 'Görev süresi';

  @override
  String get careerBuses => 'Alınan otobüsler';

  @override
  String get careerUpgrades => 'Yükseltmeler';

  @override
  String get careerProjects => 'Projeler';

  @override
  String get careerCrises => 'Atlatılan krizler';

  @override
  String get careerDismissals => 'Görevden almalar';

  @override
  String get badgeBronze => 'Bronz';

  @override
  String get badgeSilver => 'Gümüş';

  @override
  String get badgeGold => 'Altın';

  @override
  String get badgeLocked => 'Kazanılmadı';

  @override
  String badgeEarnedToast(String tier, String city) {
    return '$city şehrinde $tier rozet kazanıldı!';
  }

  @override
  String achievementToast(String title, int xp) {
    return 'Başarım açıldı: $title · +$xp XP';
  }

  @override
  String get promotedTitle => 'Terfi ettin!';

  @override
  String promotedBody(String rank) {
    return 'Artık $rank oldun. Tüm bakanlık seni selamlıyor!';
  }

  @override
  String get promotedContinue => 'Teşekkürler!';

  @override
  String get achievementFirstBusTitle => 'İlk Otobüs';

  @override
  String get achievementFirstBusDescription => 'İlk otobüsünü al.';

  @override
  String get achievementFleetBuilderTitle => 'Filo Kurucusu';

  @override
  String get achievementFleetBuilderDescription => 'Bir şehirde 40 otobüs çalıştır.';

  @override
  String get achievementModernCityTitle => 'Modern Şehir';

  @override
  String get achievementModernCityDescription =>
      'En az 20 otobüslük filoda tüm Veteran otobüsleri emekliye ayır.';

  @override
  String get achievementGreenRevolutionTitle => 'Yeşil Devrim';

  @override
  String get achievementGreenRevolutionDescription => 'İlk elektrikli otobüsünü al.';

  @override
  String get achievementUpgradeEnthusiastTitle => 'Yükseltme Tutkunu';

  @override
  String get achievementUpgradeEnthusiastDescription => 'Otobüsleri 10 kez yükselt.';

  @override
  String get achievementRoadWarriorTitle => 'Yol Savaşçısı';

  @override
  String get achievementRoadWarriorDescription => '10 yol tamiri bitir.';

  @override
  String get achievementBikeFriendlyTitle => 'Bisiklet Dostu';

  @override
  String get achievementBikeFriendlyDescription => '3 bölgede bisiklet yolu yap.';

  @override
  String get achievementInfrastructureMasterTitle => 'Altyapı Ustası';

  @override
  String get achievementInfrastructureMasterDescription => '50 inşaat projesi tamamla.';

  @override
  String get achievementEconomicStrategistTitle => 'Ekonomi Stratejisti';

  @override
  String get achievementEconomicStrategistDescription =>
      'Bütçeyi 15 dakika boyunca aralıksız büyüt.';

  @override
  String get achievementSmilingCityTitle => 'Gülümseyen Şehir';

  @override
  String get achievementSmilingCityDescription => '%60 vatandaş memnuniyetine ulaş.';

  @override
  String get achievementHappyCitizensTitle => 'Mutlu Vatandaşlar';

  @override
  String get achievementHappyCitizensDescription => '%90 vatandaş memnuniyetine ulaş.';

  @override
  String get achievementRisingCityTitle => 'Yükselen Şehir';

  @override
  String get achievementRisingCityDescription => 'Şehir seviyesi 5\'e ulaş.';

  @override
  String get achievementCityChampionTitle => 'Şehir Şampiyonu';

  @override
  String get achievementCityChampionDescription => 'Bir şehri tamamla.';

  @override
  String get achievementSurvivorTitle => 'Hayatta Kalan';

  @override
  String get achievementSurvivorDescription => 'Bir Cumhurbaşkanı uyarısından sonra toparlan.';

  @override
  String get achievementVeteranMinisterTitle => 'Deneyimli Bakan';

  @override
  String get achievementVeteranMinisterDescription => '3 saat görevde kal.';

  @override
  String get ledgerDecisions => 'Kararlar ve olaylar';

  @override
  String eventDecisionArrived(String title) {
    return 'Mr. Bus\'ın haberi var: $title';
  }

  @override
  String eventDecisionAutomatic(String title) {
    return 'Süre doldu: $title senin yerine karara bağlandı';
  }

  @override
  String get groupPassengers => 'Yolcular';

  @override
  String get groupDrivers => 'Sürücüler';

  @override
  String get groupPedestrians => 'Yayalar';

  @override
  String get groupCyclists => 'Bisikletliler';

  @override
  String get groupBusinesses => 'İşletmeler';

  @override
  String get groupTransportWorkers => 'Otobüs ekipleri';

  @override
  String get groupEnvironmentalists => 'Çevreciler';

  @override
  String get groupLogistics => 'Lojistik';

  @override
  String get busVeteran => 'Veteran 80';

  @override
  String get busHopMini => 'Hop Mini';

  @override
  String get busCityRunner => 'CityRunner 12';

  @override
  String get busMegaLink => 'MegaLink';

  @override
  String get busVoltaE => 'Volta E-12';

  @override
  String get kindRequest => 'Talep';

  @override
  String get kindOpportunity => 'Teklif';

  @override
  String get kindCrisis => 'Kriz';

  @override
  String get kindDisaster => 'Afet';

  @override
  String decisionTimeLeft(String time) {
    return '$time kaldı';
  }

  @override
  String get decisionChoose => 'Seç';

  @override
  String decisionCost(String amount) {
    return 'Maliyet $amount';
  }

  @override
  String get decisionFree => 'Ücretsiz';

  @override
  String decisionRisk(int chance) {
    return '%$chance risk:';
  }

  @override
  String get decisionResultTitle => 'Karar verildi!';

  @override
  String get decisionResultCalm => 'Her şey planlandığı gibi gitti Bakanım.';

  @override
  String get decisionResultRisk => 'Eyvah! Risk gerçekleşti. İşte olanlar:';

  @override
  String get decisionResultOk => 'Tamam';

  @override
  String get newsTitle => 'Mr. Bus\'ın haberi var';

  @override
  String newsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count karar bekliyor',
      one: '1 karar bekliyor',
    );
    return '$_temp0';
  }

  @override
  String effectMood(String group, String change) {
    return '$group $change';
  }

  @override
  String effectReputation(String change) {
    return 'İtibar $change';
  }

  @override
  String effectRoadDamage(int amount, String district) {
    return 'Yol -$amount · $district';
  }

  @override
  String effectRoadRestore(String district) {
    return 'Yol onarıldı · $district';
  }

  @override
  String effectCapacity(String change) {
    return 'Otobüs kapasitesi $change';
  }

  @override
  String effectDemand(String change) {
    return 'Yolcular $change';
  }

  @override
  String effectCongestion(String change) {
    return 'Trafik $change';
  }

  @override
  String effectSafety(String change) {
    return 'Güvenlik $change';
  }

  @override
  String effectEnergyCost(String change) {
    return 'Yakıt maliyeti $change';
  }

  @override
  String effectSalaryCost(String change) {
    return 'Maaşlar $change';
  }

  @override
  String effectTicketRevenue(String change) {
    return 'Bilet geliri $change';
  }

  @override
  String effectSubsidy(String change) {
    return 'Destek $change';
  }

  @override
  String effectExtraCost(String amount) {
    return 'Gider $amount/sn';
  }

  @override
  String effectExtraIncome(String amount) {
    return 'Gelir $amount/sn';
  }

  @override
  String effectMoodTrend(String group, String change) {
    return '$group keyfi $change';
  }

  @override
  String get effectForever => 'kalıcı';

  @override
  String effectBuses(int count, String model) {
    return '+$count $model';
  }

  @override
  String effectProject(String project) {
    return '$project başlar';
  }

  @override
  String effectDiscount(String project, int percent) {
    return '$project %$percent indirimli';
  }

  @override
  String effectLoseBuses(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count otobüs kaybı',
      one: '1 otobüs kaybı',
    );
    return '$_temp0';
  }

  @override
  String effectFare(String change) {
    return 'Bilet $change';
  }

  @override
  String decisionOvercrowdedBusesTitle(String district) {
    return '$district bölgesinde tıklım tıklım otobüsler!';
  }

  @override
  String decisionOvercrowdedBusesBody(String district) {
    return 'Bakanım, $district bölgesinde insanlar otobüslere turşu kavanozu gibi doluşuyor. Ne yapalım?';
  }

  @override
  String get decisionOvercrowdedBusesOptionA => 'Acil 3 CityRunner sipariş et';

  @override
  String get decisionOvercrowdedBusesOptionB => 'Bir süre ek seferler';

  @override
  String get decisionOvercrowdedBusesOptionC => 'İnsanlardan sabır iste';

  @override
  String decisionPotholesTitle(String district) {
    return '$district bölgesinde çukurlar!';
  }

  @override
  String decisionPotholesBody(String district) {
    return '$district yollarında peynirden çok delik var. Sürücüler çok kızgın!';
  }

  @override
  String get decisionPotholesOptionA => 'Hemen acil tamir';

  @override
  String get decisionPotholesOptionB => 'Normal bir tamir planla';

  @override
  String get decisionPotholesOptionC => 'Uyarı levhaları koy';

  @override
  String get decisionBikePetitionTitle => 'Bisiklet yolu dilekçesi';

  @override
  String decisionBikePetitionBody(String district) {
    return '$district bölgesindeki çevreciler bisiklet yolu için 10.000 imza topladı. Yeşil bir fon %30\'unu ödeyecek!';
  }

  @override
  String get decisionBikePetitionOptionA => 'Bisiklet yolu yap';

  @override
  String get decisionBikePetitionOptionB => 'Önce bir araştırma yaptır';

  @override
  String get decisionBikePetitionOptionC => 'Hayır de';

  @override
  String decisionParkingChaosTitle(String district) {
    return '$district bölgesinde park kaosu';
  }

  @override
  String decisionParkingChaosBody(String district) {
    return '$district bölgesinde arabalar kaldırımlara, otobüs şeritlerine, hatta bir fıskiyeye park edilmiş!';
  }

  @override
  String get decisionParkingChaosOptionA => 'Park ücreti getir';

  @override
  String get decisionParkingChaosOptionB => 'Katlı otopark yap';

  @override
  String get decisionParkingChaosOptionC => 'Görmezden gel';

  @override
  String get decisionDriverWagesTitle => 'Şoförler zam istiyor';

  @override
  String get decisionDriverWagesBody =>
      'Otobüs şoförlerimiz maaşlarının çok düşük olduğunu söylüyor. Sendika grevden bahsediyor...';

  @override
  String get decisionDriverWagesOptionA => 'Maaşlara %15 zam yap';

  @override
  String get decisionDriverWagesOptionB => 'Tek seferlik prim öde';

  @override
  String get decisionDriverWagesOptionC => 'Reddet';

  @override
  String get decisionTrafficAccidentTitle => 'Yoğun kavşakta kaza';

  @override
  String decisionTrafficAccidentBody(String district) {
    return '$district bölgesindeki kötü bir kaza kavşağın tehlikeli olduğunu gösterdi. İnsanlar önlem istiyor!';
  }

  @override
  String get decisionTrafficAccidentOptionA => 'Akıllı trafik ışıkları kur';

  @override
  String get decisionTrafficAccidentOptionB => 'Güvenlik kampanyası yap';

  @override
  String get decisionTrafficAccidentOptionC => 'Hiçbir şey yapma';

  @override
  String get decisionFuelSpikeTitle => 'Yakıt fiyatları %30 arttı!';

  @override
  String get decisionFuelSpikeBody => 'Mazot birden pahalandı ve otobüslerimiz çok yakıyor...';

  @override
  String get decisionFuelSpikeOptionA => 'Fiyat güvencesi al';

  @override
  String get decisionFuelSpikeOptionB => 'Bilete ek ücret koy';

  @override
  String get decisionFuelSpikeOptionC => 'Maliyete katlan';

  @override
  String get decisionBusDiscountTitle => 'Otobüs indirimi!';

  @override
  String decisionBusDiscountBody(String district) {
    return 'Silkway Motors şu an CityRunner otobüslerinde %25 indirim yapıyor. Otobüsler $district bölgesinde başlar.';
  }

  @override
  String get decisionBusDiscountOptionA => '2 otobüs al';

  @override
  String get decisionBusDiscountOptionB => '5 otobüs al';

  @override
  String get decisionBusDiscountOptionC => 'Hayır, teşekkürler';

  @override
  String get decisionPrivateOperatorTitle => 'Özel otobüs şirketi';

  @override
  String decisionPrivateOperatorBody(String district) {
    return 'Özel bir şirket, bilet gelirinden pay karşılığında $district bölgesinde ek otobüs çalıştırmak istiyor.';
  }

  @override
  String get decisionPrivateOperatorOptionA => 'Anlaşmayı kabul et';

  @override
  String get decisionPrivateOperatorOptionB => 'Daha iyi şartlar için pazarlık yap';

  @override
  String get decisionPrivateOperatorOptionC => 'Reddet';

  @override
  String get decisionBudgetHearingTitle => 'Kabine bütçe görüşmesi';

  @override
  String get decisionBudgetHearingBody =>
      'Kabine paralarını nasıl harcadığımızı bilmek istiyor. Daha fazlasını istemek için fırsat!';

  @override
  String get decisionBudgetHearingOptionA => 'Büyük bir hibe iste';

  @override
  String get decisionBudgetHearingOptionB => 'Daha büyük destek iste';

  @override
  String get decisionBudgetHearingOptionC => 'Tasarruf sözü ver';

  @override
  String get decisionBudgetHearingOptionD => 'Görüşmeye gitme';

  @override
  String get decisionFestivalTitle => 'Bulvarda festival!';

  @override
  String get decisionFestivalBody =>
      'Sahil Bulvarı\'na dev bir müzik festivali geliyor. Binlerce hayranın ulaşıma ihtiyacı olacak!';

  @override
  String get decisionFestivalOptionA => 'Özel otobüsler çalıştır';

  @override
  String get decisionFestivalOptionB => 'Bulvarı araçlara kapat';

  @override
  String get decisionFestivalOptionC => 'Her şey normal devam etsin';

  @override
  String get decisionTouristSeasonTitle => 'Turist sezonu!';

  @override
  String get decisionTouristSeasonBody =>
      'Turistler selfie çubuklarıyla Eski Kale\'ye akın ediyor. Dükkanlar mutlu, sokaklar kalabalık.';

  @override
  String get decisionTouristSeasonOptionA => 'Turist servisi başlat';

  @override
  String get decisionTouristSeasonOptionB => 'Turistlere bilet ek ücreti koy';

  @override
  String get decisionTouristSeasonOptionC => 'Hiçbir şey yapma';

  @override
  String get decisionGreenFundTitle => 'Yeşil fon teklifi';

  @override
  String get decisionGreenFundBody =>
      'Yeşil bir fon, elektrikli otobüs çalıştırabilelim diye şarj garajının %40\'ını ödeyecek!';

  @override
  String get decisionGreenFundOptionA => 'Garajı yap';

  @override
  String get decisionGreenFundOptionB => 'Şimdi değil';

  @override
  String decisionFloodTitle(String district) {
    return '$district bölgesinde sel!';
  }

  @override
  String decisionFloodBody(String district) {
    return 'Şiddetli yağmur $district sokaklarını nehre çevirdi. Otobüsler mahsur kaldı!';
  }

  @override
  String get decisionFloodOptionA => 'Pompa ve alternatif yol gönder';

  @override
  String get decisionFloodOptionB => 'Ücretsiz kurtarma servisleri';

  @override
  String get decisionFloodOptionC => 'Suyun çekilmesini bekle';

  @override
  String get decisionWindStormTitle => 'Müthiş rüzgar fırtınası!';

  @override
  String get decisionWindStormBody =>
      'Efsanevi Bakü rüzgarı şapkaları, tabelaları ve neredeyse otobüslerimizi uçuruyor!';

  @override
  String get decisionWindStormOptionA => 'Güvenlik için seferleri durdur';

  @override
  String get decisionWindStormOptionB => 'Tamir ekipleri gönder';

  @override
  String get decisionWindStormOptionC => 'Sürmeye devam et';

  @override
  String get decisionHeatwaveTitle => 'Sıcak hava dalgası: 42°C!';

  @override
  String get decisionHeatwaveBody => 'O kadar sıcak ki asfalt eriyor. Yolcular da eriyor!';

  @override
  String get decisionHeatwaveOptionA => 'Duraklarda ücretsiz su';

  @override
  String get decisionHeatwaveOptionB => 'Sadece klimalı otobüsler çalışsın';

  @override
  String get decisionHeatwaveOptionC => 'Yakında biter diye umalım';

  @override
  String get decisionEarthquakeTitle => 'Deprem!';

  @override
  String decisionEarthquakeBody(String district) {
    return 'Yer sarsıldı ve $district yolları yarıldı. Herkes korkuyor.';
  }

  @override
  String get decisionEarthquakeOptionA => 'Yolları hemen yeniden yap';

  @override
  String get decisionEarthquakeOptionB => 'Tamir planla';

  @override
  String get decisionEarthquakeOptionC => 'Beklesinler';

  @override
  String get decisionSnowstormTitle => 'Nadir kar fırtınası!';

  @override
  String get decisionSnowstormBody =>
      'Bakü\'ye kar yağdı! Çocuklar mutlu, sürücüler değil. Yollar her yerde kaygan.';

  @override
  String get decisionSnowstormOptionA => 'Kar küreme aracı kirala';

  @override
  String get decisionSnowstormOptionB => 'Sadece otobüs hatlarını temizle';

  @override
  String get decisionSnowstormOptionC => 'Hiçbir şey yapma';

  @override
  String get decisionHarborFireTitle => 'Limanda yangın!';

  @override
  String get decisionHarborFireBody =>
      'Petrol Limanı\'nda bir depo yanıyor. Duman yolların üstüne yayılıyor.';

  @override
  String get decisionHarborFireOptionA => 'Liman yollarını kapat';

  @override
  String get decisionHarborFireOptionB => 'İşçileri otobüsle tahliye et';

  @override
  String get decisionHarborFireOptionC => 'Trafiği akışta tut';

  @override
  String get decisionLandslideTitle => 'Rüzgarlı Yamaçlar\'da heyelan!';

  @override
  String get decisionLandslideBody =>
      'Kayalar Rüzgarlı Yamaçlar\'ın ana yoluna düştü. Trafik sürünüyor.';

  @override
  String get decisionLandslideOptionA => 'İş makineleriyle temizle';

  @override
  String get decisionLandslideOptionB => 'Otobüslerin güzergahını değiştir';

  @override
  String get decisionLandslideOptionC => 'Ekipleri bekle';

  @override
  String get achievementDecisiveTitle => 'Kararlı';

  @override
  String get achievementDecisiveDescription => '25 kararı kendin ver.';

  @override
  String get achievementStormChaserTitle => 'Fırtına Avcısı';

  @override
  String get achievementStormChaserDescription => '5 afetle başa çık.';

  @override
  String get careerDecisions => 'Kararlar';

  @override
  String get careerDisasters => 'Atlatılan afetler';

  @override
  String get inboxTitle => 'Gelen kutusu';

  @override
  String get inboxOpen => 'Gelen kutusunu aç';

  @override
  String get inboxEmpty => 'Henüz haber yok. Mr. Bus seni haberdar edecek!';

  @override
  String get timeJustNow => 'az önce';

  @override
  String timeMinutesAgo(int minutes) {
    return '$minutes dk önce';
  }

  @override
  String timeHoursAgo(int hours) {
    return '$hours sa önce';
  }

  @override
  String timeDaysAgo(int days) {
    return '$days gün önce';
  }

  @override
  String notificationPromotion(String rank) {
    return '$rank rütbesine terfi!';
  }

  @override
  String notificationLevelUp(String city, int level, String amount) {
    return '$city $level. seviyeye ulaştı · +$amount';
  }

  @override
  String notificationProjectIn(String project, String district) {
    return '$district bölgesinde $project hazır!';
  }

  @override
  String get ledgerRewards => 'Ödüller';

  @override
  String get dailyOpen => 'Günlük görevler';

  @override
  String get dailyTitle => 'Günlük görevler';

  @override
  String get dailyStreakTitle => 'Günlük hediye';

  @override
  String dailyStreakDay(int day) {
    return 'Gün $day/7';
  }

  @override
  String get dailyStreakDone => 'Sıradaki hediye için yarın gel!';

  @override
  String get dailyClaim => 'Al';

  @override
  String get dailyClaimed => 'Alındı';

  @override
  String get dailyComeBack => 'Her gece yarısı yeni görevler';

  @override
  String dailyReward(String money, int xp) {
    return '+$money · +$xp XP';
  }

  @override
  String dailyProgress(String progress, String target) {
    return '$progress / $target';
  }

  @override
  String taskBuyBuses(int count) {
    return '$count otobüs al';
  }

  @override
  String taskMakeDecisions(int count) {
    return '$count karar ver';
  }

  @override
  String taskRunMinutes(int count) {
    return 'Şehri $count dakika yönet';
  }

  @override
  String taskEarnTickets(String amount) {
    return 'Biletlerden $amount kazan';
  }

  @override
  String get taskFinishProject => 'Bir inşaat projesini bitir';

  @override
  String get taskRepairRoad => 'Bir yolu tamir et';

  @override
  String taskReachSatisfaction(int percent) {
    return '%$percent memnuniyete ulaş';
  }

  @override
  String get tutorialNext => 'İleri';

  @override
  String get tutorialSkip => 'Geç';

  @override
  String get tutorialFinish => 'Hadi başlayalım!';

  @override
  String get tutorialWelcomeTitle => 'Merhaba Bakanım!';

  @override
  String get tutorialWelcome =>
      'Ben Mr. Bus, ulaşım danışmanın. Sana Bakü\'yü 30 saniyede göstereyim!';

  @override
  String get tutorialBudget =>
      'Bu senin bütçen. Boş başlar: bu haritadayken Kabine sana her saniye ödeme yapar, insanlar mutluysa daha fazla. Yakıt, maaşlar ve tamirler onu eritir.';

  @override
  String get tutorialMood =>
      'Bu yüz vatandaşların ne kadar mutlu olduğunu gösterir. %30\'un altında kalırsa ya da trafik şehri kilitlerse Cumhurbaşkanı seni görevden alır!';

  @override
  String tutorialDistrict(String district) {
    return 'En uzun $district bölgesindekiler bekliyor. Haritada bul ve dokun!';
  }

  @override
  String tutorialBuyBus(String amount) {
    return 'Kabine başlaman için $amount gönderdi. Bir otobüs seç ve İmzala\'ya dokun!';
  }

  @override
  String get tutorialBusBought =>
      'Otobüsün birkaç saniye içinde gelir. Daha hızlı hizmet daha mutlu vatandaş ve daha çok para demek!';

  @override
  String tutorialLevel(int percent) {
    return 'Bakü\'yü tamamlamak için 10. seviyeye ulaş, tüm teknolojileri aç ve insanları %$percent mutlu et!';
  }

  @override
  String get tutorialNews =>
      'Burada el sallarsam haberim var: talepler, teklifler ve afetler. Kararı sen ver!';

  @override
  String get tutorialTasks => 'Günlük görevler ve günlük hediye her gün ek para getirir.';

  @override
  String get tutorialDiplomacy =>
      'Burası diplomasi. İnsanların sevdiği jestlere para harca, onlar da yeni teknoloji için puanla karşılık versin.';

  @override
  String get tutorialProfile =>
      'Dokuz rütbe tırman, başarımlar ve şehir rozetleri topla. Bol şans Bakanım!';

  @override
  String get ledgerTechnology => 'Teknoloji sözleşmeleri';

  @override
  String get rejectLocked => 'Önce Teknoloji\'den aç';

  @override
  String get rejectInsufficientDiplomacy => 'Diplomasi puanı yetmiyor';

  @override
  String get rejectAlreadyUnlocked => 'Zaten açık';

  @override
  String eventTechnologyUnlocked(String technology) {
    return 'Sözleşme imzalandı: $technology!';
  }

  @override
  String effectMaintenanceCost(String change) {
    return 'Otobüs tamiri $change';
  }

  @override
  String diplomacyAmount(int amount) {
    return '+$amount';
  }

  @override
  String get diplomacyOpen => 'Diplomasiyi aç';

  @override
  String get settingsOpen => 'Ayarları aç';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get settingsSound => 'Ses';

  @override
  String get soundMusic => 'Müzik';

  @override
  String get soundEffects => 'Ses efektleri';

  @override
  String get soundCity => 'Şehir sesleri';

  @override
  String get settingsAbout => 'Hakkında';

  @override
  String settingsVersion(String version) {
    return 'Sürüm $version';
  }

  @override
  String get diplomacyTitle => 'Diplomasi';

  @override
  String get diplomacyIntro =>
      'İnsanların sevdiği jestler para tutar ama vatandaşlar diplomasi puanıyla karşılık verir. Puanları yeni teknolojiye harca.';

  @override
  String get diplomacyTechnologyBody =>
      'Diplomasi puanlarını yeni otobüslere, yükseltmelere ve metroya harca.';

  @override
  String get diplomacyOpenTechnology => 'Teknolojiyi aç';

  @override
  String diplomacyTechnologyReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count teknoloji hazır',
      one: '1 teknoloji hazır',
    );
    return '$_temp0';
  }

  @override
  String get diplomacyActionsTitle => 'Halkın gönlünü kazan';

  @override
  String diplomacyGain(int points) {
    return '+$points diplomasi';
  }

  @override
  String diplomacyXp(int xp) {
    return '+$xp XP';
  }

  @override
  String diplomacyAct(String cost) {
    return 'Yap · $cost';
  }

  @override
  String diplomacyReadyIn(String time) {
    return '$time sonra hazır';
  }

  @override
  String get actionCheaperTickets => 'Ucuz bilet';

  @override
  String get actionCheaperTicketsBody =>
      'Bir süre her biletin bir kısmını sen öde. Yolcular bayılır ve daha çok kişi biner.';

  @override
  String get actionHackathon => 'Ulaşım hackathonu';

  @override
  String get actionHackathonBody =>
      'Genç yazılımcıları şehir ulaşımını düzeltmeye davet et. Akıllı fikirler daha çok bilet geliri getirir.';

  @override
  String get actionDriverRaise => 'Şoförlere zam';

  @override
  String get actionDriverRaiseBody =>
      'Şoförler daha mutlu çalışır ama maaşlar bir süre daha pahalı olur.';

  @override
  String get actionShopTaxBreak => 'Esnafa vergi indirimi';

  @override
  String get actionShopTaxBreakBody =>
      'Otobüs hatları boyunca dükkanların vergisini düşür. İşletmeler ve kuryeler sevinir.';

  @override
  String get actionCleanAir => 'Temiz hava kampanyası';

  @override
  String get actionCleanAirBody =>
      'Ağaç dik ve otobüsleri yıka. Daha yeşil sokaklar birçok insanı gülümsetir.';

  @override
  String get actionCityFestival => 'Şehir festivali';

  @override
  String get actionCityFestivalBody =>
      'Tüm şehir için dev bir parti. Herkes gülümser ama sokaklar bir süre kalabalık olur.';

  @override
  String decisionDiplomacyEarned(int amount) {
    return 'Vatandaşlar takdir ediyor: +$amount diplomasi puanı!';
  }

  @override
  String get technologyTitle => 'Teknoloji';

  @override
  String get technologyIntro =>
      'Mutlu vatandaşlar ve akıllı kararlar diplomasi puanı kazandırır. Sözleşme imzalamak ve yeni teknoloji açmak için onları parayla birlikte harca!';

  @override
  String get technologyUnlock => 'Aç';

  @override
  String get technologyUnlocked => 'Açıldı';

  @override
  String technologyRequires(String technology) {
    return 'Gerekli: $technology';
  }

  @override
  String get branchBuses => 'Otobüs sözleşmeleri';

  @override
  String get branchUpgrades => 'Otobüs yükseltmeleri';

  @override
  String get branchMetro => 'Metro';

  @override
  String get branchOperations => 'İşletme';

  @override
  String get techMinibusContractName => 'Hop Mini sözleşmesi';

  @override
  String get techMinibusContractDescription =>
      'Silkway Motors\'tan çevik 28 kişilik minibüsler. Ucuz ve dar sokaklar için harika.';

  @override
  String get techArticulatedContractName => 'MegaLink sözleşmesi';

  @override
  String get techArticulatedContractDescription =>
      'En kalabalık bölgeler için 150 kişilik körüklü otobüsler.';

  @override
  String get techElectricContractName => 'Volta E-12 sözleşmesi';

  @override
  String get techElectricContractDescription =>
      'Sıfır emisyonlu sessiz elektrikli otobüsler. Şarj garajı gerekir.';

  @override
  String get techEngineTuningName => 'Motor ayarı';

  @override
  String get techEngineTuningDescription =>
      'Otobüs seviyesi 2\'yi açar: daha güvenilir otobüsler ve daha ucuz tamir.';

  @override
  String get techBiggerCabinsName => 'Büyük kabinler';

  @override
  String get techBiggerCabinsDescription => 'Otobüs seviyesi 3\'ü açar: %15 daha fazla koltuk.';

  @override
  String get techComfortKitName => 'Konfor paketi';

  @override
  String get techComfortKitDescription =>
      'Otobüs seviyesi 4\'ü açar: yolcuların sevdiği klima ve yumuşak koltuklar.';

  @override
  String get techSmartBusesName => 'Akıllı otobüsler';

  @override
  String get techSmartBusesDescription =>
      'Otobüs seviyesi 5\'i açar: verimli motorlar ve daha temiz egzoz.';

  @override
  String get techMetroStudyName => 'Metro etüdü';

  @override
  String get techMetroStudyDescription => 'Mühendisler yeraltı demiryolu için zemini inceler.';

  @override
  String get techMetroContractName => 'Metro sözleşmesi';

  @override
  String get techMetroContractDescription => 'Komşu bölgeler arasında metro hatlarını açar.';

  @override
  String get techMetroAutomationName => 'Sürücüsüz metro';

  @override
  String get techMetroAutomationDescription =>
      'Sürücüsüz trenler daha sık çalışır ve daha ucuza işler.';

  @override
  String get techSmartTicketingName => 'Akıllı bilet';

  @override
  String get techSmartTicketingDescription =>
      'Temassız kartlar kaçak binişi bitirir. Bilet geliri kalıcı olarak +%8.';

  @override
  String get techEcoDrivingName => 'Ekonomik sürüş akademisi';

  @override
  String get techEcoDrivingDescription => 'Eğitimli şoförler %10 daha az yakıt ve enerji harcar.';

  @override
  String get techDepotRoboticsName => 'Garaj robotları';

  @override
  String get techDepotRoboticsDescription =>
      'Robotlar tamircilere yardım eder. Otobüs tamiri %15 daha ucuz.';

  @override
  String get achievementInnovatorTitle => 'Yenilikçi';

  @override
  String get achievementInnovatorDescription => '5 teknoloji aç.';

  @override
  String get tabBuses => 'Otobüsler';

  @override
  String get tabBuild => 'İnşa';

  @override
  String get tabMetro => 'Metro';

  @override
  String get contractsTitle => 'Sözleşme imzala';

  @override
  String contractSign(String price) {
    return 'İmzala · $price';
  }

  @override
  String get contractOpenTechnology => 'Teknoloji';

  @override
  String get contractFewer => 'Daha az otobüs';

  @override
  String get contractMore => 'Daha çok otobüs';

  @override
  String busSeats(int count) {
    return '$count koltuk';
  }

  @override
  String busRunningCost(String amount) {
    return '$amount/sn';
  }

  @override
  String busComfort(int value) {
    return 'Konfor $value';
  }

  @override
  String get ecoZero => 'Sıfır emisyon';

  @override
  String get ecoLow => 'Düşük emisyon';

  @override
  String get ecoMedium => 'Orta emisyon';

  @override
  String get ecoHigh => 'Yüksek emisyon';

  @override
  String get fleetHereTitle => 'Buradaki otobüsler';

  @override
  String get fleetEmpty => 'Burada henüz otobüs yok. Yukarıdan bir sözleşme imzala!';

  @override
  String fleetGroup(int count, String model) {
    return '$count × $model';
  }

  @override
  String fleetLevel(int level, int percent) {
    return 'Seviye $level · Güvenilirlik %$percent';
  }

  @override
  String fleetUpgrade(String price) {
    return 'Yükselt · $price';
  }

  @override
  String fleetSell(String price) {
    return 'Sat · +$price';
  }

  @override
  String get fleetMaxLevel => 'En yüksek seviye';

  @override
  String fleetMoveHere(String district) {
    return '$district bölgesinden otobüs getir';
  }

  @override
  String depotSpace(int used, int capacity) {
    return 'Garaj $used/$capacity';
  }

  @override
  String fleetOnOrder(int count) {
    return '+$count yolda';
  }

  @override
  String buildDistrictTitle(String district) {
    return '$district bölgesinde inşa et';
  }

  @override
  String get buildCityTitle => 'Şehir geneli';

  @override
  String buildAction(String price) {
    return 'İnşa et · $price';
  }

  @override
  String timeSeconds(int seconds) {
    return '$seconds sn';
  }

  @override
  String timeMinutes(int minutes) {
    return '$minutes dk';
  }

  @override
  String timeMinutesSeconds(int minutes, int seconds) {
    return '$minutes dk $seconds sn';
  }

  @override
  String timeHoursMinutes(int hours, int minutes) {
    return '$hours sa $minutes dk';
  }

  @override
  String get buildDone => 'Yapıldı';

  @override
  String get buildRoadFine => 'Yol harika durumda';

  @override
  String buildTimeLeft(String time) {
    return '$time kaldı';
  }

  @override
  String get projectRoadRepairInfo => 'Tüm çukurları kapat ve yolu %100\'e getir.';

  @override
  String get projectRoadExpansionInfo => 'Şerit ekle ki trafik kalıcı olarak daha iyi aksın.';

  @override
  String get projectBikeLanesInfo =>
      'Yapım sırasında kısa bir sıkışıklık, sonra daha az araba ve daha temiz hava.';

  @override
  String get projectSmartSignalsInfo => 'Trafiğe uyum sağlayan trafik ışıkları.';

  @override
  String get projectModernStopsInfo => 'Her durakta sundurma, ekran ve bank.';

  @override
  String get projectCityParkInfo =>
      'Ağaçlar, yürüyüş yolları ve oyun alanları. İnsanlar kısa yollarda daha çok yürür ve bisiklete biner.';

  @override
  String get projectParkAndRideInfo =>
      'Otobüs duraklarının yanında büyük bir otopark. Sürücüler arabayı bırakıp otobüse biner.';

  @override
  String get projectChargingDepotInfo => 'Elektrikli otobüsler için enerji.';

  @override
  String get projectDepotExpansionInfo => '20 otobüs daha için yer.';

  @override
  String get chipRoadFull => 'Yol %100';

  @override
  String get chipDriversHappier => 'Sürücüler daha mutlu';

  @override
  String get chipSafer => 'Daha güvenli sokaklar';

  @override
  String get chipTrafficDown => 'Daha az trafik';

  @override
  String get chipJams => 'Yapımda sıkışıklık';

  @override
  String get chipCyclists => 'Bisikletliler bayılır';

  @override
  String get chipCleanAir => 'Daha temiz hava';

  @override
  String get chipCoverage => 'Kapsama +%10';

  @override
  String get chipPassengersHappier => 'Yolcular daha mutlu';

  @override
  String get chipWalkersHappier => 'Yayalar daha mutlu';

  @override
  String get chipMoreRiders => 'Daha çok yolcu';

  @override
  String get chipElectric => 'Volta E-12 için gerekli';

  @override
  String get chipDepot => 'Garaj +20 otobüs';

  @override
  String get ledgerMetro => 'Metro';

  @override
  String get rejectTunnelBusy => 'Tünel ekibi başka bir hattı kazıyor';

  @override
  String get rejectCoolingDown => 'Henüz hazır değil';

  @override
  String eventMetroOpened(String from, String to) {
    return '$from ⇄ $to metrosu açıldı!';
  }

  @override
  String get achievementMetroPioneerTitle => 'Metro Öncüsü';

  @override
  String get achievementMetroPioneerDescription => 'İlk metro hattını aç.';

  @override
  String metroIntro(String riders, String cost) {
    return 'Her istasyon saniyede $riders yolcu taşır, trafik sıkışıklığı olmadan. Bir hattın işletmesi $cost/sn.';
  }

  @override
  String get metroTeaser => 'Komşu bölgelere tünel kaz: bol yolcu, sıfır trafik.';

  @override
  String metroLinesTitle(String district) {
    return '$district bölgesinden hatlar';
  }

  @override
  String metroLineTo(String district) {
    return '$district yönüne';
  }

  @override
  String get metroOpen => 'Açık';

  @override
  String metroDig(String price) {
    return 'Kaz · $price';
  }

  @override
  String metroWaitingThere(int minutes) {
    return 'Orada bekleme: $minutes dk';
  }

  @override
  String levelBarGoal(int done, int total) {
    return 'Hedef $done/$total';
  }

  @override
  String get levelBarComplete => 'Tamamlandı';

  @override
  String get goalTitle => 'Şehir hedefi';

  @override
  String goalLevel(int level) {
    return '$level. seviyeye ulaş';
  }

  @override
  String goalLevelProgress(int level, int target) {
    return 'Seviye $level/$target';
  }

  @override
  String get goalTechnologies => 'Tüm teknolojileri aç';

  @override
  String goalTechnologyProgress(int count, int total) {
    return '$count/$total';
  }

  @override
  String goalHappiness(int percent) {
    return 'Vatandaşları %$percent mutlu et';
  }

  @override
  String goalHappinessProgress(int percent) {
    return '%$percent';
  }

  @override
  String goalUnlocks(String city, String next) {
    return '$next şehrini açmak için $city şehrini tamamla.';
  }

  @override
  String cityCompleteTitle(String city) {
    return '$city tamamlandı!';
  }

  @override
  String get cityCompleteBody =>
      'Tüm teknolojiler senin ve vatandaşlar şehirlerini seviyor. Yeni şehirler çok yakında!';
}
