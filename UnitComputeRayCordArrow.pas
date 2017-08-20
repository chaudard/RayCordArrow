unit UnitComputeRayCordArrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TmainApplicationForm = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    lbRay: TLabel;
    lbCord: TLabel;
    lbArrow: TLabel;
    edRay: TEdit;
    edCord: TEdit;
    edArrow: TEdit;
    btComputeRay: TButton;
    btComputeArrow: TButton;
    btComputeCord: TButton;
    procedure btComputeRayClick(Sender: TObject);
    procedure btComputeArrowClick(Sender: TObject);
    procedure btComputeCordClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  mainApplicationForm: TmainApplicationForm;

implementation

{$R *.dfm}

uses
  circleUnit; //uses methods in Circle.dll

const
  MUSTPOSITIVEFLOATUSEORCHANGECOMMA: string = 'you must use a float (>=0) value, or change the comma.';
  NOTFOUND: string = 'not found.';

function TransfoDoubleToStr(const value: double): string;
begin
  try
    result := formatfloat('#.##', value);
  except on E: exception do
    result := NOTFOUND;
  end;
end;

function getDoublePositiveNonNullValue(aText: TCaption; out value: double):  boolean;
begin
  value := 0;
  try
    value := strtofloat(aText);
    if value > 0 then
      result := true;
  except on E: exception do
    begin
      result := false;
    end;
  end;
end;

procedure TmainApplicationForm.btComputeRayClick(Sender: TObject);
var
  R, C, F : double;
  value: string;
begin
  edRay.Text := NOTFOUND;
  if (not getDoublePositiveNonNullValue(edCord.Text, C))
  or (not getDoublePositiveNonNullValue(edArrow.Text, F))
  then
  begin
    showMessage(MUSTPOSITIVEFLOATUSEORCHANGECOMMA);
    exit;
  end;
  R := ComputeRay(C, F);  // dll method
  value := TransfoDoubleToStr(R);
  edRay.Text := value;
end;

procedure TmainApplicationForm.btComputeArrowClick(Sender: TObject);
var
  R, C, F : double;
  value: string;
begin
  edArrow.Text := NOTFOUND;
  if (not getDoublePositiveNonNullValue(edRay.Text, R))
  or (not getDoublePositiveNonNullValue(edCord.Text, C))
  then
  begin
    showMessage(MUSTPOSITIVEFLOATUSEORCHANGECOMMA);
    exit;
  end;
  F := ComputeArrow(C, R); // dll method
  value := TransfoDoubleToStr(F);
  edArrow.Text := value;
end;

procedure TmainApplicationForm.btComputeCordClick(Sender: TObject);
var
  R, C, F : double;
  value: string;
begin
  edCord.Text := NOTFOUND;
  if (not getDoublePositiveNonNullValue(edRay.Text, R))
  or (not getDoublePositiveNonNullValue(edArrow.Text, F))
  then
  begin
    showMessage(MUSTPOSITIVEFLOATUSEORCHANGECOMMA);
    exit;
  end;
  C := ComputeCord(F, R); // dll method
  value := TransfoDoubleToStr(C);
  edCord.Text := value;
end;

end.
