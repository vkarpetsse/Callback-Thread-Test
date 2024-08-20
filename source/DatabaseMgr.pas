unit DatabaseMgr;

Interface

uses System.Classes, System.SysUtils, Settings,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FireDAC.Comp.Client;

type
  IDatabaseManager = interface
    ['{22816509-B844-407B-9252-26F186676AAF}']
      procedure Connect;
      procedure Disconnect;
      function IsConnected: Boolean;
      procedure SetConnectionOptions(ASettingsList: TStringList; const AVendorLib: string);
  end;

  TDatabaseManager = class(TInterfacedObject, IDatabaseManager)
  private
    FMyConnection: TFDConnection;
    FDPhysMySQLDriverLink : TFDPhysMySQLDriverLink;
    FConnected: boolean;
  protected
    procedure DoConnect;
  public
    constructor Create(var AFDConnection: TFDConnection; var AFDPhysMySQLDriverLink: TFDPhysMySQLDriverLink);
    destructor Destroy;
    procedure Connect;
    procedure Disconnect;
    function IsConnected: Boolean;
    procedure SetConnectionOptions(ASettingsList: TStringList; const AVendorLib: string);
  end;

implementation

{ TDatabaseManager }

constructor TDatabaseManager.Create(var AFDConnection: TFDConnection; var AFDPhysMySQLDriverLink: TFDPhysMySQLDriverLink);
begin
   FConnected := False;
   FMyConnection := AFDConnection;
   FDPhysMySQLDriverLink := AFDPhysMySQLDriverLink;
end;

destructor TDatabaseManager.Destroy;
begin
  FreeAndNil(FDPhysMySQLDriverLink);
  FreeAndNil(FMyConnection);
  inherited;
end;

procedure TDatabaseManager.SetConnectionOptions(ASettingsList: TStringList; const AVendorLib: string);
begin
  FMyConnection.Params.Clear;
  FMyConnection.Params.Assign(ASettingsList);

  FDPhysMySQLDriverLink.VendorLib := AVendorLib;
end;

procedure TDatabaseManager.Connect;
begin
  DoConnect;
end;

procedure TDatabaseManager.DoConnect;
begin
  try
  if not(FMyConnection.Connected) then
    try
      FMyConnection.Close;
      FMyConnection.Open;
    except
      raise;
    end;
  finally
    FConnected := FMyConnection.Connected;
  end;
end;

function TDatabaseManager.IsConnected: Boolean;
begin
  Result := FConnected;
end;

procedure TDatabaseManager.Disconnect;
begin
  if Assigned(FMyConnection) then
  begin
    FMyConnection.Close;
  end;
end;

end.
