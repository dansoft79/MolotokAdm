//------------------------------------------------------------------------------
//
// ������� �������������
//
// (c) 2021-2023, ��� ���������
//
// ������ ��������
//
//------------------------------------------------------------------------------
unit UConsts;

interface

const
  cServerConnecting : string = '���������� � ��������...';
  cCannotConnectServer : string = '�� ������� ������������ � ���� ������.';
  cNotSpecDatabaseParams : string = '�� ������� ��������� �����������.';

  cDataGetting : string = '��������� ������...';
  cDetailDataGetting : string = '��������� ��������� ������...';
  cDataBrowsing : string = '�������� ������...';
  cDataUpdating : string = '���������� ������...';
  cDataProcessing : string = '��������� ������...';
  cDataErasing : string = '������������ ������...';
  cDataImport : string = '������ ������...';
  cDataExport : string = '������� ������...';
  cDataSorting : string = '���������� ������...';
  cDataOpening : string = '�������� ���������� ������...';
  cDataClosing : string = '�������� ���������� ������...';
  cDataSaving : string = '���������� ������...';
  cDataPreparing : string = '���������� ������...';
  cDataDeleting : string = '�������� ������...';
  cDataBackuping : string = '��������� ����������� ���� ������...';
  cDataRestoring : string = '�������������� ���� ������...';

  cNotUnused : string = '��� �������������� �������!';
  cShowUnusedRecords : string = '�������� ������ �������������� �������?';
  cConfirmDeleteUnused : string = '������������� ������� �������������� ������?';
  cGuideEmpty : string = '���������� ����!';
  cConfirmGuideClear : string = '������������� ������� ��� ������ �����������?';
  cCanNotDel : string = '�� ������� ������� ������!';
  cTextNotFound : string = '�� ������� ������� ������������ �������� ������!';
  cMonthes : array[1..12] of string = (
    '������',
    '�������',
    '����',
    '������',
    '���',
    '����',
    '����',
    '������',
    '��������',
    '�������',
    '������',
    '�������');

  cNullWorkMonth = '    .  ';

  cClerkName : string = '  ����������� _________________________(%s)';

  cNoText : string = '(���)';
  cNoType : string = '(��� ����)';
  cEmptyStr = '';

  //��� �����������
  cNoWorker = '(���)';

  //�������� �������� �� �������������� ������
  cOpenAction = 'Open';
  cAddAction = 'Add';
  cEditAction = 'Edit';
  cDeleteAction = 'Delete';
  cPrintAction = 'Print';

  //���������������� ������
  cDemoText : string = '���������������� ������';

  cInsertRecordMode : integer = 0;//���������� ������
  cEditRecordMode : integer = 1;//��������� ������
  cDeleteRecordMode : integer = 2;//�������� ������
  cPrepareRecordMode : integer = 3;//����� ������������� ��� ������������� ��������

  cDefaultWorkDay : string = '1111100';
  cDefaultWorkTime : string = '09:00-19:00';

  cConfirmDeleteRecord : string = '������������� ������� ������?';

  //mesdlg
  cDYes = '&��';
  cDNo = '&���';
  cDOK = 'OK';
  cDCancel = '������';
  cDAbort = '&�����';
  cDRetry = '&���������';
  cDIgnore = '&������������';
  cDAll = '&���';
  cDNoForAll = '�&�� ��� ����';
  cDYesForAll = '�&� ��� ����';

  cRecExists : string = '����������� ������ ��� ����������!';
  cConfirmDelete : string = '������������� ������� ������?';
  cNotEnoughData : string = '�� ������� ��� ������� ������� ��������� ����������� ������!';
  cRecordUsed : string = '��������� ������ ������������ � ������ ��������.'#10#13 + '�������� �� ����� ���� ���������.';

  cFileNotExists : string = '���� �� ����������!';
  cFileNotXLS : string = '���� �� �������� ������ ������� XLS!';

  cMySQLDir : string = 'MySQL\MySQL Server 5.7\';
  cMySQLDumpUtil : string = 'mysqldump.exe';
  cMySQLUtil : string = 'mysql.exe';

  c7ZDll : string = '7za.dll';

  cNoParentConst = '(��� ��������)';
  cReferToChildError : string = '������ ��������� �� ���� ���� ����� �����!';
  cNoParent : string = cNoParentConst;

  cMaterialCheck : string = '�������� ���������...';

  cNoBaseCurrency : string = '� ����������� "���������� � �����������" �� ������� ������� ������!';

  //������ ���������� �������� ����
  cIExpert : string = '�������';

  //��������� ��� �����������
  cBeforeTimeText : string = '�� �����������';
  cAfterTimeText : string = '����� �����������';

implementation

end.
