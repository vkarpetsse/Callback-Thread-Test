unit Constants;

interface

const
  // database connection settings
  DB_DATABASE = 'Database';
  DB_SERVER = 'Server';
  DB_PORT = 'Port';
  DB_USERNAME = 'UserName';
  DB_PASSWORD = 'Password';
  DB_DATABASENAME = 'DatabaseName';
  DB_VENDOR_LIB = 'VendorLib';


  DB_DEFAULT_SERVER = 'localhost';
  DB_DEFAULT_PORT = '3306';
  DB_DEFAULT_USER = 'root';
  DB_DEFAULT_DATABASE = 'callback-db';
  DB_DEFAULt_VENDOR_LIB = 'libmysql32.dll';

  // service settings
  SRV_WEB_SERVER = 'WebServer';
  SRV_SERVER_ADDRESS = 'SeverAddress';
  SRV_LANGUAGE = 'Language';
  SRV_PASSWORD = 'Password';
  SRV_BUSINESS_ID = 'BusinessID';
  SRV_CATEGORY_ID =  'CategoryID';

  SRV_DEFAULT_BUSINESS_ID = 1;
  SRV_DEFAULT_CATEGORY_ID = 4;

  // maintenance
  EMPTY_STRING = '';

implementation

end.
