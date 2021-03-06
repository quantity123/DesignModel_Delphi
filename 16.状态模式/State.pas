unit State;

interface

type
  TWork = class;

  //工作状态基类
  TState = class
  public
    procedure WriteProgram(W: TWork); virtual; abstract;
  end;

  //上午工作状态
  TForenoonState = class(TState)
  public
    procedure WriteProgram(W: TWork); override;
  end;

  //中午工作状态
  TNoonState = class(TState)
  public
    procedure WriteProgram(W: TWork); override;
  end;

  //下午和傍晚工作状态
  TAfternoonState = class(TState)
  public
    procedure WriteProgram(W: TWork); override;
  end;

  //晚间工作状态
  TEveningState = class(TState)
  public
    procedure WriteProgram(W: TWork); override;
  end;

  //睡眠工作状态
  TSleepingState = class(TState)
  public
    procedure WriteProgram(W: TWork); override;
  end;

    //下班休息状态
  TRestState = class(TState)
  public
    procedure WriteProgram(W: TWork); override;
  end;

  TWork = class
  private
    FState: TState;
    FHour: Double;
    FFinish: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure WriteProgram;
    property State: TState read FState write FState;
    property Hour: Double read FHour write FHour;
    property Finish: Boolean read FFinish write FFinish;
  end;

implementation

uses
  SysUtils, Dialogs;

{ TForenoonState }

procedure TForenoonState.WriteProgram(W: TWork);
var
  S: string;
begin
  if W.Hour < 12 then
  begin
    S := Format('当前时间：%f点上午工作，精神百倍。', [W.Hour]);
    ShowMessage(S);
  end else
  begin
    //如果这里根据条件 释放和创建任何类就可以变化成各种时间段的状态，节约内存很好，比如界面Tab页程序。
    W.State.Free;
    W.State := TNoonState.Create;
    W.WriteProgram;
  end;
end;

{ TNoonState }

procedure TNoonState.WriteProgram(W: TWork);
var
  S: string;
begin
  if W.Hour < 13 then
  begin
    S := Format('当前时间：%f点饿了，午饭；犯困，午休。', [W.Hour]);
    ShowMessage(S);
  end else
  begin
    W.State.Free;
    W.State := TAfternoonState.Create;
    W.WriteProgram;
  end;
end;

{ TAfternoonState }

procedure TAfternoonState.WriteProgram(W: TWork);
var
  S: string;
begin
  if W.Hour < 17 then
  begin
    S := Format('当前时间：%f点下午状态还不错，继续努力。', [W.Hour]);
    ShowMessage(S);
  end else
  begin
    W.State.Free;
    W.State := TEveningState.Create;
    W.WriteProgram;
  end;
end;

{ TEveningState }

procedure TEveningState.WriteProgram(W: TWork);
var
  S: string;
begin
  if W.Finish then
  begin
    W.State := TRestState.Create;
    W.WriteProgram;
  end else
  begin
    if W.Hour < 21 then
    begin
      S := Format('当前时间：%f点加班哦，疲累之极。', [W.Hour]);
      ShowMessage(S);
    end else
    begin
      W.State.Free;
      W.State := TSleepingState.Create;
      W.WriteProgram;
    end;
  end;
end;

{ TSleepingState }

procedure TSleepingState.WriteProgram(W: TWork);
var
  S: string;
begin
  S := Format('当前时间：%f点不行了，睡着了。', [W.Hour]);
  ShowMessage(S);
end;

{ TRestState }

procedure TRestState.WriteProgram(W: TWork);
var
  S: string;
begin
  S := Format('当前时间：%f点下班回家了。', [W.Hour]);
  ShowMessage(S);
end;

{ TWork }

constructor TWork.Create;
begin
  FState := TForenoonState.Create;
end;

destructor TWork.Destroy;
begin
  FState.Free;
  inherited;
end;

procedure TWork.WriteProgram;
begin
  FState.WriteProgram(Self);  
end;

end.
