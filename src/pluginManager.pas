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
    FPlugins: TStrings;
    function GetPlugin(index: Integer): TkPlugin;
    function GetPluginCount: Integer;
    function GetVersion: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function LoadPlugin(FileName: String): Boolean; virtual;

    function UnLoadPlugin(FileName: String): Boolean; overload; virtual;
    function UnLoadPlugin(index: Integer): Boolean; overload; virtual;

    property Items[index: Integer] : TkPlugin read GetPlugin; default;
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
  result := FPlugins.Count;
end;

function TkPluginManager.GetVersion: String;
begin
end;

function TkPluginManager.LoadPlugin(FileName: String): Boolean;
begin
  result := true;
end;

function TkPlugInManager.UnLoadPlugin(FileName: String): Boolean;
begin
  result := true;
end;

function TkPluginManager.UnLoadPlugin(index: Integer): Boolean;
begin
  result := true;
end;

end.
