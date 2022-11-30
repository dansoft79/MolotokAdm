unit uHYLocalService;

interface

uses
  Windows, Messages, SysUtils, Classes, uROClient, uROClientIntf, uROClasses,
  uRODL, UROComponent;

type
  { THYLocalService }
  THYLocalService = class(TROComponent)
  private
    fClientID: TGUID;
    fInstance: IInterface;
    fServiceName: string;
    function GetHoldsInstance: boolean;
    procedure SetServiceName(const Value: string);

  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; override;

    procedure ActivateInstance(const anInstance: IInterface); virtual;
    procedure DeactivateInstance(const anInstance: IInterface); virtual;

  public
    procedure ReleaseInstance;

    property HoldsInstance: boolean read GetHoldsInstance;
    property ClientID: TGUID read fClientID write fClientID;
  published
    property ServiceName: string read fServiceName write SetServiceName;
  end;

implementation

uses
  uROServer, uROServerIntf;

{ THYLocalService }

function THYLocalService.GetHoldsInstance: boolean;
begin
  result := fInstance<>NIL
end;

procedure THYLocalService.ActivateInstance(const anInstance: IInterface);
var
  //dispnotifier: IRODispatchNotifier;
  objactivation: IROObjectActivation;
begin
  // This can be enanched by descendants
  if Supports(anInstance, IROObjectActivation, objactivation) then
    objactivation.OnActivate(ClientID, NIL);

  {if Supports(anInstance, IRODispatchNotifier, dispnotifier)
    then dispnotifier.GetDispatchInfo(aTransport, aMessage);}
end;

procedure THYLocalService.DeactivateInstance(const anInstance: IInterface);
var
  objactivation: IROObjectActivation;
begin
  if Supports(anInstance, IROObjectActivation, objactivation) then
    objactivation.OnDeactivate(ClientID);
end;

function THYLocalService.QueryInterface(const IID: TGUID;
  out Obj): HResult;
var factory: IROClassFactory;
begin
  result := inherited QueryInterface(IID, Obj);

  if (result <> S_OK) then begin
    if assigned(fInstance) then begin
      result := fInstance.QueryInterface(IID, Obj);
      if result = S_OK then exit;
      ReleaseInstance();
    end;

    factory := FindClassFactory(ServiceName);
    if assigned(factory) then begin
      factory.CreateInstance(ClientID, fInstance);
      fInstance.QueryInterface(IID, Obj);

      ActivateInstance(fInstance);

      result := S_OK;
    end;
  end;
end;

procedure THYLocalService.ReleaseInstance;
var factory: IROClassFactory;
begin
  if (fInstance=NIL) then
    raise Exception.Create('Instance has never been created');

  DeactivateInstance(fInstance);

  factory := FindClassFactory(ServiceName);
  factory.ReleaseInstance(ClientID, fInstance);

  fInstance := nil;
end;

procedure THYLocalService.SetServiceName(const Value: string);
begin
  fServiceName := Trim(Value);
end;

end.
