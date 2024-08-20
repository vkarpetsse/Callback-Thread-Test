unit CallbackThread;

interface

uses
  System.Classes,  System.SysUtils, Winapi.Windows, BusinessAPI;

type
    TEntity = Record
    ol_EntityId: Integer;
    ol_UserName: string;
    ol_Password: string;
    BusinessId: Integer;
    Employee_EntityId: Integer;
    CategoryID: Integer;
    Email: string;
    Password: string;
    FirstName: string;
    LastName: string;
    Mobile: string;
    CountryISO: string;
    affiliate_entityID : integer;
    CallBackID: integer;
  end;

  TProgressEvent = procedure(Sender: TObject; const Current, Total: Integer;
    const Msg: String; const AEntity: TEntity) of object;

  TTerminateEvent = procedure(Sender: TObject; const Success: Boolean) of object;

  TExceptionEvent = procedure(Sender: TObject; E: Exception) of object;

  TCallbackThread = class(TThread)
  private
    FBusinessAPI: IBusinessAPI;
    FEntities: TArray<TEntity>;
    FException: Exception;
    FOnProgress: TProgressEvent;
    FOnFinished: TTerminateEvent;
    FOnException: TExceptionEvent;
  protected
    procedure Execute(); override;
  public
    constructor Create(ABusinessAPI: IBusinessAPI;  AEntities: TArray<TEntity>); reintroduce;
    destructor Destroy; override;
    property OnProgress: TProgressEvent read FOnProgress write FOnProgress;
    property OnFinished: TTerminateEvent read FOnFinished write FOnFinished;
    property OnException: TExceptionEvent read FOnException write FOnException;
  end;

implementation

uses Winapi.ActiveX;

{ TCallbackThread }

constructor TCallbackThread.Create(ABusinessAPI: IBusinessAPI; AEntities: TArray<TEntity>);
begin
  inherited Create(True);
  FreeOnTerminate := True;
  FBusinessAPI := ABusinessAPI;
  FEntities := AEntities;
end;

destructor TCallbackThread.Destroy;
begin
  inherited;
end;

procedure TCallbackThread.Execute;
begin
  try
    CoInitialize(nil);
    try
      var currIteration := 0;
      var LTotal := length(FEntities);

      for var LEntity in FEntities do
      begin
        inc(currIteration);
        var LResponse := FBusinessAPI.Entity_Add(LEntity.ol_EntityId,
                        LEntity.ol_UserName,
                        LEntity.ol_Password,
                        LEntity.BusinessId ,
                        LEntity.Employee_EntityId,
                        LEntity.CategoryID,
                        LEntity.Email,
                        LEntity.Password,
                        LEntity.FirstName,
                        LEntity.LastName,
                        LEntity.Mobile,
                        LEntity.CountryISO,
                        LEntity.affiliate_entityID);
        TThread.Synchronize(nil,
          procedure
            begin
              if Assigned(FOnProgress) then
                FOnProgress(Self, currIteration, LTotal, LResponse,LEntity );
            end);
      end;
    except
      on E:Exception do begin
        FException := E;
        TThread.Synchronize(nil,
          procedure
            begin
              if Assigned(FOnException) then
                FOnException(Self, FException);

              if Assigned(OnFinished) then
                FOnFinished(nil, False);
            end);
          exit;
      end;
    end;

    TThread.Synchronize(nil,
        procedure
        begin
          if Assigned(FOnFinished) then
            FOnFinished(nil, True);
        end);

  finally
    CoUninitialize;
  end;
end;

end.
