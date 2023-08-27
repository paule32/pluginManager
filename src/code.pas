// -------------------------------------------------------------------
// File:    code.pas
// Author:  paule32 - Jens Kallup
// License: (c) 2023  non-profit Software
//          All Rights Reserved - only for private or education usage.
// -------------------------------------------------------------------
unit code;

interface

uses
  Forms, Dialogs, Classes, SysUtils;

type
  TPluginItemA = class(TCollection)
  private
    FValueA: Integer;
  public
    property ValueA: Integer read FValueA write FValueA;
  end;
  TPluginItemB = class(TCollection)
  private
    FValueB: Integer;
  public
    property ValueB: Integer read FValueB write FValueB;
  end;

  TPluginCollection = class(TCollection)
  private
    FItemACount: Integer;
    FItemBCount: Integer;

    function GetItemA(Index: Integer): TPluginItemA;
    function GetItemB(Index: Integer): TPluginItemB;

    function GetItemACount: Integer;
    function GetItemBCount: Integer;
  public
    function AddA: TPluginItemA;
    function AddB: TPluginItemB;

    constructor Create;
    destructor Destroy; override;
    property ItemsA[Index: Integer]: TPluginItemA read GetItemA;
    property ItemsB[Index: Integer]: TPluginItemB read GetItemB;

    property CountA: Integer read GetItemACount;
    property CountB: Integer read GetItemBCount;
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
  FItemACount := -1;
  FItemBCount := -1;
end;
destructor TPluginCollection.Destroy;
begin
  inherited Destroy;
end;

function TPluginCollection.AddA: TPluginItemA;
var
  plugin: TPluginItemA;
begin
  plugin := TPluginItemA(inherited Add);
  result := plugin;
end;
function TPluginCollection.AddB: TPluginItemB;
var
  plugin: TPluginItemB;
begin
  plugin := TPluginItemB(inherited Add);
  result := plugin;
end;

function TPluginCollection.GetItemA(Index: Integer): TPluginItemA;
begin
  result := TPluginItemA(inherited Add);
end;
function TPluginCollection.GetItemB(Index: Integer): TPluginItemB;
begin
  result := TPluginItemB(inherited Add);
end;

function TPluginCollection.GetItemACount: Integer;
begin
  result := FItemACount;
end;
function TPluginCollection.GetItemBCount: Integer;
begin
  result := FItemBCount;
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
begin
  if LowerCase(ExtractFileName(app.ExeName)) <> 'editor.exe' then
  begin
    result := false;
    exit;
  end;

  ShowMessage(app.Title);
  C := TPluginInterface.Create;
  ShowMessage(C.GetVersion);
  FreeAndNil(C);
  result := true;
end;

end.
