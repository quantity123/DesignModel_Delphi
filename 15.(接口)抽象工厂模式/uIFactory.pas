unit uIFactory;

interface

uses
  uIUser, uIDepartment;

type
  IFactory = interface
    function CreateUser: IUser;
    function CreateDepartment: IDepartment;
  end;

  TSqlServerFactory = class(TInterfacedObject, IFactory)
  public
    function CreateUser: IUser;
    function CreateDepartment: IDepartment;
  end;

  TAccessFactory = class(TInterfacedObject, IFactory)
  public
    function CreateUser: IUser;
    function CreateDepartment: IDepartment;
  end;

implementation

{ TAccessFactory }

function TAccessFactory.CreateDepartment: IDepartment;
begin
  Result := TAccessDepartment.Create;
end;

function TAccessFactory.CreateUser: IUser;
begin
  Result := TAccessUser.Create;
end;

{ TSqlServerFactory }

function TSqlServerFactory.CreateDepartment: IDepartment;
begin
  Result := TSqlServerDepartment.Create;
end;

function TSqlServerFactory.CreateUser: IUser;
begin
  Result := TSqlServerUser.Create;
end;

end.
