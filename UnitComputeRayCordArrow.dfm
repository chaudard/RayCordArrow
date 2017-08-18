object mainApplicationForm: TmainApplicationForm
  Left = 0
  Top = 0
  Caption = 'Compute Ray Cord Arrow'
  ClientHeight = 105
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 497
    Height = 105
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 345
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 493
      Height = 101
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 341
      object lbRay: TLabel
        Left = 16
        Top = 16
        Width = 26
        Height = 13
        Caption = 'ray R'
      end
      object lbCord: TLabel
        Left = 16
        Top = 43
        Width = 31
        Height = 13
        Caption = 'cord C'
      end
      object lbArrow: TLabel
        Left = 14
        Top = 70
        Width = 37
        Height = 13
        Caption = 'arrow F'
      end
      object edRay: TEdit
        Left = 59
        Top = 13
        Width = 257
        Height = 21
        TabOrder = 0
        Text = '100'
      end
      object edCord: TEdit
        Left = 59
        Top = 40
        Width = 257
        Height = 21
        TabOrder = 1
        Text = '200'
      end
      object edArrow: TEdit
        Left = 58
        Top = 67
        Width = 258
        Height = 21
        TabOrder = 2
        Text = '100'
      end
      object btComputeRay: TButton
        Left = 322
        Top = 11
        Width = 155
        Height = 25
        Caption = 'R=(C'#178'/8F)+(F/2)'
        TabOrder = 3
        OnClick = btComputeRayClick
      end
      object btComputeArrow: TButton
        Left = 322
        Top = 65
        Width = 155
        Height = 25
        Caption = 'F = R{1-'#8730'[1-C'#178'/(4R'#178')]}'
        TabOrder = 4
        OnClick = btComputeArrowClick
      end
      object btComputeCord: TButton
        Left = 322
        Top = 38
        Width = 155
        Height = 25
        Caption = 'C = '#8730'[4F(2R-F)]'
        TabOrder = 5
        OnClick = btComputeCordClick
      end
    end
  end
end
