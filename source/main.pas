unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.UITypes,
  Vcl.Imaging.pngimage, Data.DB, Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.Samples.Spin,

  Settings, DatabaseMgr, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FireDAC.DApt,

  CallbackThread, Datasnap.DBClient, Datasnap.Provider, Vcl.Grids, Vcl.DBGrids;

type
  TResponse = record
    ResultCode: integer;
    ResultMessage: string;
    EntityId: integer;
  end;

  TCallBackResponseResult = record
    ServiceResponse: TResponse;
    CurrentEntity:  TEntity;
  end;

  TfrmMain = class(TForm)
    pnlBottom: TPanel;
    btnBack: TButton;
    btnNext: TButton;
    imgImport: TImage;
    pnlLeft: TPanel;
    pcMain: TPageControl;
    tsDatabase: TTabSheet;
    tsWebService: TTabSheet;
    pnlDatabase: TPanel;
    pUserName: TPanel;
    lbUsername: TLabel;
    edtUsername: TEdit;
    pPassword: TPanel;
    lbPassword: TLabel;
    edtPassword: TEdit;
    pServer: TPanel;
    lbServer: TLabel;
    pPort: TPanel;
    lbPort: TLabel;
    edtPort: TEdit;
    pDatabase: TPanel;
    lbDatabase: TLabel;
    lblDatabaseSettings: TLabel;
    ActionList: TActionList;
    actNext: TAction;
    tsResultLog: TTabSheet;
    actMain: TAction;
    edtServer: TEdit;
    edtDatabase: TEdit;
    pVendorLib: TPanel;
    lblVendorLib: TLabel;
    edtVendorLib: TEdit;
    btnTestConnection: TButton;
    lblWebServiceSettings: TLabel;
    pnlService: TPanel;
    pServiceAddress: TPanel;
    lblServiceAddress: TLabel;
    edtServiceAddress: TEdit;
    gbDefaultValues: TGroupBox;
    lblBussinessID: TLabel;
    lblCategoryID: TLabel;
    lblLanguage: TLabel;
    cbLanguage: TComboBox;
    Password: TLabel;
    edtDefaultPassword: TEdit;
    BtnStartImport: TButton;
    ProgressBar: TProgressBar;
    lblCurrentProcessStatus: TLabel;
    edtCategoryID: TSpinEdit;
    edtBussinessID: TSpinEdit;
    lblResultLogHeader: TLabel;
    cdsExportResultLog: TClientDataSet;
    dsExportResultLog: TDataSource;
    gridResultLog: TDBGrid;
    dspxportResultLog: TDataSetProvider;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNextClick(Sender: TObject);
    procedure pcMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btnBackClick(Sender: TObject);
    procedure actMainUpdate(Sender: TObject);
    procedure btnTestConnectionClick(Sender: TObject);
    procedure BtnStartImportClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    FMyConnection :TFDConnection;
    FMyDriverLink : TFDPhysMySQLDriverLink;
    FappSettings: IAppicationSettings;
    FdbManager: IDatabaseManager;
    FCallBackResponseResult: TArray<TCallBackResponseResult>;
    procedure ReadDatabaseSettings(AAppSettings: IAppicationSettings);
    procedure ReadServiceSettings(AAppSettings: IAppicationSettings);
    procedure WriteServiceSettings(AAppSettings: IAppicationSettings);
    procedure WriteDatabaseSettings(AAppSettings: IAppicationSettings);

    procedure SetConnectionOptions(var AIDatabaseManager: IDatabaseManager);
    function CheckDatabaseConnection: Boolean;
    function GetDataFromCallbackTable(AConnection: TFDConnection; AParams: TServiceSettings): TArray<TEntity>;

    procedure ThreadProgress(Sender: TObject; const ACurrent, ATotal: Integer; const AMsg: String; const AEntity: TEntity);
    procedure ThreadFinished(Sender: TObject; const Success: Boolean);
    procedure ThreadException(Sender: TObject; E: Exception);

    procedure PopulateResultLog(const ACallBackResponseResult: TArray<TCallBackResponseResult>);

    procedure SetEnabledState(AState: Boolean);
  public
    { Public declarations }
    procedure HideTabControlTabs(var APageControl: TPageControl);
  end;

var
  frmMain: TfrmMain;


implementation

