// -------------------------------------------------------------------
// File:    pluginManager.pas
// Author:  paule32 - Jens Kallup
// License: (c) 2023  non-profit Software
//          All Rights Reserved - only for private or education usage.
// -------------------------------------------------------------------
unit pluginManager;

interface

uses
  Windows, Classes, SysUtils, Forms, Dialogs,
  plugin;

type
  TkPlugInManager = class(TComponent)
  private
    FPluginList: TStrings;

    function GetPlugin(index: Integer): TkPlugin;
    function GetPluginName(index: Integer): String;
    function GetPluginCount: Integer;
    function GetVersion: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Load(FileName: String): Boolean; virtual;

    function UnLoad(FileName: String): Boolean; overload; virtual;
    function UnLoad(index: Integer): Boolean; overload; virtual;

    property Items[index: Integer] : TkPlugin read GetPlugin; default;
    property Strings[index: Integer] : String read GetPluginName;

    property Count: Integer read GetPluginCount;

  published
    property Version: String read GetVersion;
  end;

implementation

constructor TkPlugInManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TkPlugInManager.Destroy;
begin
  inherited Destroy;
end;

function TkPlugInManager.GetPlugin(index: Integer): TkPlugin;
begin
  result := Items[index];
end;

function TkPlugInManager.GetPluginCount: Integer;
begin
  result := FPluginList.Count;
end;

function TkPlugInManager.GetPluginName(index: Integer): String;
begin
  result := Items[index].FileName;
end;

function TkPluginManager.GetVersion: String;
begin
end;

function TkPluginManager.Load(FileName: String): Boolean;
begin
  result := true;
end;

function TkPlugInManager.UnLoad(FileName: String): Boolean;
begin
  result := true;
end;

function TkPluginManager.UnLoad(index: Integer): Boolean;
begin
  result := true;
end;

end.
