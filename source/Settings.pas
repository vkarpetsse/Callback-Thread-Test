unit Settings;

interface

uses IniFiles;

type

  TDatabaseSettings = record
    UserName: string;
    Password: string;
    Server: string;
    Port: string;
    Database: string;
    VendorLib: string;
   end;

 TServiceSettings = record
    SeverAddress: string;
    Language: string;
    Password: string;
    BusinessID: integer;
    CategoryID: integer;
  end;


  IAppicationSettings = interface
  ['{BA6D66DC-74A0-41AD-9622-2AC56FDE5B7F}']
    function ReadDatabaseSettings(): TDatabaseSettings;
    procedure WriteDatabaseSettings(ADatabaseSettings: TDatabaseSettings);
    function ReadServiceSettings(): TServiceSettings;
    procedure WriteServiceSettings(AServiceSettings: TServiceSettings);
  end;


  TAppicationSettings = class(TInterfacedObject, IAppicationSettings)
  private
    FIniFile: TIniFile;
    function GetIniFile: TIniFile;
  public
    constructor Create(const AFileName: string);
    destructor Destroy; override;
    function ReadDatabaseSettings(): TDatabaseSettings;
    procedure WriteDatabaseSettings(ADatabaseSettings: TDatabaseSettings);
    function ReadServiceSettings(): TServiceSettings;
    procedure WriteServiceSettings(AServiceSettings: TServiceSettings);
  property IniFile: TIniFile read GetIniFile write FIniFile;
  end;


implementation

uses Constants;

{ TAppicationSettings }

constructor TAppicationSettings.Create(const AFileName: string);
begin
  FIniFile := TIniFile.Create(AFileName);
end;

destructor TAppicationSettings.Destroy;
begin
  if Assigned(FIniFile) then
    FIniFile.Free;
  inherited;
end;

function TAppicationSettings.GetIniFile: TIniFile;
begin
  Result := FIniFile;
end;

function TAppicationSettings.ReadDatabaseSettings: TDatabaseSettings;
begin
  Result.UserName := FIniFile.ReadString(DB_DATABASE, DB_USERNAME, DB_DEFAULT_USER);
  Result.Password := FIniFile.ReadString(DB_DATABASE, DB_PASSWORD, EMPTY_STRING);
  Result.Server := FIniFile.ReadString(DB_DATABASE,DB_SERVER, DB_DEFAULT_SERVER);
  Result.Port := FIniFile.ReadString(DB_DATABASE, DB_PORT, DB_DEFAULT_PORT);
  Result.Database := FIniFile.ReadString(DB_DATABASE, DB_DATABASENAME, DB_DEFAULT_DATABASE);
  Result.VendorLib := FIniFile.ReadString(DB_DATABASE, DB_VENDOR_LIB, DB_DEFAULt_VENDOR_LIB);
end;

procedure TAppicationSettings.WriteDatabaseSettings(ADatabaseSettings: TDatabaseSettings);
begin
  FIniFile.WriteString(DB_DATABASE, DB_USERNAME, ADatabaseSettings.UserName);
  FIniFile.WriteString(DB_DATABASE, DB_PASSWORD, ADatabaseSettings.Password);
  FIniFile.WriteString(DB_DATABASE, DB_SERVER, ADatabaseSettings.Server);
  FIniFile.WriteString(DB_DATABASE, DB_PORT, ADatabaseSettings.Port);
  FIniFile.WriteString(DB_DATABASE, DB_DATABASENAME, ADatabaseSettings.Database);
  FIniFile.WriteString(DB_DATABASE, DB_VENDOR_LIB, ADatabaseSettings.VendorLib);
end;

function TAppicationSettings.ReadServiceSettings: TServiceSettings;
begin
  Result.SeverAddress  := FIniFile.ReadString(SRV_WEB_SERVER, SRV_SERVER_ADDRESS, EMPTY_STRING);
  Result.Language := FIniFile.ReadString(SRV_WEB_SERVER, SRV_LANGUAGE, EMPTY_STRING);
  Result.Password := FIniFile.ReadString(SRV_WEB_SERVER, SRV_PASSWORD, EMPTY_STRING);
  Result.CategoryID := FIniFile.ReadInteger(SRV_WEB_SERVER, SRV_CATEGORY_ID, SRV_DEFAULT_CATEGORY_ID);
  Result.BusinessID := FIniFile.ReadInteger(SRV_WEB_SERVER, SRV_BUSINESS_ID, SRV_DEFAULT_BUSINESS_ID);
end;

procedure TAppicationSettings.WriteServiceSettings(AServiceSettings: TServiceSettings);
begin
  FIniFile.WriteString(SRV_WEB_SERVER, SRV_SERVER_ADDRESS, AServiceSettings.SeverAddress);
  FIniFile.WriteString(SRV_WEB_SERVER, SRV_LANGUAGE, AServiceSettings.Language);
  FIniFile.WriteString(SRV_WEB_SERVER, SRV_PASSWORD, AServiceSettings.Password);
  FIniFile.WriteInteger(SRV_WEB_SERVER, SRV_CATEGORY_ID, AServiceSettings.CategoryID);
  FIniFile.WriteInteger(SRV_WEB_SERVER, SRV_BUSINESS_ID, AServiceSettings.BusinessID);
end;

end.
