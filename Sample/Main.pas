unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, YogaLayout, FMX.Objects, Neslib.Yoga;

type
  TMainForm = class(TForm)
    Rect: TRectangle;
    YogaLayout1: TYogaLayout;
    YogaLayout2: TYogaLayout;
    YogaLayout3: TYogaLayout;
    Rectangle1: TRectangle;
    YogaLayout4: TYogaLayout;
    Rectangle2: TRectangle;
    YogaLayout5: TYogaLayout;
    Rectangle3: TRectangle;
    YogaLayout6: TYogaLayout;
    Rectangle4: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

end.
