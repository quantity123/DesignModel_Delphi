unit CashSuper;

interface

type
  TCashSuper = class
  public
    function AcceptCash(Money: Double): Double; virtual; abstract;
  end;

  TCashNormal = class(TCashSuper)
  public
    constructor Create;
    destructor Destroy; override;
    function AcceptCash(Money: Double): Double; override;
  end;

  TCashRebate = class(TCashSuper)
  private
    FMoneyRebate: Double;
  public
    constructor Create(MoneyRebate: string);
    destructor Destroy; override;
    function AcceptCash(Money: Double): Double; override;
  end;

  TCashReturn = class(TCashSuper)
  private
    FMoneyCondition: Double;
    FMoneyReturn: Double;
  public
    constructor Create(MoneyCondition: string; MoneyReturn: string);
    destructor Destroy; override;
    function AcceptCash(Money: Double): Double; override;
  end;

implementation

uses
  SysUtils;

{ TCashNormal }

function TCashNormal.AcceptCash(Money: Double): Double;
begin
  Result := Money;
end;

constructor TCashNormal.Create;
begin

end;

destructor TCashNormal.Destroy;
begin

  inherited;
end;

{ TCashRebate }

function TCashRebate.AcceptCash(Money: Double): Double;
begin
  Result := Money * FMoneyRebate;
end;

constructor TCashRebate.Create(MoneyRebate: string);
begin
  FMoneyRebate := StrToFloat(MoneyRebate);
end;

destructor TCashRebate.Destroy;
begin

  inherited;
end;

{ TCashReturn }

function TCashReturn.AcceptCash(Money: Double): Double;
begin
  Result := Money;
  if Result >= FMoneyCondition then
    Result := Money - Money / FMoneyCondition * FMoneyReturn;
end;

constructor TCashReturn.Create(MoneyCondition: string; MoneyReturn: string);
begin
  FMoneyCondition := StrToFloat(MoneyCondition);
  FMoneyReturn := StrToFloat(MoneyReturn);
end;

destructor TCashReturn.Destroy;
begin

  inherited;
end;

end.