uses System.IOUtils, System.JSON, Constants, BusinessAPI;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  var LFileName := ExtractFilePath(ParamStr(0)) + 'settings.ini';

  FappSettings := TAppicationSettings.Create(LFileName);

  FMyConnection := TFDConnection.Create(self);
  FMyDriverLink := TFDPhysMySQLDriverLink.Create(self);

  FdbManager := TDatabaseManager.Create(FMyConnection, FMyDriverLink);

  ReadDatabaseSettings(FappSettings);
  ReadServiceSettings(FappSettings);

  HideTabControlTabs(pcMain);

  pcMain.ActivePageIndex := 0;
end;

procedure TfrmMain.ReadDatabaseSettings(AAppSettings: IAppicationSettings);
var
  ADatabaseSettings: TDatabaseSettings;
begin
  ADatabaseSettings := AAppSettings.ReadDatabaseSettings();

  edtUsername.Text := ADatabaseSettings.UserName;
  edtPassword.Text := ADatabaseSettings.Password;
  edtServer.Text := ADatabaseSettings.Server;
  edtPort.Text := ADatabaseSettings.Port;
  edtDatabase.Text := ADatabaseSettings.Database;
  edtVendorLib.Text := ADatabaseSettings.VendorLib;
end;

procedure TfrmMain.WriteDatabaseSettings(AAppSettings: IAppicationSettings);
var
  ADatabaseSettings: TDatabaseSettings;
begin
  ADatabaseSettings.UserName := edtUsername.Text;
  ADatabaseSettings.Password :=  edtPassword.Text;
  ADatabaseSettings.Server := edtServer.Text;
  ADatabaseSettings.Port := edtPort.Text;
  ADatabaseSettings.Database := edtDatabase.Text;
  ADatabaseSettings.VendorLib := edtVendorLib.Text ;

  AAppSettings.WriteDatabaseSettings(ADatabaseSettings);
end;

procedure TfrmMain.ReadServiceSettings(AAppSettings: IAppicationSettings);
var
  AServiceSettings: TServiceSettings;
begin
  AServiceSettings := AAppSettings.ReadServiceSettings();

  edtServiceAddress.Text := AServiceSettings.SeverAddress;
  cbLanguage.Text := AServiceSettings.Language;
  edtDefaultPassword.Text := AServiceSettings.Password;
  edtBussinessID.Value := AServiceSettings.BusinessID;
  edtCategoryID.Value := AServiceSettings.CategoryID;
end;

procedure TfrmMain.WriteServiceSettings(AAppSettings: IAppicationSettings);
var
  AServiceSettings: TServiceSettings;
  AOutIntValue: integer;
begin
  AServiceSettings.SeverAddress := edtServiceAddress.Text;
  AServiceSettings.Language := cbLanguage.Text;
  AServiceSettings.Password := edtDefaultPassword.Text;

  if TryStrToInt(edtBussinessID.Text, AOutIntValue) then
    AServiceSettings.BusinessID := AOutIntValue
  else AServiceSettings.BusinessID := SRV_DEFAULT_BUSINESS_ID;

  if TryStrToInt(edtCategoryID.Text, AOutIntValue) then
    AServiceSettings.CategoryID := AOutIntValue
  else AServiceSettings.BusinessID := SRV_DEFAULT_CATEGORY_ID;

  AAppSettings.WriteServiceSettings(AServiceSettings);
end;

function GetDBConnectParamsSettings(const AAddress: string; const APort: string; const AUserName: string;
  const APassword: string; const ADatabase: string): TStringList;
begin
  Result := TStringList.Create;
  Result.Add('DriverID=MySQL');
  Result.Add(format('Server=%s', [AAddress]));
  Result.Add(format('Port=%s', [APort]));
  Result.Add(format('User_Name=%s', [AUserName]));
  Result.Add(format('Password=%s', [APassword]));
  Result.Add(format('Database=%s', [ADatabase]));
end;


procedure TfrmMain.SetConnectionOptions(var AIDatabaseManager: IDatabaseManager);
begin
  var LParamList := GetDBConnectParamsSettings(edtServer.Text,  edtPort.Text, edtUserName.Text,
                      edtPassword.Text, edtDatabase.Text);
  try
    AIDatabaseManager.SetConnectionOptions(LParamList, edtVendorLib.Text);
  finally
    LParamList.Free;
  end;
end;

