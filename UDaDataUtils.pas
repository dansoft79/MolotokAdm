//------------------------------------------------------------------------------
//
// Молоток Администратор
//
// (c) 2021-2023, ООО ПОРТАЛПРО
//
// Модуль утилит для DaData
//
//------------------------------------------------------------------------------
unit UDaDataUtils;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls, JclSimpleXML, JSON;

function GetDaData(URL, ContentType, Accept, Token, Body: string): string;

function GetDaDataSecret(URL, ContentType, Accept, Token, Secret, Body: string): string;

function GetDaDataService(URL, Token, Secret : string): string;

function XMLVariantCount(AXML : string) : integer;

function XMLVariantName(AXML : string; AVariant : integer = 0) : string;

function XMLPropertyCount(AXML, ARoot : string; AVariant : integer = 0) : integer;

function XMLReadValue(ANode : TJclSimpleXMLElem) : string;

function XMLReadData(AXML, ARoot, AProperty : string; AVariant : integer = 0) : string;

function XMLReadPropertyFromIndex(AXML, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;

function XMLReadDataFromIndex(AXML, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;

function XMLReadPropertyDataFromIndex(AXML, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;

function XMLReadParams(AXML, ARoot : string; AVariant : integer = 0) : string;

function XMLReadParamsChild(AXML : string) : string;

function XMLReadParamsChild2(AXML : string) : string;

function JSONVariantCount(AJSON : string) : integer;

function JSONVariantName(AJSON : string; AVariant : integer = 0) : string;

function JSONPropertyCount(AJSON, ARoot : string; AVariant : integer = 0) : integer;

function JSonReadValue(ANode : TJSONValue) : string;

function JSONReadData(AJSon, ARoot, AProperty : string; AVariant : integer = 0) : string;

function JSonReadPropertyFromIndex(AJSON, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;

function JSONReadDataFromIndex(AJSON, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;

function JSonReadPropertyDataFromIndex(AJSON, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;

function JSonReadParams(AJSON, ARoot : string; AVariant : integer = 0) : string;

function JSonReadParamsChild(AJSON : string) : string;

function CheckDaDataService(AToken : string; ARepeatCount : integer = 3) : string;

function CheckDaDataBalance(AToken, ASecret : string; ARepeatCount : integer = 3) : string;

function DaDataStrToDate(AString : string) : TDateTime;

function JSONFIOForm(AAPIKey, ASecret, AString : string) : string;

implementation

uses
  WideStrUtils, XMLDoc, JclAnsiStrings, DateUtils;

function XMLVariantCount(AXML : string) : integer;
  var
    vXML : TJclSimpleXML;
    vData, vChild, vRoot : TJclSimpleXMLElem;
    i, n : integer;
begin
  vXML := TJclSimpleXML.Create;
  vXML.LoadFromString(AXML);

  vRoot := vXML.Root;
  n := vRoot.ItemCount;
  Result := n;

  vXML.Free;
end;

function XMLVariantName(AXML : string; AVariant : integer = 0) : string;
  var
    vXML : TJclSimpleXML;
    vData, vChild, vRoot : TJclSimpleXMLElem;
    i, n : integer;
begin
  vXML := TJclSimpleXML.Create;
  vXML.LoadFromString(AXML);

  vRoot := vXML.Root;
  vRoot := vRoot.Items[AVariant];
  Result := vRoot.Items.Value('value', '');

  vXML.Free;
end;

function XMLPropertyCount(AXML, ARoot : string; AVariant : integer = 0) : integer;
  var
    vXML : TJclSimpleXML;
    vData, vChild, vRoot : TJclSimpleXMLElem;
    i, n : integer;
begin
  vXML := TJclSimpleXML.Create;
  vXML.LoadFromString(AXML);

  vRoot := vXML.Root;
  vRoot := vRoot.Items[AVariant];

  n := vRoot.ItemCount;
  for i := 0 to n - 1 do
  begin
    vChild := vRoot.Items[i];
    if vChild.Name = ARoot then Break;
  end;

  n := vChild.ItemCount;
  Result := n;

  vXML.Free;
end;

function XMLReadValue(ANode : TJclSimpleXMLElem) : string;
begin
  if ANode.ItemCount = 0 then Result := ANode.Value
  else
  begin
    //возвращаем сложный результат
    Result := ANode.SaveToString;
    Result := XMLReadParamsChild(Result);
  end;
end;

function XMLReadData(AXML, ARoot, AProperty : string; AVariant : integer = 0) : string;
  var
    vXML : TJclSimpleXML;
    vData, vChild, vRoot : TJclSimpleXMLElem;
    i, n : integer;
begin
  vXML := TJclSimpleXML.Create;
  vXML.LoadFromString(AXML);

  vRoot := vXML.Root;
  vRoot := vRoot.Items[AVariant];

  n := vRoot.ItemCount;
  for i := 0 to n - 1 do
  begin
    vChild := vRoot.Items[i];
    if vChild.Name = ARoot then Break;
  end;

  Result := XMLReadValue(vChild.Items.ItemNamed[AProperty]);

  if IsUTF8String(Result) then Result := UTF8ToString(Result);

  vXML.Free;
end;

function XMLReadDataFromIndex(AXML, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;
  var
    vXML : TJclSimpleXML;
    vData, vChild, vRoot : TJclSimpleXMLElem;
    i, n : integer;
begin
  vXML := TJclSimpleXML.Create;
  vXML.LoadFromString(AXML);

  vRoot := vXML.Root;
  vRoot := vRoot.Items[AVariant];

  n := vRoot.ItemCount;
  for i := 0 to n - 1 do
  begin
    vChild := vRoot.Items[i];
    if vChild.Name = ARoot then Break;
  end;

  vData := vChild.Items[AIndex];

  Result := XMLReadValue(vData);

  if IsUTF8String(Result) then Result := UTF8ToString(Result);

  vXML.Free;
end;

function XMLReadPropertyFromIndex(AXML, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;
  var
    vXML : TJclSimpleXML;
    vData, vChild, vRoot : TJclSimpleXMLElem;
    i, n : integer;
begin
  vXML := TJclSimpleXML.Create;
  vXML.LoadFromString(AXML);

  vRoot := vXML.Root;
  vRoot := vRoot.Items[AVariant];

  n := vRoot.ItemCount;
  for i := 0 to n - 1 do
  begin
    vChild := vRoot.Items[i];
    if vChild.Name = ARoot then Break;
  end;

  vData := vChild.Items[AIndex];
  Result := vData.Name;
  if IsUTF8String(Result) then Result := UTF8ToString(Result);

  vXML.Free;
end;

function XMLReadPropertyDataFromIndex(AXML, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;
  var
    vXML : TJclSimpleXML;
    vData, vChild, vRoot : TJclSimpleXMLElem;
    i, n : integer;
begin
  vXML := TJclSimpleXML.Create;
  vXML.LoadFromString(AXML);

  vRoot := vXML.Root;
  vRoot := vRoot.Items[AVariant];

  n := vRoot.ItemCount;
  for i := 0 to n - 1 do
  begin
    vChild := vRoot.Items[i];
    if vChild.Name = ARoot then Break;
  end;

  vData := vChild.Items[AIndex];
  Result := vData.Name + '=' + XMLReadValue(vData);

  if IsUTF8String(Result) then Result := UTF8ToString(Result);

  vXML.Free;
end;

function XMLReadParams(AXML, ARoot : string; AVariant : integer = 0) : string;
  var
    vXML : TJclSimpleXML;
    vData, vChild, vRoot : TJclSimpleXMLElem;
    i, n : integer;
begin
  vXML := TJclSimpleXML.Create;
  vXML.LoadFromString(AXML);

  vRoot := vXML.Root;
  vRoot := vRoot.Items[AVariant];

  n := vRoot.ItemCount;
  for i := 0 to n - 1 do
  begin
    vChild := vRoot.Items[i];
    if vChild.Name = ARoot then Break;
  end;

  Result := '';
  for i := 0 to vChild.ItemCount - 1 do
  begin
    vData := vChild.Items[i];
    Result := Result + vData.Name + '=' + XMLReadValue(vData) + ';';
  end;

  if IsUTF8String(Result) then Result := UTF8ToString(Result);

  vXML.Free;
end;

function XMLReadParamsChild(AXML : string) : string;
  var
    vXML : TJclSimpleXML;
    vData, vChild : TJclSimpleXMLElem;
    i, n : integer;
    s : string;
begin
  vXML := TJclSimpleXML.Create;
  vXML.LoadFromString(AXML);

  vChild := vXML.Root;

  Result := '';

  if Assigned(vChild) then
  begin
    for i := 0 to vChild.ItemCount - 1 do
    begin
      vData := vChild.Items[i];

      if vData.ItemCount = 0 then Result := Result + vData.Name + '=' + vData.Value + '|'
      else
      begin
        s := vData.SaveToString;
        s := XMLReadParamsChild2(s);
        Result := Result + vData.Name + '=' + s;
      end;
    end;
    if IsUTF8String(Result) then Result := UTF8ToString(Result);
  end;

  vXML.Free;
end;

function XMLReadParamsChild2(AXML : string) : string;
  var
    vXML : TJclSimpleXML;
    vData, vChild : TJclSimpleXMLElem;
    i, n : integer;
begin
  vXML := TJclSimpleXML.Create;
  vXML.LoadFromString(AXML);

  vChild := vXML.Root;

  Result := '';

  if Assigned(vChild) then
  begin
    for i := 0 to vChild.ItemCount - 1 do
    begin
      vData := vChild.Items[i];
      Result := Result + vData.Name + '=' + vData.Value + '^';
    end;

    if IsUTF8String(Result) then Result := UTF8ToString(Result);
  end;

  vXML.Free;
end;

function JSONVariantCount(AJSON : string) : integer;
  var
    vData, vRoot : TJSONObject;
    vChild : TJSONArray;
    i, n : integer;
begin
  vRoot := TJSONObject.ParseJSONValue(AJSon) as TJSONObject;

  vChild := (vRoot.Get('suggestions').JsonValue as TJSONArray);

  n := vChild.Count;

  vRoot.Free;

  Result := n;
end;

function JSONVariantName(AJSON : string; AVariant : integer = 0) : string;
  var
    vData, vChild, vRoot : TJSONObject;
    s : string;
begin
  vRoot := TJSONObject.ParseJSONValue(AJSon) as TJSONObject;

  vChild := (vRoot.Get('suggestions').JsonValue as TJSONArray).Items[AVariant] as TJSonObject;

  s := vChild.Get('value').JSonValue.Value;

  vRoot.Free;

  Result := s;
end;

function JSONPropertyCount(AJSON, ARoot : string; AVariant : integer = 0) : integer;
  var
    vData, vChild, vRoot : TJSONObject;
    i, n : integer;
begin
  vRoot := TJSONObject.ParseJSONValue(AJSon) as TJSONObject;

  vChild := (vRoot.Get('suggestions').JsonValue as TJSONArray).Items[AVariant] as TJSonObject;

  n := vChild.Count;

  for i := 0 to n - 1 do
  begin
//    ShowMessage(vChild.Pairs[i].JsonString.Value);
    if vChild.Pairs[i].JsonString.Value = ARoot then
    begin
      vData := vChild.Pairs[i].JsonValue as TJSONObject;
      n := vData.Count;
      Break;
    end;
  end;

  vRoot.Free;

  Result := n;
end;

function JSonReadValue(ANode : TJSONValue) : string;
begin
  Result := ANode.ToJSON;
  Result := JSONReadParamsChild(Result);
end;

function JSONReadData(AJSon, ARoot, AProperty : string; AVariant : integer = 0) : string;
  var
    vData, vChild, vRoot : TJSONObject;
    vRes : TJSonValue;
    i, n : integer;
begin
  vRoot := TJSONObject.ParseJSONValue(AJSon) as TJSONObject;

  vChild := (vRoot.Get('suggestions').JsonValue as TJSONArray).Items[AVariant] as TJSonObject;

  n := vChild.Count;

  for i := 0 to n - 1 do
  begin
    if vChild.Pairs[i].JsonString.Value = ARoot then
    begin
      vData := vChild.Pairs[i].JsonValue as TJSONObject;
      Break;
    end;
  end;

  vRes := vData.GetValue(AProperty);

  Result := JSonReadValue(vRes);

  if IsUTF8String(Result) then Result := UTF8ToString(Result);

  vRoot.Free;
end;

function JSONReadDataFromIndex(AJSON, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;
  var
    vData, vChild, vRoot : TJSONObject;
    i, n : integer;
begin
  vRoot := TJSONObject.ParseJSONValue(AJSon) as TJSONObject;

  vChild := (vRoot.Get('suggestions').JsonValue as TJSONArray).Items[AVariant] as TJSonObject;

  vData := vChild.Values[ARoot] as TJSONObject;

//  Result := vData.Pairs[AIndex].JsonValue.Value;

  Result := JSonReadValue(vData.Pairs[AIndex].JsonValue);

  if IsUTF8String(Result) then Result := UTF8ToString(Result);

  vRoot.Free;
end;

function JSonReadPropertyFromIndex(AJSON, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;
  var
    vData, vChild, vRoot : TJSONObject;
    i, n : integer;
begin
  vRoot := TJSONObject.ParseJSONValue(AJSon) as TJSONObject;

  vChild := (vRoot.Get('suggestions').JsonValue as TJSONArray).Items[AVariant] as TJSonObject;

  vData := vChild.Values[ARoot] as TJSONObject;

  Result := vData.Pairs[AIndex].JsonString.Value;

  if IsUTF8String(Result) then Result := UTF8ToString(Result);

  vRoot.Free;
end;

function JSonReadPropertyDataFromIndex(AJSON, ARoot : string; AIndex : integer; AVariant : integer = 0) : string;
  var
    vData, vChild, vRoot : TJSONObject;
    i, n : integer;
begin
  vRoot := TJSONObject.ParseJSONValue(AJSon) as TJSONObject;

  vChild := (vRoot.Get('suggestions').JsonValue as TJSONArray).Items[AVariant] as TJSonObject;

  vData := vChild.Values[ARoot] as TJSONObject;

  Result := vData.Pairs[AIndex].JsonString.Value + '=' + JSonReadValue(vData.Pairs[AIndex].JsonValue);

  if IsUTF8String(Result) then Result := UTF8ToString(Result);

  vRoot.Free;
end;

function JSonReadParams(AJSON, ARoot : string; AVariant : integer = 0) : string;
  var
    vData, vChild, vRoot : TJSONObject;
    i, n : integer;
    s : string;
begin
  vRoot := TJSONObject.ParseJSONValue(AJSon) as TJSONObject;

  vChild := (vRoot.Get('suggestions').JsonValue as TJSONArray).Items[AVariant] as TJSonObject;

  vData := vChild.Values[ARoot] as TJSONObject;

  Result := '';
  for i := 0 to vData.Count - 1 do
  begin
    s := vData.Pairs[i].JsonString.Value;
    s := s + '=';
    s := s + JSonReadValue(vData.Pairs[i].JsonValue) + ';';
    Result := Result + s;
  end;

  if IsUTF8String(Result) then Result := UTF8ToString(Result);

  vRoot.Free;
end;

function JSonReadParamsChild(AJSON : string) : string;
  var
    vData : TJSONObject;
    i, n : integer;
begin
  vData := TJSONObject.ParseJSONValue(AJSon) as TJSONObject;

  Result := '';
  if Assigned(vData) then
  begin
    for i := 0 to vData.Count - 1 do
    begin
      Result := Result + vData.Pairs[i].JsonString.Value + '=' + vData.Pairs[i].JsonValue.Value + '|';
    end;

    if IsUTF8String(Result) then Result := UTF8ToString(Result);
  end;
  vData.Free;
end;

function CheckDaDataService(AToken : string; ARepeatCount : integer = 3) : string;
var
    URL: string;
    ContentType: string;
    Accept: string;
    Body: string;
    r : string;
    vOK : boolean;
    vRoot : TJSONObject;
begin
  URL := 'http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address';
  ContentType := 'application/json';
  Accept := 'application/json';
  Body := '{ "query": "Белгород" }';

  repeat
    vOK := false;
    try
      r := GetDaData(URL, ContentType, Accept, AToken, Body);

      vRoot := TJSONObject.ParseJSONValue(r) as TJSONObject;
      if vRoot.Get(0).JSonString.Value = 'suggestions' then
      begin
        vOK := true;
        r := '';
      end
      else
        if Assigned(vRoot.Get('message')) then
        begin
          vOK := true;
          r := vRoot.Get('message').JsonValue.Value;
        end
        else
        begin
          vOK := true;
          r := r;
        end;
      vRoot.Free;
    except
      on E: Exception do
      begin
        vOK := false;
        ARepeatCount := ARepeatCount - 1;
      end;
    end;
  until vOK or (ARepeatCount = 0);

  Result := r;
end;

function CheckDaDataBalance(AToken, ASecret : string; ARepeatCount : integer = 3) : string;
var
    URL: string;
    r : string;
    vOK : boolean;
    vRoot : TJSONObject;
begin
  URL := 'https://dadata.ru/api/v2/profile/balance';

  repeat
    vOK := false;
    try
      r := GetDaDataService(URL, AToken, ASecret);

      vRoot := TJSONObject.ParseJSONValue(r) as TJSONObject;
      if vRoot.Get(0).JSonString.Value = 'balance' then
      begin
        vOK := true;
//        r := '';
        r := vRoot.Get(0).JSonValue.Value;
      end
      else
        if Assigned(vRoot.Get('message')) then
        begin
          vOK := true;
          r := vRoot.Get('message').JsonValue.Value;
        end
        else
        begin
          vOK := true;
          r := r;
        end;
      vRoot.Free;
    except
      on E: Exception do
      begin
        vOK := false;
        ARepeatCount := ARepeatCount - 1;
      end;
    end;
  until vOK or (ARepeatCount = 0);

  Result := r;
end;

function DaDataStrToDate(AString : string) : TDateTime;
  var
    r : int64;
begin
  r := StrToInt64(AString);
  Result := IncMilliSecond(StrToDate('01.01.1970'), r);
end;

function JSONFIOForm(AAPIKey, ASecret, AString : string) : string;
  var
    URL: string;
    ContentType: string;
    Accept: string;
    Token: string;
    Secret: string;
    Body: string;
    p, v : string;
    n, i : integer;
begin
  Result := '';
  if (AApiKey <> '') and (ASecret <> '') then
  begin
    URL := 'https://dadata.ru/api/v2/clean/name';
    ContentType := 'application/json';
    Accept := 'application/json';
    Token := AAPIKEY;
    Secret := ASecret;
    Body := '[ "' + AString + '" ]';

    Result := GetDaDataSecret(URL, ContentType, Accept, Token, ASecret, Body);
  end;
end;

function GetDaData(URL, ContentType, Accept, Token, Body: string): string;
var
    IdHTTP1: TIdHTTP;
    StringStream: TStringStream;
begin
  IdHTTP1 := TIdHTTP.Create;
  StringStream := TStringStream.Create('', TEncoding.UTF8);

  try
    IdHTTP1.HTTPOptions := [hoKeepOrigProtocol,hoForceEncodeParams,hoNoProtocolErrorException,hoWantProtocolErrorContent];
    IdHTTP1.Request.ContentEncoding := 'UTF-8';
    IdHTTP1.Request.ContentType := ContentType;
    IdHTTP1.Request.Accept := Accept;

    IdHTTP1.Request.CustomHeaders.Add('Authorization: Token ' + Token);
    StringStream.WriteString(AnsiToUTF8(Body));

    Result := IdHTTP1.Post(URL, StringStream);
  finally
    StringStream.Free;
    IdHTTP1.Free;
  end;
end;

function GetDaDataSecret(URL, ContentType, Accept, Token, Secret, Body: string): string;
var
    IdHTTP1: TIdHTTP;
    StringStream: TStringStream;
begin
  IdHTTP1 := TIdHTTP.Create;
  StringStream := TStringStream.Create('', TEncoding.UTF8);

  try
    IdHTTP1.HTTPOptions := [hoKeepOrigProtocol,hoForceEncodeParams,hoNoProtocolErrorException,hoWantProtocolErrorContent];
    IdHTTP1.Request.ContentEncoding := 'UTF-8';
    IdHTTP1.Request.ContentType := ContentType;
    IdHTTP1.Request.Accept := Accept;

    IdHTTP1.Request.CustomHeaders.Add('Authorization: Token ' + Token);
    IdHTTP1.Request.CustomHeaders.Add('X-Secret: ' + Secret);
    StringStream.WriteString(AnsiToUTF8(Body));

    Result := IdHTTP1.Post(URL, StringStream);
  finally
    StringStream.Free;
    IdHTTP1.Free;
  end;
end;

function GetDaDataService(URL, Token, Secret : string): string;
var
    IdHTTP1: TIdHTTP;
begin
  IdHTTP1 := TIdHTTP.Create;

  try
    IdHTTP1.HTTPOptions := [hoKeepOrigProtocol,hoForceEncodeParams,hoNoProtocolErrorException,hoWantProtocolErrorContent];

    IdHTTP1.Request.CustomHeaders.Add('Authorization: Token ' + Token);
    IdHTTP1.Request.CustomHeaders.Add('X-Secret: ' + Secret);

    Result := IdHTTP1.Get(URL);
  finally
    IdHTTP1.Free;
  end;
end;

end.
