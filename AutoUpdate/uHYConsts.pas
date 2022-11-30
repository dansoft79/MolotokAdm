unit uHYConsts;

interface

uses
  SysUtils;

type
  EHYException = class(Exception);
  EHYRequiredPropertyNotAssigned = class(EHYException);

  EHYOwnerMustBeForm = class(EHYException);

resourcestring
  cap_HelpMenu = 'Help';

  msg_FileNotFound = 'File %s not found';
  msg_FileAlreadyOpen = 'File is open';
  msg_FileNotOpen = 'File is not open';

  msg_InvalidCollectionType = 'Invalid collection type';
  msg_RequiredPropertyNotAssigned = 'Required property %s is not assigned in %s';

  msg_OwnerMustBeForm = 'The owner for this component must be a TForm';

  msg_HostNotAssigned = 'Host is not assigned';
  msg_SourceNotAssigned = 'Source is not assigned';

  msg_AlreadyUpdating = 'Already updating';
  msg_UnknownUpdateList = 'Unknown update list %s';
  msg_InvalidReference = 'Invalid or NIL reference';
  msg_InvalidReferenceToController = 'Invalid or NIL reference to controller';
  msg_CannotFindMenuItem = 'Cannot find menu item %s';
  msg_BeginUpdateHasNotBeenCalled = 'Begin update has not been called';
  msg_NotASubMenu = 'This item is not a submenu';
  msg_BeginModifyNotCalled = 'BeginModify has not been called';
  msg_IndexOutOfBounds = 'Index %d out of bounds';

  msg_CannotCreateTemporaryDirectory = 'Cannot create temporary directory %s';

implementation

end.
