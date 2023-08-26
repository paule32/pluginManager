// -------------------------------------------------------------------
// File:    plugin.pas
// Author:  paule32 - Jens Kallup
// License: (c) 2023  non-profit Software
//          All Rights Reserved - only for private or education usage.
// -------------------------------------------------------------------
unit plugin;

interface

uses
  Windows, Classes, SysUtils, Forms, Dialogs;

type
  TkPlugin = class(TObject)
  private
    FHostApplication: TApplication;
    FFileVersion    : String;
    FFileName       : String;
    FFileAuthor     : String;
    FFileDescription: String;
    FManager        : TComponent;
  public
    constructor Create;
    destructor Destroy; override;

    function GetNumCommands: Integer; virtual; stdcall;

    function GetVersion: String; virtual; stdcall;
    function GetName: String; virtual; stdcall;
    function GetAuthor: String; virtual; stdcall;
    function GetDescription: String; virtual; stdcall;

    procedure SetVersion(AString: String);

    property HostApplication: TApplication read FHostApplication;
    property FileName: String read FFileName;
    property Version: String read FFileVersion;
    property Manager: TComponent read FManager;
  end;

implementation

constructor TkPlugin.Create;
begin
end;

destructor TkPlugin.Destroy;
begin
end;

function TkPlugin.GetVersion: String;
begin
  result := FFileVersion;
end;

function TkPlugin.GetName: String;
var
  TheFileName : array[0..MAX_PATH] of char;
begin
  FillChar(TheFileName, sizeof(TheFileName), #0);
  GetModuleFileName(hInstance, TheFileName, sizeof(TheFileName));
  result := TheFileName;
end;

function TkPlugin.GetAuthor: String;
begin
  result := FFileAuthor;
end;

function TkPlugin.GetDescription: String;
begin
  result := FFileDescription;
end;

function TkPlugin.GetNumCommands: Integer;
begin
  result := 0;
end;

procedure TkPlugin.SetVersion(AString: String);
begin
  FFileVersion := AString;
end;

end.
