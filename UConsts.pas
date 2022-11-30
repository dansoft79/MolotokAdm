//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Модуль констант
//
//------------------------------------------------------------------------------
unit UConsts;

interface

const
  cServerConnecting : string = 'Соединение с сервером...';
  cCannotConnectServer : string = 'Не удается подключиться к базе данных.';
  cNotSpecDatabaseParams : string = 'Не указаны параметры подключения.';

  cDataGetting : string = 'Получение данных...';
  cDetailDataGetting : string = 'Получение детальных данных...';
  cDataBrowsing : string = 'Просмотр данных...';
  cDataUpdating : string = 'Обновление данных...';
  cDataProcessing : string = 'Обработка данных...';
  cDataErasing : string = 'Освобождение данных...';
  cDataImport : string = 'Импорт данных...';
  cDataExport : string = 'Экспорт данных...';
  cDataSorting : string = 'Сортировка данных...';
  cDataOpening : string = 'Открытие источников данных...';
  cDataClosing : string = 'Закрытие источников данных...';
  cDataSaving : string = 'Сохранение данных...';
  cDataPreparing : string = 'Подготовка данных...';
  cDataDeleting : string = 'Удаление данных...';
  cDataBackuping : string = 'Резервное копирование базы данных...';
  cDataRestoring : string = 'Восстановление базы данных...';

  cNotUnused : string = 'Нет неиспользуемых записей!';
  cShowUnusedRecords : string = 'Показать список неиспользуемых записей?';
  cConfirmDeleteUnused : string = 'Действительно удалить неиспользуемые записи?';
  cGuideEmpty : string = 'Справочник пуст!';
  cConfirmGuideClear : string = 'Действительно удалить все записи справочника?';
  cCanNotDel : string = 'Не удается удалить запись!';
  cTextNotFound : string = 'Не найдено точного соответствия искомого текста!';
  cMonthes : array[1..12] of string = (
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь');

  cNullWorkMonth = '    .  ';

  cClerkName : string = '  Исполнитель _________________________(%s)';

  cNoText : string = '(нет)';
  cNoType : string = '(без типа)';
  cEmptyStr = '';

  //нет исполнителя
  cNoWorker = '(нет)';

  //основные действия по редактированию таблиц
  cOpenAction = 'Open';
  cAddAction = 'Add';
  cEditAction = 'Edit';
  cDeleteAction = 'Delete';
  cPrintAction = 'Print';

  //демонстрационная версия
  cDemoText : string = 'Демонстрационная версия';

  cInsertRecordMode : integer = 0;//добавление записи
  cEditRecordMode : integer = 1;//изменение записи
  cDeleteRecordMode : integer = 2;//удаление записи
  cPrepareRecordMode : integer = 3;//режим приготовления для многострочных операций

  cDefaultWorkDay : string = '1111100';
  cDefaultWorkTime : string = '09:00-19:00';

  cConfirmDeleteRecord : string = 'Действительно удалить запись?';

  //mesdlg
  cDYes = '&Да';
  cDNo = '&Нет';
  cDOK = 'OK';
  cDCancel = 'Отмена';
  cDAbort = '&Аборт';
  cDRetry = '&Повторить';
  cDIgnore = '&Игнорировать';
  cDAll = '&Все';
  cDNoForAll = 'Н&ет для всех';
  cDYesForAll = 'Д&а для всех';

  cRecExists : string = 'Аналогичная запись уже существует!';
  cConfirmDelete : string = 'Действительно удалить запись?';
  cNotEnoughData : string = 'Не указаны или неверно указаны некоторые необходимые данные!';
  cRecordUsed : string = 'Указанная запись используется в других таблицах.'#10#13 + 'Удаление не может быть выполнено.';

  cFileNotExists : string = 'Файл не существует!';
  cFileNotXLS : string = 'Файл не является файлом формата XLS!';

  cMySQLDir : string = 'MySQL\MySQL Server 5.7\';
  cMySQLDumpUtil : string = 'mysqldump.exe';
  cMySQLUtil : string = 'mysql.exe';

  c7ZDll : string = '7za.dll';

  cNoParentConst = '(нет родителя)';
  cReferToChildError : string = 'Нельзя ссылаться на себя либо своих детей!';
  cNoParent : string = cNoParentConst;

  cMaterialCheck : string = 'Проверка материала...';

  cNoBaseCurrency : string = 'В справочнике "Информация о предприятии" не указана базовая валюта!';

  //режимы интерфейса главного окна
  cIExpert : string = 'Эксперт';

  //константы для уведомлений
  cBeforeTimeText : string = 'до наступления';
  cAfterTimeText : string = 'после наступления';

implementation

end.
