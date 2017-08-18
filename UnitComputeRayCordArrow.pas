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

const
  MUSTFLOATUSE: string = 'you must use a float value.';
  NOTFOUND: string = 'not found.';

procedure TmainApplicationForm.btComputeRayClick(Sender: TObject);
var
  R, C, F : double;
  value: string;
begin
  edRay.Text := NOTFOUND;

  try
  C := strtofloat(edCord.Text);
  except on E: exception do
    begin
      edCord.Text := MUSTFLOATUSE;
      exit;
    end;
  end;

  try
  F := strtofloat(edArrow.Text);
  except on E: exception do
    begin
      edArrow.Text := MUSTFLOATUSE;
      exit;
    end;
  end;

  if F > 0 then
    begin
      R := (F/2) + ((C*C)/(8*F));
      try
      value := floattostr(R);
      except on E: exception do
        value := NOTFOUND;
      end;
      edRay.Text := value;
    end;
end;

procedure TmainApplicationForm.btComputeArrowClick(Sender: TObject);
var
  R, C, F : double;
  value: string;
begin
  edArrow.Text := NOTFOUND;

  try
  R := strtofloat(edRay.Text);
  except on E: exception do
    begin
      edRay.Text := MUSTFLOATUSE;
      exit;
    end;
  end;

  try
  C := strtofloat(edCord.Text);
  except on E: exception do
    begin
      edCord.Text := MUSTFLOATUSE;
      exit;
    end;
  end;

  if R > 0 then
    begin
      F := R * (1 - sqrt(1 - (C*C)/(4*R*R)));
      try
      value := floattostr(F);
      except on E: exception do
        value := NOTFOUND;
      end;
      edArrow.Text := value;
    end;
end;

procedure TmainApplicationForm.btComputeCordClick(Sender: TObject);
var
  R, C, F : double;
  value: string;
begin
  edCord.Text := NOTFOUND;

  try
  R := strtofloat(edRay.Text);
  except on E: exception do
    begin
      edRay.Text := MUSTFLOATUSE;
      exit;
    end;
  end;

  try
  F := strtofloat(edArrow.Text);
  except on E: exception do
    begin
      edArrow.Text := MUSTFLOATUSE;
      exit;
    end;
  end;

  if R >= F then
    begin
      C := sqrt(4*F*(2*R-F));
      try
      value := floattostr(C);
      except on E: exception do
        value := NOTFOUND;
      end;
      edCord.Text := value;
    end;
end;

end.
