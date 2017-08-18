program ProjectRayCordArrow;

uses
  Forms,
  UnitComputeRayCordArrow in 'UnitComputeRayCordArrow.pas' {mainApplicationForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TmainApplicationForm, mainApplicationForm);
  Application.Run;
end.
