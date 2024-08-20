
unit BusinessAPI;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  ArrayOfInt = array of Integer;

  IBusinessAPI = interface(IInvokable)
  ['{FC4260E4-8538-A2CD-8D30-5C86FF7E21B7}']

    function  Entity_Add(const ol_EntityId: Integer;
                         const ol_UserName: string;
                         const ol_Password: string;
                         const BusinessId: Integer;
                         const Employee_EntityId: Integer;
                         const CategoryID: Integer;
                         const Email: string;
                         const Password: string;
                         const FirstName: string;
                         const LastName: string;
                         const Mobile: string;
                         const CountryISO: string;
                         const affiliate_entityID: Integer): string; stdcall;

    function  Telemarketing_add(const ol_EntityID: Integer; const ol_Username: string; const ol_Password: string; const campaignID: Integer; const EntityIds: ArrayOfInt): string; stdcall;

  end;

const
  defWSDL = 'http://192.168.0.75:33322/wsdl/IBusinessAPI?mode=default';
  defURL  = 'http://192.168.0.75:33322/soap/IBusinessAPI';
  defSvc  = 'IBusinessAPIservice';
  defPrt  = 'IBusinessAPIPort';

function GetIBusinessAPI(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IBusinessAPI;

implementation
  uses System.SysUtils;

function GetIBusinessAPI(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IBusinessAPI;
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IBusinessAPI);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;

initialization
  { IBusinessAPI }
  InvRegistry.RegisterInterface(TypeInfo(IBusinessAPI), 'urn:BusinessApiIntf-IBusinessAPI', '');
end.
