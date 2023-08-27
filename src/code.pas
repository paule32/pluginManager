// -------------------------------------------------------------------
// File:    code.pas
// Author:  paule32 - Jens Kallup
// License: (c) 2023  non-profit Software
//          All Rights Reserved - only for private or education usage.
// -------------------------------------------------------------------
unit code;

interface

uses
  Forms, Dialogs, Controls, Classes, SysUtils;

type
  TPluginItemObject = class(TObject)
  private
    FValueA: Integer;
  public
    property ValueA: Integer read FValueA write FValueA;
  end;

  TPluginCollection = class(TCollection)
  private
    FItemCount: Integer;

    function GetItemObject(AIndex: Integer): TPluginItemObject;
    function GetItemString(AName: String): TPluginItemObject;

    function GetItemCount: Integer;
  public
    function Add(AName: String): TPluginItemObject;

    constructor Create;
    destructor Destroy; override;

    property Objects[AIndex: Integer]: TPluginItemObject read GetItemObject;
    property Strings[AName: String]:   TPluginItemObject read GetItemString;

    property Count: Integer read GetItemCount;
  end;

  TPluginInterface = class(TObject)
  private
    FFileVersion    : String;
    FFileAuthor     : String;
    FFileDescription: String;

    function GetVersion: String;
    function GetAuthor: String;
    function GetDescription: String;
  public
    constructor Create;
    destructor Destroy; override;
  public
    property Description: String read FFileDescription;
    property Author: String read FFileAuthor;
    property Version: String read FFileVersion;
  end;

function RegisterPlugin(app: TApplication): Boolean; stdcall; export;
exports
  RegisterPlugin;

implementation

constructor TPluginCollection.Create;
begin
  FItemCount := -1;
end;
destructor TPluginCollection.Destroy;
begin
  inherited Destroy;
end;

function TPluginCollection.Add(AName: String): TPluginItemObject;
var
  plugin: TPluginItemObject;
begin
  plugin := TPluginItemObject(inherited Add);
  result := plugin;
end;

function TPluginCollection.GetItemObject(AIndex: Integer): TPluginItemObject;
begin
  result := TPluginItemObject(inherited Add);
end;

function TPluginCollection.GetItemString(AName: String): TPluginItemObject;
begin
  result := TPluginItemObject(inherited Add);
end;

function TPluginCollection.GetItemCount: Integer;
begin
  result := FItemCount;
end;

constructor TPluginInterface.Create;
begin
  inherited Create;
  FFileVersion := '1.0.0';
  FFileDescription := 'Standard Controls';
  FFileAuthor := 'Jens Kallup - paule32';
end;
destructor TPluginInterface.Destroy;
begin
  inherited Destroy;
end;

function TPluginInterface.GetVersion: String;
begin
  result := FFileVersion;
end;

function TPluginInterface.GetAuthor: String;
begin
  result := FFileAuthor;
end;

function TPluginInterface.GetDescription: String;
begin
  result := FFileDescription;
end;

function RegisterPlugin(app: TApplication): Boolean; stdcall; export;
var
  C: TPluginInterface;
  T: TControl;
begin
  try
    try
      if LowerCase(ExtractFileName(app.ExeName)) <> 'project1.exe' then
      raise Exception.Create('Host-Application does not match file name');

      if app.ComponentCount < 0 then
      raise Exception.Create('Host-Application is empty.');

      ShowMessage(app.Title + ' has: ' + IntToStr(app.MainForm.ComponentCount) + ' components');
      C := TPluginInterface.Create;
      ShowMessage(C.GetVersion);
      FreeAndNil(C);
    except
      on E: Exception do
      begin
        ShowMessage('Error:' +
        #10 + 'ClassName: '  + E.ClassName +
        #10 + 'Message  : '  + E.Message);
        result := false;
        exit;
      end;
    end;
  finally
  end;
  result := true;
end;

end.