function TfrmMain.CheckDatabaseConnection: Boolean;
begin
  Result := False;
  SetConnectionOptions(FdbManager);
  try
    FdbManager.Connect;
    if FdbManager.IsConnected then
      Result := True;
  except
    on E:Exception do begin
      MessageDlg(E.Message, TMsgDlgType.mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmMain.btnTestConnectionClick(Sender: TObject);
begin
 if CheckDatabaseConnection then
   MessageDlg('Connected is successfully.', TMsgDlgType.mtInformation, [mbOK], 0);
end;

procedure TfrmMain.actMainUpdate(Sender: TObject);
begin
  btnBack.Enabled := (pcMain.ActivePageIndex > 0);
  btnNext.Enabled := (pcMain.ActivePageIndex <> pcMain.PageCount - 1);
end;

procedure TfrmMain.btnBackClick(Sender: TObject);
begin
  if pcMain.ActivePageIndex = 0 then
    exit;
  pcMain.SelectNextPage(False, false) ;
end;

procedure TfrmMain.btnNextClick(Sender: TObject);
begin
  if pcMain.ActivePageIndex = pcMain.PageCount - 1 then
    Exit;
  pcMain.SelectNextPage(true, false) ;
end;

function TfrmMain.GetDataFromCallbackTable(AConnection: TFDConnection; AParams: TServiceSettings): TArray<TEntity>;
var
  LEntity: TEntity;
begin
  Result := [];

  var qryCallBack := TFDQuery.Create(nil);
  qryCallBack.Connection := AConnection;
  try
    qryCallBack.SQL.Text := 'select CallBackID, CID from callback order by CallBackID limit 10000';
    try
      qryCallBack.Open;
      qryCallBack.DisableControls;
      try
        while not(qryCallBack.Eof) do
        begin
          LEntity.ol_EntityId := 1;
          LEntity.ol_UserName := '';
          LEntity.ol_Password := '';
          LEntity.BusinessId := AParams.BusinessID;
          LEntity.Employee_EntityId := 0;
          LEntity.CategoryID := AParams.CategoryID;
          LEntity.Email := '';
          LEntity.Password := AParams.Password;
          LEntity.FirstName := '';
          LEntity.LastName := '';
          LEntity.Mobile := qryCallBack.FieldByName('CID').AsString;
          LEntity.CountryISO := AParams.Language;
          LEntity.affiliate_entityID := 0;

          LEntity.CallBackID := qryCallBack.FieldByName('CallBackID').AsInteger;

          Result :=  Result + [LEntity];

          qryCallBack.Next;
        end;
      finally
        qryCallBack.EnableControls;
      end;
    except
      on E:Exception do begin
        MessageDlg(E.Message, TMsgDlgType.mtError, [mbOk], 0);
        Exit;
      end;
    end;
  finally
    qryCallBack.Free;
  end;
end;

procedure TfrmMain.BtnStartImportClick(Sender: TObject);
var
  AServiceSettings : TServiceSettings;
begin
  if not(CheckDatabaseConnection) then
  begin
    MessageDlg('Cannot connect to database. Please, check for connection settings.', TMsgDlgType.mtError, [mbOk], 0);
    exit;
  end;

  if Trim(edtServiceAddress.Text) = EmptyStr then
  begin
    MessageDlg('Service Addrress is required.', TMsgDlgType.mtError, [mbOk], 0);
    if edtServiceAddress.CanFocus then
      edtServiceAddress.SetFocus;
    exit;
  end;

  lblCurrentProcessStatus.Caption := '';
  lblCurrentProcessStatus.Visible :=True;

  Self.SetEnabledState(False);

  AServiceSettings.SeverAddress := edtServiceAddress.Text;
  AServiceSettings.Language := cbLanguage.Text;
  AServiceSettings.Password := edtDefaultPassword.Text;
  AServiceSettings.BusinessID := edtBussinessID.Value;
  AServiceSettings.CategoryID := edtCategoryID.Value;

  var ACallBackEntities: TArray<TEntity>;

  cdsExportResultLog.Close;

  lblCurrentProcessStatus.Caption := 'Reading data fro Callback table...';
  try
    ACallBackEntities := GetDataFromCallbackTable(FMyConnection, AServiceSettings);
  except
    on E:Exception do begin
      Self.SetEnabledState(True);
      lblCurrentProcessStatus.Caption := EmptyStr;
      MessageDlg(E.Message, TMsgDlgType.mtError, [mbOk], 0);
      exit;
    end;
  end;

  var FBusinessAPI := GetIBusinessAPI(False, edtServiceAddress.Text);

  var FCallbackThread := TCallbackThread.Create(FBusinessAPI, ACallBackEntities);

  FCallbackThread.OnProgress := ThreadProgress;
  FCallbackThread.OnFinished := ThreadFinished;
  FCallbackThread.OnException := ThreadException;

  FCallbackThread.FreeOnTerminate := True;
  FCallbackThread.Start;
end;

procedure TfrmMain.ThreadProgress(Sender: TObject; const ACurrent, ATotal: Integer; const AMsg: String; const AEntity: TEntity);

function GetResponseFromJson(const AJsonContent: string; out AResponseRecord: TResponse): boolean;
begin
  Result := False;

  var jsv := TJSONObject.ParseJSONValue(AJsonContent) as TJSONObject;

  if jsv = nil then Exit;

  try
    var LJSONPair :=  jsv.Get('ResultCode');
    var LResultCode :=StrToInt(LJSONPair.JsonValue.ToString);

    LJSONPair :=  jsv.Get('ResultMessage');
    var LResultMessage := LJSONPair.JsonValue.ToString;

    var LEntityId := 0;
    if LResultCode = 0 then
    begin
      LJSONPair :=  jsv.Get('EntityId');
      LEntityId := StrToInt(LJSONPair.JsonValue.ToString);
    end;

    AResponseRecord.ResultCode := LResultCode;
    AResponseRecord.ResultMessage := LResultMessage;
    AResponseRecord.EntityId := LEntityId;
    Result := true;
  finally
    jsv.Free; //DisposeOf;
  end;
end;

begin
  ProgressBar.Max := ATotal;
  ProgressBar.Position := ACurrent;
  lblCurrentProcessStatus.Caption := format('Record %d of %d', [ACurrent, ATotal]);

  var AResponse: TResponse;
  if GetResponseFromJson(AMsg, AResponse) then
  begin
    var FCallBackResponse : TCallBackResponseResult;
    FCallBackResponse.ServiceResponse := AResponse;
    FCallBackResponse.CurrentEntity := AEntity;

    FCallBackResponseResult := FCallBackResponseResult + [FCallBackResponse];
  end;
end;

procedure TfrmMain.ThreadFinished(Sender: TObject; const Success: Boolean);
begin
  if Success then
  begin
    lblCurrentProcessStatus.Caption := 'Complete';
    PopulateResultLog(FCallBackResponseResult);
  end else
    lblCurrentProcessStatus.Caption := 'Failed';

  SetEnabledState(True);
end;

procedure TfrmMain.ThreadException(Sender: TObject; E: Exception);
begin
  MessageDlg(format('EXCEPTION: %s', [E.Message]), mtError, [mbOK], 0);
  SetEnabledState(True);
end;

procedure TfrmMain.PopulateResultLog(const ACallBackResponseResult: TArray<TCallBackResponseResult>);
begin
  lblCurrentProcessStatus.Caption := 'Populate CallBackResponse...';

  cdsExportResultLog.CreateDataSet;
  cdsExportResultLog.DisableControls;
  try
    for var CallBackResponse in ACallBackResponseResult do
    begin
      cdsExportResultLog.Insert;
      cdsExportResultLog.FieldByName('CallbackID').AsInteger := CallBackResponse.CurrentEntity.CallBackID;
      cdsExportResultLog.FieldByName('Mobile').AsString := CallBackResponse.CurrentEntity.Mobile;
      cdsExportResultLog.FieldByName('ResultCode').AsInteger := CallBackResponse.ServiceResponse.ResultCode;
      cdsExportResultLog.FieldByName('EntityID').AsInteger := CallBackResponse.ServiceResponse.EntityId;
      cdsExportResultLog.FieldByName('MessageResult').AsString := CallBackResponse.ServiceResponse.ResultMessage;
      cdsExportResultLog.Post;
    end;
  finally
    cdsExportResultLog.EnableControls;
    cdsExportResultLog.First;
  end;

  lblCurrentProcessStatus.Caption := '';
end;

procedure TfrmMain.SetEnabledState(AState: Boolean);
begin
  BtnStartImport.Enabled := AState;
end;

procedure TfrmMain.pcMainChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := True;
end;

procedure TfrmMain.HideTabControlTabs(var APageControl: TPageControl);
begin
  for var page := 0 to APageControl.PageCount - 1 do
  begin
    APageControl.Pages[page].TabVisible := false;
  end;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FdbManager := nil;

  FMyConnection.Free;
  FMyDriverLink.Free;

  Assert(FappSettings <> nil, 'FormClose assert: FappSettings is null');
  if FappSettings <> nil then
  begin
    WriteDatabaseSettings(FappSettings);
    WriteServiceSettings(FappSettings);
  end;
end;

end.
