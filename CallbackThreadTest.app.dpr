program CallbackThreadTest.app;

uses
  Vcl.Forms,
  BusinessAPI in 'source\BusinessAPI.pas',
  CallbackThread in 'source\CallbackThread.pas',
  main in 'source\main.pas' {frmMain},
  Settings in 'source\Settings.pas',
  DatabaseMgr in 'source\DatabaseMgr.pas',
  Constants in 'source\Constants.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
