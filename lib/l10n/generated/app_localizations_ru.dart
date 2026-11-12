// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Transport Minister';

  @override
  String get appTagline => 'Двигай город. Завоюй людей.';

  @override
  String get commonBack => 'Назад';

  @override
  String get commonGotIt => 'Понятно';

  @override
  String get splashTitleTop => 'Transport';

  @override
  String get splashTitleBottom => 'Minister';

  @override
  String get splashLoading => 'Готовим город…';

  @override
  String get citySelectionTitle => 'Выбери свой город';

  @override
  String get citySelectionSubtitle => 'Где ты будешь министром транспорта?';

  @override
  String get cityPlay => 'Играть';

  @override
  String get cityStatusPlayable => 'Доступен';

  @override
  String get cityStatusComingSoon => 'Скоро';

  @override
  String cityComingSoonTitle(String city) {
    return '$city уже в пути!';
  }

  @override
  String get cityComingSoonBody =>
      'Мы ещё рисуем его улицы и расписания. А пока развивай карьеру в Баку.';

  @override
  String cityLockedTitle(String city) {
    return '$city закрыт';
  }

  @override
  String get cityFeatureBuses => 'Автобусы';

  @override
  String get cityFeatureRoads => 'Дороги';

  @override
  String get cityFeatureBikeLanes => 'Велодорожки';

  @override
  String get cityBakuName => 'Баку';

  @override
  String get cityBakuTagline => 'Ветреная столица на берегу Каспия';

  @override
  String get cityIstanbulName => 'Стамбул';

  @override
  String get cityIstanbulTagline => 'Два континента, одна пробка';

  @override
  String get cityLondonName => 'Лондон';

  @override
  String get cityLondonTagline => 'Двухэтажные автобусы и дождливый час пик';

  @override
  String get cityTokyoName => 'Токио';

  @override
  String get cityTokyoTagline => 'Самые загруженные станции на Земле';

  @override
  String get cityNewYorkName => 'Нью-Йорк';

  @override
  String get cityNewYorkTagline => 'Город, который никогда не паркуется';

  @override
  String get rankJuniorOfficial => 'Младший транспортный служащий';

  @override
  String get rankInspector => 'Транспортный инспектор';

  @override
  String get rankDirector => 'Директор транспорта';

  @override
  String get rankDeputyMinister => 'Заместитель министра транспорта';

  @override
  String get rankMinister => 'Министр транспорта';

  @override
  String get rankSeniorMinister => 'Старший министр транспорта';

  @override
  String get rankRegionalGovernor => 'Региональный губернатор транспорта';

  @override
  String get rankNationalLeader => 'Национальный лидер инфраструктуры';

  @override
  String get rankInternationalAuthority => 'Международный транспортный авторитет';

  @override
  String get districtOldFortress => 'Старая крепость';

  @override
  String get districtSeasideBoulevard => 'Приморский бульвар';

  @override
  String get districtFlameHills => 'Огненные холмы';

  @override
  String get districtOilHarbor => 'Нефтяная гавань';

  @override
  String get districtWindHeights => 'Ветреные высоты';

  @override
  String get districtCaspianGardens => 'Каспийские сады';

  @override
  String get districtOldFortressTagline => 'Узкие улочки, древние стены, толпы туристов';

  @override
  String get districtSeasideBoulevardTagline => 'Набережная у моря, любимая пешеходами';

  @override
  String get districtFlameHillsTagline => 'Стеклянные башни и шумные офисы';

  @override
  String get districtOilHarborTagline => 'Краны, грузовики и грузовые ворота города';

  @override
  String get districtWindHeightsTagline => 'Самый большой район на ветреных холмах';

  @override
  String get districtCaspianGardensTagline => 'Новые дома быстро растут у берега';

  @override
  String hudSatisfaction(int value) {
    return '$value%';
  }

  @override
  String get hudBudgetLabel => 'Бюджет';

  @override
  String get hudDiplomacyLabel => 'Очки дипломатии';

  @override
  String get hudSatisfactionLabel => 'Довольство';

  @override
  String get hudIncomeLabel => 'Доход в секунду';

  @override
  String get hudPopulationLabel => 'Жители';

  @override
  String statIncome(String amount) {
    return '$amount/с';
  }

  @override
  String get hudBackToCities => 'Города';

  @override
  String get crisisGridlock =>
      'Коллапс! Пробки душат город. Разгони их, пока Президент не заметил!';

  @override
  String get crisisAngry => 'Жители злятся. Действуй, пока Президент не заметил!';

  @override
  String get crisisDebt => 'Бюджет глубоко в минусе. Исправь это, пока Президент не заметил!';

  @override
  String crisisWarningGridlock(int level) {
    return 'Предупреждение Президента $level/3: разгони пробки!';
  }

  @override
  String crisisWarningUnhappy(int level) {
    return 'Предупреждение Президента $level/3: порадуй жителей!';
  }

  @override
  String crisisWarningDebt(int level) {
    return 'Предупреждение Президента $level/3: исправь бюджет!';
  }

  @override
  String get statWaiting => 'Ожидание';

  @override
  String get statCongestion => 'Трафик';

  @override
  String get statRoad => 'Дорога';

  @override
  String get statBuses => 'Автобусы';

  @override
  String statMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String statPercent(int value) {
    return '$value%';
  }

  @override
  String districtRidersServed(String capacity, String demand) {
    return 'Везёт $capacity из $demand пассажиров в секунду';
  }

  @override
  String districtResidents(String count, String growth) {
    return '$count жителей · +$growth/с';
  }

  @override
  String get ledgerTickets => 'Продажа билетов';

  @override
  String get ledgerSubsidy => 'Субсидия';

  @override
  String get ledgerGovernmentBudget => 'Бюджет правительства';

  @override
  String get ledgerVehicleSales => 'Продажа автобусов';

  @override
  String get ledgerLoanReceived => 'Кредит';

  @override
  String get ledgerEnergy => 'Топливо и энергия';

  @override
  String get ledgerSalaries => 'Зарплаты водителей';

  @override
  String get ledgerVehicleMaintenance => 'Ремонт автобусов';

  @override
  String get ledgerRoadMaintenance => 'Содержание дорог';

  @override
  String get ledgerAdministration => 'Офис министерства';

  @override
  String get ledgerLoanRepayment => 'Выплата кредита';

  @override
  String get ledgerVehiclePurchases => 'Новые автобусы';

  @override
  String get ledgerVehicleUpgrades => 'Улучшения автобусов';

  @override
  String get ledgerConstruction => 'Стройка';

  @override
  String get projectRoadRepair => 'Ремонт дороги';

  @override
  String get projectRoadExpansion => 'Расширение дороги';

  @override
  String get projectBikeLanes => 'Велодорожки';

  @override
  String get projectSmartSignals => 'Умные светофоры';

  @override
  String get projectModernStops => 'Современные остановки';

  @override
  String get projectCityPark => 'Городской парк';

  @override
  String get projectParkAndRide => 'Перехватывающая парковка';

  @override
  String get projectChargingDepot => 'Зарядное депо';

  @override
  String get projectDepotExpansion => 'Расширение депо';

  @override
  String get rejectInsufficientFunds => 'Не хватает бюджета';

  @override
  String get rejectDepotFull => 'Автобусное депо заполнено';

  @override
  String get rejectMaxLevel => 'Уже максимальный уровень';

  @override
  String get rejectProjectLimit => 'Слишком много строек одновременно';

  @override
  String get rejectAlreadyInProgress => 'Здесь уже идут работы';

  @override
  String get rejectAlreadyBuilt => 'Это уже построено';

  @override
  String get rejectRequiresChargingDepot => 'Сначала построй зарядное депо';

  @override
  String get rejectInvalidTarget => 'Сейчас это невозможно';

  @override
  String get rejectLoanActive => 'Сначала погаси текущий кредит';

  @override
  String get rejectFareOutOfRange => 'Такая цена билета недопустима';

  @override
  String eventBusesDelivered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count новых автобуса пополнили парк',
      many: '$count новых автобусов пополнили парк',
      few: '$count новых автобуса пополнили парк',
      one: '$count новый автобус пополнил парк',
    );
    return '$_temp0';
  }

  @override
  String eventProjectCompleted(String project) {
    return '$project готово!';
  }

  @override
  String eventBudgetAllocated(String amount) {
    return 'Правительство прислало $amount';
  }

  @override
  String eventCrisisWarning(int level) {
    return 'Предупреждение Президента $level/3';
  }

  @override
  String get dismissedTitle => 'Тебя сняли с должности';

  @override
  String dismissedBody(String reason) {
    return '$reason Звание и достижения остаются с тобой. Попробуй снова с чистого листа!';
  }

  @override
  String get dismissedGridlock => 'Бесконечные пробки парализовали Баку.';

  @override
  String get dismissedUnhappy => 'Баку потерял веру в твоё руководство.';

  @override
  String get dismissedDebt => 'У Баку закончились деньги.';

  @override
  String get dismissedRestart => 'Начать заново';

  @override
  String get loadingCity => 'Открываем город…';

  @override
  String get loadingFailed => 'Не удалось открыть город.';

  @override
  String get commonRetry => 'Попробовать снова';

  @override
  String get mapRecenter => 'Центрировать карту';

  @override
  String get advisorTitle => 'Mr. Bus говорит';

  @override
  String get advisorShowMe => 'Показать';

  @override
  String get tipNegativeBudget =>
      'Наш бюджет ниже нуля! Немного подними цену билета или продай старые автобусы, пока Президент не заметил.';

  @override
  String get tipPresidentWatching =>
      'Президент следит за нами. Быстро подними довольство: больше автобусов и лучше дороги!';

  @override
  String tipLongWaits(String district, int minutes) {
    return 'В районе $district люди ждут автобус $minutes минут. Давай добавим туда автобусы!';
  }

  @override
  String tipBrokenRoads(String district, int condition) {
    return 'Дороги в районе $district разрушаются ($condition%). Ремонт порадует водителей и грузовики.';
  }

  @override
  String tipTrafficJam(String district) {
    return '$district стоит в пробке. Велодорожки мешают движению во время стройки, но потом очень помогают.';
  }

  @override
  String get tipOldFleet =>
      'Наши старые автобусы постоянно ломаются. Улучшения или новые модели помогут городу двигаться.';

  @override
  String get tipAllGood => 'Всё спокойно, Министр! Присматривай за самыми загруженными районами.';

  @override
  String get citySectionNext => 'Следующие города';

  @override
  String cityLockedBody(String city) {
    return 'Заверши $city, чтобы открыть его.';
  }

  @override
  String cityRequirement(String city) {
    return 'Заверши $city';
  }

  @override
  String cityLevelChip(int level, int target) {
    return 'Уровень $level · Цель $target';
  }

  @override
  String get ledgerLevelRewards => 'Награды за уровни';

  @override
  String levelBarLabel(int level) {
    return 'Уровень $level';
  }

  @override
  String levelBarPoints(int points, int next) {
    return '$points / $next очк.';
  }

  @override
  String get levelBarMax => 'Достигнут максимальный уровень';

  @override
  String levelSheetTitle(String city) {
    return 'Развитие: $city';
  }

  @override
  String get levelSheetBody =>
      'Получай очки города постоянно: держи жителей довольными, а бюджет растущим. Новые автобусы, улучшения, завершённые проекты и мудрые решения дают дополнительные очки. Каждый уровень приносит премию правительства и очки дипломатии.';

  @override
  String levelUpTitle(String city, int level) {
    return '$city достиг уровня $level!';
  }

  @override
  String levelUpReward(String amount, int diplomacy, int percent) {
    return 'Правительство присылает $amount и $diplomacy очков дипломатии, а твой бюджет растёт на $percent%!';
  }

  @override
  String get levelUpContinue => 'Ура!';

  @override
  String get eventCrisisAverted => 'Кризис предотвращён! Президент снова спокоен.';

  @override
  String get profileTitle => 'Профиль министра';

  @override
  String get profileOpen => 'Открыть профиль';

  @override
  String get profileReputation => 'Репутация';

  @override
  String profileXp(String xp, String next) {
    return '$xp / $next XP';
  }

  @override
  String profileXpMax(String xp) {
    return '$xp XP · Высшее звание';
  }

  @override
  String get profileRanks => 'Звания';

  @override
  String get profileCityBadges => 'Значки городов';

  @override
  String profileAchievements(int done, int total) {
    return 'Достижения $done/$total';
  }

  @override
  String get profileCareer => 'Карьера';

  @override
  String get careerTime => 'Время в должности';

  @override
  String get careerBuses => 'Куплено автобусов';

  @override
  String get careerUpgrades => 'Улучшения';

  @override
  String get careerProjects => 'Проекты';

  @override
  String get careerCrises => 'Предотвращено кризисов';

  @override
  String get careerDismissals => 'Отставки';

  @override
  String get badgeBronze => 'Бронза';

  @override
  String get badgeSilver => 'Серебро';

  @override
  String get badgeGold => 'Золото';

  @override
  String get badgeLocked => 'Не получен';

  @override
  String badgeEarnedToast(String tier, String city) {
    return 'Получен значок «$tier» в городе $city!';
  }

  @override
  String achievementToast(String title, int xp) {
    return 'Достижение открыто: $title · +$xp XP';
  }

  @override
  String get promotedTitle => 'Повышение!';

  @override
  String promotedBody(String rank) {
    return 'Теперь ты — $rank. Всё министерство приветствует тебя!';
  }

  @override
  String get promotedContinue => 'Спасибо!';

  @override
  String get achievementFirstBusTitle => 'Первый автобус';

  @override
  String get achievementFirstBusDescription => 'Купи свой первый автобус.';

  @override
  String get achievementFleetBuilderTitle => 'Строитель парка';

  @override
  String get achievementFleetBuilderDescription => 'Держи 40 автобусов в одном городе.';

  @override
  String get achievementModernCityTitle => 'Современный город';

  @override
  String get achievementModernCityDescription =>
      'Спиши все автобусы Veteran в парке из 20 и более машин.';

  @override
  String get achievementGreenRevolutionTitle => 'Зелёная революция';

  @override
  String get achievementGreenRevolutionDescription => 'Купи свой первый электробус.';

  @override
  String get achievementUpgradeEnthusiastTitle => 'Любитель улучшений';

  @override
  String get achievementUpgradeEnthusiastDescription => 'Улучши автобусы 10 раз.';

  @override
  String get achievementRoadWarriorTitle => 'Воин дорог';

  @override
  String get achievementRoadWarriorDescription => 'Заверши 10 ремонтов дорог.';

  @override
  String get achievementBikeFriendlyTitle => 'Друг велосипедистов';

  @override
  String get achievementBikeFriendlyDescription => 'Построй велодорожки в 3 районах.';

  @override
  String get achievementInfrastructureMasterTitle => 'Мастер инфраструктуры';

  @override
  String get achievementInfrastructureMasterDescription => 'Заверши 50 строительных проектов.';

  @override
  String get achievementEconomicStrategistTitle => 'Экономический стратег';

  @override
  String get achievementEconomicStrategistDescription => 'Держи бюджет в росте 15 минут подряд.';

  @override
  String get achievementSmilingCityTitle => 'Улыбчивый город';

  @override
  String get achievementSmilingCityDescription => 'Достигни 60% довольства жителей.';

  @override
  String get achievementHappyCitizensTitle => 'Счастливые жители';

  @override
  String get achievementHappyCitizensDescription => 'Достигни 90% довольства жителей.';

  @override
  String get achievementRisingCityTitle => 'Растущий город';

  @override
  String get achievementRisingCityDescription => 'Достигни 5-го уровня города.';

  @override
  String get achievementCityChampionTitle => 'Чемпион города';

  @override
  String get achievementCityChampionDescription => 'Заверши город.';

  @override
  String get achievementSurvivorTitle => 'Выживший';

  @override
  String get achievementSurvivorDescription => 'Восстановись после предупреждения Президента.';

  @override
  String get achievementVeteranMinisterTitle => 'Опытный министр';

  @override
  String get achievementVeteranMinisterDescription => 'Проработай в должности 3 часа.';

  @override
  String get ledgerDecisions => 'Решения и события';

  @override
  String eventDecisionArrived(String title) {
    return 'У Mr. Bus новости: $title';
  }

  @override
  String eventDecisionAutomatic(String title) {
    return 'Время вышло: решение «$title» принято за тебя';
  }

  @override
  String get groupPassengers => 'Пассажиры';

  @override
  String get groupDrivers => 'Водители';

  @override
  String get groupPedestrians => 'Пешеходы';

  @override
  String get groupCyclists => 'Велосипедисты';

  @override
  String get groupBusinesses => 'Бизнес';

  @override
  String get groupTransportWorkers => 'Экипажи автобусов';

  @override
  String get groupEnvironmentalists => 'Экологи';

  @override
  String get groupLogistics => 'Логистика';

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
  String get kindRequest => 'Просьба';

  @override
  String get kindOpportunity => 'Предложение';

  @override
  String get kindCrisis => 'Кризис';

  @override
  String get kindDisaster => 'Бедствие';

  @override
  String decisionTimeLeft(String time) {
    return 'Осталось $time';
  }

  @override
  String get decisionChoose => 'Выбрать';

  @override
  String decisionCost(String amount) {
    return 'Цена $amount';
  }

  @override
  String get decisionFree => 'Бесплатно';

  @override
  String decisionRisk(int chance) {
    return 'Риск $chance%:';
  }

  @override
  String get decisionResultTitle => 'Решение принято!';

  @override
  String get decisionResultCalm => 'Всё прошло по плану, Министр.';

  @override
  String get decisionResultRisk => 'Ой! Риск сработал. Вот что случилось:';

  @override
  String get decisionResultOk => 'ОК';

  @override
  String get newsTitle => 'У Mr. Bus новости';

  @override
  String newsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ждут $count решения',
      many: 'Ждут $count решений',
      few: 'Ждут $count решения',
      one: 'Ждёт $count решение',
    );
    return '$_temp0';
  }

  @override
  String effectMood(String group, String change) {
    return '$group $change';
  }

  @override
  String effectReputation(String change) {
    return 'Репутация $change';
  }

  @override
  String effectRoadDamage(int amount, String district) {
    return 'Дорога -$amount · $district';
  }

  @override
  String effectRoadRestore(String district) {
    return 'Дорога отремонтирована · $district';
  }

  @override
  String effectCapacity(String change) {
    return 'Вместимость автобусов $change';
  }

  @override
  String effectDemand(String change) {
    return 'Пассажиры $change';
  }

  @override
  String effectCongestion(String change) {
    return 'Трафик $change';
  }

  @override
  String effectSafety(String change) {
    return 'Безопасность $change';
  }

  @override
  String effectEnergyCost(String change) {
    return 'Цена топлива $change';
  }

  @override
  String effectSalaryCost(String change) {
    return 'Зарплаты $change';
  }

  @override
  String effectTicketRevenue(String change) {
    return 'Доход от билетов $change';
  }

  @override
  String effectSubsidy(String change) {
    return 'Субсидия $change';
  }

  @override
  String effectExtraCost(String amount) {
    return 'Расход $amount/с';
  }

  @override
  String effectExtraIncome(String amount) {
    return 'Доход $amount/с';
  }

  @override
  String effectMoodTrend(String group, String change) {
    return 'Настроение: $group $change';
  }

  @override
  String get effectForever => 'навсегда';

  @override
  String effectBuses(int count, String model) {
    return '+$count $model';
  }

  @override
  String effectProject(String project) {
    return 'Начать: $project';
  }

  @override
  String effectDiscount(String project, int percent) {
    return '$project: скидка $percent%';
  }

  @override
  String effectLoseBuses(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Потеря $count автобуса',
      many: 'Потеря $count автобусов',
      few: 'Потеря $count автобусов',
      one: 'Потеря $count автобуса',
    );
    return '$_temp0';
  }

  @override
  String effectFare(String change) {
    return 'Билет $change';
  }

  @override
  String decisionOvercrowdedBusesTitle(String district) {
    return 'Битком набитые автобусы: $district!';
  }

  @override
  String decisionOvercrowdedBusesBody(String district) {
    return 'Министр, в районе $district люди набиваются в автобусы, как огурцы в банку. Что делаем?';
  }

  @override
  String get decisionOvercrowdedBusesOptionA => 'Срочно заказать 3 CityRunner';

  @override
  String get decisionOvercrowdedBusesOptionB => 'Дополнительные смены на время';

  @override
  String get decisionOvercrowdedBusesOptionC => 'Попросить людей потерпеть';

  @override
  String decisionPotholesTitle(String district) {
    return 'Ямы на дорогах: $district!';
  }

  @override
  String decisionPotholesBody(String district) {
    return 'На дорогах района $district дыр больше, чем в сыре. Водители в ярости!';
  }

  @override
  String get decisionPotholesOptionA => 'Срочный ремонт сейчас';

  @override
  String get decisionPotholesOptionB => 'Запланировать обычный ремонт';

  @override
  String get decisionPotholesOptionC => 'Поставить знаки';

  @override
  String get decisionBikePetitionTitle => 'Петиция за велодорожки';

  @override
  String decisionBikePetitionBody(String district) {
    return 'Экоактивисты района $district собрали 10 000 подписей за велодорожки. Зелёный фонд оплатит 30%!';
  }

  @override
  String get decisionBikePetitionOptionA => 'Построить велодорожки';

  @override
  String get decisionBikePetitionOptionB => 'Сначала заказать исследование';

  @override
  String get decisionBikePetitionOptionC => 'Отказать';

  @override
  String decisionParkingChaosTitle(String district) {
    return 'Парковочный хаос: $district';
  }

  @override
  String decisionParkingChaosBody(String district) {
    return 'В районе $district машины стоят на тротуарах, на автобусных полосах и даже на фонтане!';
  }

  @override
  String get decisionParkingChaosOptionA => 'Ввести платную парковку';

  @override
  String get decisionParkingChaosOptionB => 'Построить паркинг';

  @override
  String get decisionParkingChaosOptionC => 'Закрыть на это глаза';

  @override
  String get decisionDriverWagesTitle => 'Водители просят прибавку';

  @override
  String get decisionDriverWagesBody =>
      'Наши водители говорят, что зарплаты слишком низкие. Профсоюз шепчется о забастовке...';

  @override
  String get decisionDriverWagesOptionA => 'Поднять зарплаты на 15%';

  @override
  String get decisionDriverWagesOptionB => 'Выплатить разовую премию';

  @override
  String get decisionDriverWagesOptionC => 'Отказать';

  @override
  String get decisionTrafficAccidentTitle => 'Авария на оживлённом перекрёстке';

  @override
  String decisionTrafficAccidentBody(String district) {
    return 'Серьёзная авария в районе $district показала, что перекрёсток опасен. Люди требуют мер!';
  }

  @override
  String get decisionTrafficAccidentOptionA => 'Поставить умные светофоры';

  @override
  String get decisionTrafficAccidentOptionB => 'Провести кампанию безопасности';

  @override
  String get decisionTrafficAccidentOptionC => 'Ничего не делать';

  @override
  String get decisionFuelSpikeTitle => 'Топливо подорожало на 30%!';

  @override
  String get decisionFuelSpikeBody =>
      'Дизель внезапно подорожал, а наши автобусы пьют его много...';

  @override
  String get decisionFuelSpikeOptionA => 'Купить страховку цены';

  @override
  String get decisionFuelSpikeOptionB => 'Добавить надбавку к билету';

  @override
  String get decisionFuelSpikeOptionC => 'Взять расходы на себя';

  @override
  String get decisionBusDiscountTitle => 'Распродажа автобусов!';

  @override
  String decisionBusDiscountBody(String district) {
    return 'Silkway Motors прямо сейчас продаёт автобусы CityRunner со скидкой 25%. Они начнут работу в районе $district.';
  }

  @override
  String get decisionBusDiscountOptionA => 'Купить 2 автобуса';

  @override
  String get decisionBusDiscountOptionB => 'Купить 5 автобусов';

  @override
  String get decisionBusDiscountOptionC => 'Нет, спасибо';

  @override
  String get decisionPrivateOperatorTitle => 'Частная автобусная компания';

  @override
  String decisionPrivateOperatorBody(String district) {
    return 'Частная компания хочет пустить дополнительные автобусы в районе $district за долю от продажи билетов.';
  }

  @override
  String get decisionPrivateOperatorOptionA => 'Принять сделку';

  @override
  String get decisionPrivateOperatorOptionB => 'Выторговать условия получше';

  @override
  String get decisionPrivateOperatorOptionC => 'Отказаться';

  @override
  String get decisionBudgetHearingTitle => 'Бюджетные слушания';

  @override
  String get decisionBudgetHearingBody =>
      'Правительство хочет знать, как мы тратим деньги. Наш шанс попросить больше!';

  @override
  String get decisionBudgetHearingOptionA => 'Попросить крупный грант';

  @override
  String get decisionBudgetHearingOptionB => 'Попросить большую субсидию';

  @override
  String get decisionBudgetHearingOptionC => 'Пообещать экономию';

  @override
  String get decisionBudgetHearingOptionD => 'Пропустить слушания';

  @override
  String get decisionFestivalTitle => 'Фестиваль на бульваре!';

  @override
  String get decisionFestivalBody =>
      'На Приморский бульвар едет огромный музыкальный фестиваль. Тысячам фанатов нужно будет доехать!';

  @override
  String get decisionFestivalOptionA => 'Пустить спецавтобусы';

  @override
  String get decisionFestivalOptionB => 'Закрыть бульвар для машин';

  @override
  String get decisionFestivalOptionC => 'Всё как обычно';

  @override
  String get decisionTouristSeasonTitle => 'Туристический сезон!';

  @override
  String get decisionTouristSeasonBody =>
      'Туристы с селфи-палками заполонили Старую крепость. Магазины рады, улицы переполнены.';

  @override
  String get decisionTouristSeasonOptionA => 'Запустить туристический шаттл';

  @override
  String get decisionTouristSeasonOptionB => 'Ввести туристическую надбавку к билету';

  @override
  String get decisionTouristSeasonOptionC => 'Ничего не делать';

  @override
  String get decisionGreenFundTitle => 'Предложение зелёного фонда';

  @override
  String get decisionGreenFundBody =>
      'Зелёный фонд оплатит 40% зарядного депо, чтобы мы могли пустить электробусы!';

  @override
  String get decisionGreenFundOptionA => 'Построить депо';

  @override
  String get decisionGreenFundOptionB => 'Не сейчас';

  @override
  String decisionFloodTitle(String district) {
    return 'Наводнение: $district!';
  }

  @override
  String decisionFloodBody(String district) {
    return 'Ливень превратил улицы района $district в реки. Автобусы застряли!';
  }

  @override
  String get decisionFloodOptionA => 'Отправить насосы и объезды';

  @override
  String get decisionFloodOptionB => 'Бесплатные спасательные шаттлы';

  @override
  String get decisionFloodOptionC => 'Ждать, пока вода уйдёт';

  @override
  String get decisionWindStormTitle => 'Мощная буря!';

  @override
  String get decisionWindStormBody =>
      'Легендарный бакинский ветер сдувает шляпы, вывески и чуть не наши автобусы!';

  @override
  String get decisionWindStormOptionA => 'Остановить рейсы ради безопасности';

  @override
  String get decisionWindStormOptionB => 'Отправить ремонтные бригады';

  @override
  String get decisionWindStormOptionC => 'Продолжать ездить';

  @override
  String get decisionHeatwaveTitle => 'Жара: 42°C!';

  @override
  String get decisionHeatwaveBody => 'Так жарко, что плавится асфальт. Пассажиры тоже плавятся!';

  @override
  String get decisionHeatwaveOptionA => 'Бесплатная вода на остановках';

  @override
  String get decisionHeatwaveOptionB => 'Пустить только автобусы с кондиционером';

  @override
  String get decisionHeatwaveOptionC => 'Надеяться, что скоро пройдёт';

  @override
  String get decisionEarthquakeTitle => 'Землетрясение!';

  @override
  String decisionEarthquakeBody(String district) {
    return 'Земля задрожала, и дороги района $district треснули. Все напуганы.';
  }

  @override
  String get decisionEarthquakeOptionA => 'Сразу восстановить дороги';

  @override
  String get decisionEarthquakeOptionB => 'Запланировать ремонт';

  @override
  String get decisionEarthquakeOptionC => 'Пусть подождут';

  @override
  String get decisionSnowstormTitle => 'Редкая метель!';

  @override
  String get decisionSnowstormBody =>
      'Снег в Баку! Дети рады, водители — нет. Дороги скользкие повсюду.';

  @override
  String get decisionSnowstormOptionA => 'Арендовать снегоуборщики';

  @override
  String get decisionSnowstormOptionB => 'Чистить только автобусные маршруты';

  @override
  String get decisionSnowstormOptionC => 'Ничего не делать';

  @override
  String get decisionHarborFireTitle => 'Пожар в гавани!';

  @override
  String get decisionHarborFireBody => 'В Нефтяной гавани горит склад. Дым тянется над дорогами.';

  @override
  String get decisionHarborFireOptionA => 'Закрыть дороги у гавани';

  @override
  String get decisionHarborFireOptionB => 'Эвакуировать рабочих автобусами';

  @override
  String get decisionHarborFireOptionC => 'Не останавливать движение';

  @override
  String get decisionLandslideTitle => 'Оползень в Ветреных высотах!';

  @override
  String get decisionLandslideBody =>
      'Камни сползли на главную дорогу Ветреных высот. Машины ползут.';

  @override
  String get decisionLandslideOptionA => 'Расчистить тяжёлой техникой';

  @override
  String get decisionLandslideOptionB => 'Перенаправить автобусы';

  @override
  String get decisionLandslideOptionC => 'Ждать бригады';

  @override
  String get achievementDecisiveTitle => 'Решительный';

  @override
  String get achievementDecisiveDescription => 'Прими 25 решений сам.';

  @override
  String get achievementStormChaserTitle => 'Охотник за бурями';

  @override
  String get achievementStormChaserDescription => 'Справься с 5 бедствиями.';

  @override
  String get careerDecisions => 'Решения';

  @override
  String get careerDisasters => 'Пережито бедствий';

  @override
  String get inboxTitle => 'Входящие';

  @override
  String get inboxOpen => 'Открыть входящие';

  @override
  String get inboxEmpty => 'Новостей пока нет. Mr. Bus будет держать тебя в курсе!';

  @override
  String get timeJustNow => 'только что';

  @override
  String timeMinutesAgo(int minutes) {
    return '$minutes мин назад';
  }

  @override
  String timeHoursAgo(int hours) {
    return '$hours ч назад';
  }

  @override
  String timeDaysAgo(int days) {
    return '$days дн. назад';
  }

  @override
  String notificationPromotion(String rank) {
    return 'Повышение до звания «$rank»!';
  }

  @override
  String notificationLevelUp(String city, int level, String amount) {
    return '$city достиг уровня $level · +$amount';
  }

  @override
  String notificationProjectIn(String project, String district) {
    return '$project готово в районе $district!';
  }

  @override
  String get ledgerRewards => 'Награды';

  @override
  String get dailyOpen => 'Ежедневные задания';

  @override
  String get dailyTitle => 'Ежедневные задания';

  @override
  String get dailyStreakTitle => 'Ежедневный подарок';

  @override
  String dailyStreakDay(int day) {
    return 'День $day из 7';
  }

  @override
  String get dailyStreakDone => 'Возвращайся завтра за следующим подарком!';

  @override
  String get dailyClaim => 'Забрать';

  @override
  String get dailyClaimed => 'Получено';

  @override
  String get dailyComeBack => 'Новые задания каждый день в полночь';

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
    return 'Купи автобусов: $count';
  }

  @override
  String taskMakeDecisions(int count) {
    return 'Прими решений: $count';
  }

  @override
  String taskRunMinutes(int count) {
    return 'Управляй городом $count мин';
  }

  @override
  String taskEarnTickets(String amount) {
    return 'Заработай $amount на билетах';
  }

  @override
  String get taskFinishProject => 'Заверши строительный проект';

  @override
  String get taskRepairRoad => 'Отремонтируй дорогу';

  @override
  String taskReachSatisfaction(int percent) {
    return 'Достигни $percent% довольства';
  }

  @override
  String get tutorialNext => 'Далее';

  @override
  String get tutorialSkip => 'Пропустить';

  @override
  String get tutorialFinish => 'Поехали!';

  @override
  String get tutorialWelcomeTitle => 'Привет, Министр!';

  @override
  String get tutorialWelcome =>
      'Я Mr. Bus, твой советник по транспорту. Покажу тебе Баку за 30 секунд!';

  @override
  String get tutorialBudget =>
      'Это твой бюджет. Он начинается с нуля: пока ты на этой карте, правительство платит тебе каждую секунду, и больше, когда люди довольны. Топливо, зарплаты и ремонт его съедают.';

  @override
  String get tutorialMood =>
      'Это лицо показывает, насколько довольны жители. Если оно держится ниже 30% или пробки душат город, Президент тебя уволит!';

  @override
  String tutorialDistrict(String district) {
    return 'Дольше всех ждут в районе $district. Найди его на карте и нажми!';
  }

  @override
  String tutorialBuyBus(String amount) {
    return 'Правительство прислало $amount для старта. Выбери автобус и нажми «Подписать»!';
  }

  @override
  String get tutorialBusBought =>
      'Твой автобус приедет через пару секунд. Быстрее сервис — довольнее жители и больше денег!';

  @override
  String tutorialLevel(int percent) {
    return 'Достигни 10-го уровня, открой все технологии и сделай людей довольными на $percent%, чтобы завершить Баку!';
  }

  @override
  String get tutorialNews =>
      'Когда я машу здесь, у меня новости: просьбы, предложения и бедствия. Решать тебе!';

  @override
  String get tutorialTasks =>
      'Ежедневные задания и ежедневный подарок приносят дополнительные деньги каждый день.';

  @override
  String get tutorialDiplomacy =>
      'Это дипломатия. Трать деньги на жесты, которые любят люди, и они отплатят очками для новых технологий.';

  @override
  String get tutorialProfile =>
      'Поднимись по девяти званиям и собери достижения и значки городов. Удачи, Министр!';

  @override
  String get ledgerTechnology => 'Технологические контракты';

  @override
  String get rejectLocked => 'Сначала открой в Технологиях';

  @override
  String get rejectInsufficientDiplomacy => 'Не хватает очков дипломатии';

  @override
  String get rejectAlreadyUnlocked => 'Уже открыто';

  @override
  String eventTechnologyUnlocked(String technology) {
    return 'Контракт подписан: $technology!';
  }

  @override
  String effectMaintenanceCost(String change) {
    return 'Ремонт автобусов $change';
  }

  @override
  String diplomacyAmount(int amount) {
    return '+$amount';
  }

  @override
  String get diplomacyOpen => 'Открыть дипломатию';

  @override
  String get settingsOpen => 'Открыть настройки';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsAbout => 'О игре';

  @override
  String settingsVersion(String version) {
    return 'Версия $version';
  }

  @override
  String get diplomacyTitle => 'Дипломатия';

  @override
  String get diplomacyIntro =>
      'Жесты, которые любят люди, стоят денег, но жители отплачивают очками дипломатии. Трать очки на новые технологии.';

  @override
  String get diplomacyTechnologyBody =>
      'Трать очки дипломатии на новые автобусы, улучшения и метро.';

  @override
  String get diplomacyOpenTechnology => 'Открыть технологии';

  @override
  String diplomacyTechnologyReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Готово $count технологии',
      many: 'Готово $count технологий',
      few: 'Готовы $count технологии',
      one: 'Готова $count технология',
    );
    return '$_temp0';
  }

  @override
  String get diplomacyActionsTitle => 'Завоюй людей';

  @override
  String diplomacyGain(int points) {
    return '+$points дипломатии';
  }

  @override
  String diplomacyXp(int xp) {
    return '+$xp XP';
  }

  @override
  String diplomacyAct(String cost) {
    return 'Сделать · $cost';
  }

  @override
  String diplomacyReadyIn(String time) {
    return 'Готово через $time';
  }

  @override
  String get actionCheaperTickets => 'Дешёвые билеты';

  @override
  String get actionCheaperTicketsBody =>
      'Какое-то время оплачивай часть каждого билета. Пассажиры в восторге, ездить начинают больше.';

  @override
  String get actionHackathon => 'Транспортный хакатон';

  @override
  String get actionHackathonBody =>
      'Пригласи молодых программистов улучшить городской транспорт. Умные идеи приносят больше денег от билетов.';

  @override
  String get actionDriverRaise => 'Прибавка водителям';

  @override
  String get actionDriverRaiseBody =>
      'Водители работают веселее, но зарплаты какое-то время стоят дороже.';

  @override
  String get actionShopTaxBreak => 'Налоговая льгота магазинам';

  @override
  String get actionShopTaxBreakBody =>
      'Снизь налоги для магазинов вдоль автобусных маршрутов. Бизнес и доставка ликуют.';

  @override
  String get actionCleanAir => 'Кампания за чистый воздух';

  @override
  String get actionCleanAirBody => 'Сажай деревья и мой автобусы. Зелёные улицы радуют многих.';

  @override
  String get actionCityFestival => 'Городской фестиваль';

  @override
  String get actionCityFestivalBody =>
      'Огромный праздник для всего города. Все улыбаются, но улицы на время переполнены.';

  @override
  String decisionDiplomacyEarned(int amount) {
    return 'Жители ценят это: +$amount очков дипломатии!';
  }

  @override
  String get technologyTitle => 'Технологии';

  @override
  String get technologyIntro =>
      'Довольные жители и мудрые решения приносят очки дипломатии. Трать их вместе с деньгами, чтобы подписывать контракты и открывать новые технологии!';

  @override
  String get technologyUnlock => 'Открыть';

  @override
  String get technologyUnlocked => 'Открыто';

  @override
  String technologyRequires(String technology) {
    return 'Нужно: $technology';
  }

  @override
  String get branchBuses => 'Контракты на автобусы';

  @override
  String get branchUpgrades => 'Улучшения автобусов';

  @override
  String get branchMetro => 'Метро';

  @override
  String get branchOperations => 'Эксплуатация';

  @override
  String get techMinibusContractName => 'Контракт Hop Mini';

  @override
  String get techMinibusContractDescription =>
      'Шустрые 28-местные микроавтобусы от Silkway Motors. Дёшево и отлично для узких улиц.';

  @override
  String get techArticulatedContractName => 'Контракт MegaLink';

  @override
  String get techArticulatedContractDescription =>
      'Сочленённые автобусы на 150 мест для самых загруженных районов.';

  @override
  String get techElectricContractName => 'Контракт Volta E-12';

  @override
  String get techElectricContractDescription =>
      'Тихие электробусы без выбросов. Нужно зарядное депо.';

  @override
  String get techEngineTuningName => 'Настройка двигателя';

  @override
  String get techEngineTuningDescription =>
      'Открывает 2-й уровень автобусов: надёжнее и дешевле в ремонте.';

  @override
  String get techBiggerCabinsName => 'Большие салоны';

  @override
  String get techBiggerCabinsDescription => 'Открывает 3-й уровень автобусов: на 15% больше мест.';

  @override
  String get techComfortKitName => 'Комфорт-набор';

  @override
  String get techComfortKitDescription =>
      'Открывает 4-й уровень автобусов: кондиционер и мягкие кресла, которые любят пассажиры.';

  @override
  String get techSmartBusesName => 'Умные автобусы';

  @override
  String get techSmartBusesDescription =>
      'Открывает 5-й уровень автобусов: экономичные двигатели и чистый выхлоп.';

  @override
  String get techMetroStudyName => 'Изучение метро';

  @override
  String get techMetroStudyDescription => 'Инженеры исследуют грунт для подземной железной дороги.';

  @override
  String get techMetroContractName => 'Контракт на метро';

  @override
  String get techMetroContractDescription => 'Открывает линии метро между соседними районами.';

  @override
  String get techMetroAutomationName => 'Беспилотное метро';

  @override
  String get techMetroAutomationDescription =>
      'Поезда без машинистов ходят чаще и обходятся дешевле.';

  @override
  String get techSmartTicketingName => 'Умные билеты';

  @override
  String get techSmartTicketingDescription =>
      'Бесконтактные карты останавливают безбилетников. Доход от билетов +8% навсегда.';

  @override
  String get techEcoDrivingName => 'Академия эко-вождения';

  @override
  String get techEcoDrivingDescription =>
      'Обученные водители тратят на 10% меньше топлива и энергии.';

  @override
  String get techDepotRoboticsName => 'Роботы в депо';

  @override
  String get techDepotRoboticsDescription =>
      'Роботы помогают механикам. Ремонт автобусов на 15% дешевле.';

  @override
  String get achievementInnovatorTitle => 'Новатор';

  @override
  String get achievementInnovatorDescription => 'Открой 5 технологий.';

  @override
  String get tabBuses => 'Автобусы';

  @override
  String get tabBuild => 'Стройка';

  @override
  String get tabMetro => 'Метро';

  @override
  String get contractsTitle => 'Подпиши контракт';

  @override
  String contractSign(String price) {
    return 'Подписать · $price';
  }

  @override
  String get contractOpenTechnology => 'Технологии';

  @override
  String get contractFewer => 'Меньше автобусов';

  @override
  String get contractMore => 'Больше автобусов';

  @override
  String busSeats(int count) {
    return '$count мест';
  }

  @override
  String busRunningCost(String amount) {
    return '$amount/с';
  }

  @override
  String busComfort(int value) {
    return 'Комфорт $value';
  }

  @override
  String get ecoZero => 'Без выбросов';

  @override
  String get ecoLow => 'Мало выбросов';

  @override
  String get ecoMedium => 'Средние выбросы';

  @override
  String get ecoHigh => 'Много выбросов';

  @override
  String get fleetHereTitle => 'Автобусы здесь';

  @override
  String get fleetEmpty => 'Здесь пока нет автобусов. Подпиши контракт выше!';

  @override
  String fleetGroup(int count, String model) {
    return '$count × $model';
  }

  @override
  String fleetLevel(int level, int percent) {
    return 'Уровень $level · Надёжность $percent%';
  }

  @override
  String fleetUpgrade(String price) {
    return 'Улучшить · $price';
  }

  @override
  String fleetSell(String price) {
    return 'Продать · +$price';
  }

  @override
  String get fleetMaxLevel => 'Макс. уровень';

  @override
  String fleetMoveHere(String district) {
    return 'Перевести автобус из района $district';
  }

  @override
  String depotSpace(int used, int capacity) {
    return 'Депо $used/$capacity';
  }

  @override
  String fleetOnOrder(int count) {
    return '+$count в пути';
  }

  @override
  String buildDistrictTitle(String district) {
    return 'Строить: $district';
  }

  @override
  String get buildCityTitle => 'Для всего города';

  @override
  String buildAction(String price) {
    return 'Построить · $price';
  }

  @override
  String timeSeconds(int seconds) {
    return '$seconds с';
  }

  @override
  String timeMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String timeMinutesSeconds(int minutes, int seconds) {
    return '$minutes мин $seconds с';
  }

  @override
  String timeHoursMinutes(int hours, int minutes) {
    return '$hours ч $minutes мин';
  }

  @override
  String get buildDone => 'Построено';

  @override
  String get buildRoadFine => 'Дорога в отличном состоянии';

  @override
  String buildTimeLeft(String time) {
    return 'Осталось $time';
  }

  @override
  String get projectRoadRepairInfo => 'Залатать все ямы и вернуть дороге 100%.';

  @override
  String get projectRoadExpansionInfo => 'Добавить полосы, чтобы движение стало лучше навсегда.';

  @override
  String get projectBikeLanesInfo =>
      'Короткая пробка во время стройки, потом меньше машин и чище воздух.';

  @override
  String get projectSmartSignalsInfo => 'Светофоры, которые подстраиваются под движение.';

  @override
  String get projectModernStopsInfo => 'Навесы, табло и скамейки на каждой остановке.';

  @override
  String get projectCityParkInfo =>
      'Деревья, дорожки и детские площадки. Короткие поездки люди чаще проходят пешком или на велосипеде.';

  @override
  String get projectParkAndRideInfo =>
      'Большая парковка у остановок. Водители оставляют машину и пересаживаются на автобус.';

  @override
  String get projectChargingDepotInfo => 'Энергия для электробусов.';

  @override
  String get projectDepotExpansionInfo => 'Место ещё для 20 автобусов.';

  @override
  String get chipRoadFull => 'Дорога 100%';

  @override
  String get chipDriversHappier => 'Водители довольнее';

  @override
  String get chipSafer => 'Безопаснее улицы';

  @override
  String get chipTrafficDown => 'Меньше пробок';

  @override
  String get chipJams => 'Пробки во время стройки';

  @override
  String get chipCyclists => 'Велосипедисты в восторге';

  @override
  String get chipCleanAir => 'Чище воздух';

  @override
  String get chipCoverage => 'Охват +10%';

  @override
  String get chipPassengersHappier => 'Пассажиры довольнее';

  @override
  String get chipWalkersHappier => 'Пешеходы довольнее';

  @override
  String get chipMoreRiders => 'Больше пассажиров';

  @override
  String get chipElectric => 'Нужно для Volta E-12';

  @override
  String get chipDepot => 'Депо +20 автобусов';

  @override
  String get ledgerMetro => 'Метро';

  @override
  String get rejectTunnelBusy => 'Бригада уже копает другую линию';

  @override
  String get rejectCoolingDown => 'Ещё не готово';

  @override
  String eventMetroOpened(String from, String to) {
    return 'Метро $from ⇄ $to открыто!';
  }

  @override
  String get achievementMetroPioneerTitle => 'Первопроходец метро';

  @override
  String get achievementMetroPioneerDescription => 'Открой свою первую линию метро.';

  @override
  String metroIntro(String riders, String cost) {
    return 'Каждая станция возит $riders пассажиров в секунду без пробок. Линия стоит $cost/с.';
  }

  @override
  String get metroTeaser => 'Копай тоннели к соседям: много пассажиров и никаких пробок.';

  @override
  String metroLinesTitle(String district) {
    return 'Линии из района $district';
  }

  @override
  String metroLineTo(String district) {
    return 'До района $district';
  }

  @override
  String get metroOpen => 'Открыто';

  @override
  String metroDig(String price) {
    return 'Копать · $price';
  }

  @override
  String metroWaitingThere(int minutes) {
    return 'Там ждут: $minutes мин';
  }

  @override
  String levelBarGoal(int done, int total) {
    return 'Цель $done/$total';
  }

  @override
  String get levelBarComplete => 'Завершено';

  @override
  String get goalTitle => 'Цель города';

  @override
  String goalLevel(int level) {
    return 'Достигни уровня $level';
  }

  @override
  String goalLevelProgress(int level, int target) {
    return 'Уровень $level/$target';
  }

  @override
  String get goalTechnologies => 'Открой все технологии';

  @override
  String goalTechnologyProgress(int count, int total) {
    return '$count/$total';
  }

  @override
  String goalHappiness(int percent) {
    return 'Сделай жителей довольными на $percent%';
  }

  @override
  String goalHappinessProgress(int percent) {
    return '$percent%';
  }

  @override
  String goalUnlocks(String city, String next) {
    return 'Заверши $city, чтобы открыть $next.';
  }

  @override
  String cityCompleteTitle(String city) {
    return '$city завершён!';
  }

  @override
  String get cityCompleteBody =>
      'Все технологии твои, а жители любят свой город. Новые города уже скоро!';
}
