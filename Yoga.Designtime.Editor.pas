unit Yoga.Designtime.Editor;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.TabControl,
  FMX.Edit,
  FMX.ListBox,
  Neslib.Yoga,
  YogaLayout;

type
  TYogaLayoutEditorForm = class(TForm)
    TabControl: TTabControl;
    TabItemFlex: TTabItem;
    GridPanelLayoutFlex: TGridPanelLayout;
    LabelDirection: TLabel;
    SpeedButtonInherit: TSpeedButton;
    SpeedButtonLtr: TSpeedButton;
    SpeedButtonRtl: TSpeedButton;
    LabelFlexDirection: TLabel;
    ComboBoxFlexDirection: TComboBox;
    LabelBasis: TLabel;
    LabelGrow: TLabel;
    LabelShrink: TLabel;
    EditBasis: TEdit;
    EditGrow: TEdit;
    EditShrink: TEdit;
    LabelFlexWrap: TLabel;
    SpeedButtonNoWrap: TSpeedButton;
    SpeedButtonWrap: TSpeedButton;
    SpeedButtonWrapReverse: TSpeedButton;
    TabItemAlignment: TTabItem;
    GridPanelLayoutAlignment: TGridPanelLayout;
    LabelJustifyContent: TLabel;
    LabelAlignItems: TLabel;
    ComboBoxAlignItems: TComboBox;
    LabelAlignSelf: TLabel;
    LabelAlignContent: TLabel;
    VertScrollBoxFlex: TVertScrollBox;
    VertScrollBoxAlignment: TVertScrollBox;
    ComboBoxJustifyContent: TComboBox;
    ComboBoxAlignSelf: TComboBox;
    ComboBoxAlignContent: TComboBox;
    TabItemLayout: TTabItem;
    VertScrollBoxLayout: TVertScrollBox;
    GridPanelLayoutLayout: TGridPanelLayout;
    LabelWidthHeight: TLabel;
    LabelMaxWidthHeight: TLabel;
    LabelMinWidthHeight: TLabel;
    LabelAspectRatio: TLabel;
    EditWidth: TEdit;
    EditHeight: TEdit;
    EditMaxWidth: TEdit;
    EditMaxHeight: TEdit;
    EditMinWidth: TEdit;
    EditMinHeight: TEdit;
    EditAspectRatio: TEdit;
    GridPanelLayoutPadding: TGridPanelLayout;
    EditPaddingTop: TEdit;
    LabelPadding: TLabel;
    EditPaddingRight: TEdit;
    EditPaddingBottom: TEdit;
    EditPaddingLeft: TEdit;
    GridPanelLayoutMargin: TGridPanelLayout;
    EditMarginTop: TEdit;
    LabelMargin: TLabel;
    EditMarginRight: TEdit;
    EditMarginBottom: TEdit;
    EditMarginLeft: TEdit;
    GridPanelLayoutPositionType: TGridPanelLayout;
    LabelPositionType: TLabel;
    SpeedButtonRelative: TSpeedButton;
    SpeedButtonAbsoute: TSpeedButton;
    GridPanelLayoutPosition: TGridPanelLayout;
    EditPositionTop: TEdit;
    LabelPosition: TLabel;
    EditPositionRight: TEdit;
    EditPositionBottom: TEdit;
    EditPositionLeft: TEdit;
    LayoutProperties: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure ControlChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FShowingProperties: Boolean;
    FNode: TYogaNode;
    procedure SetNode(Node: TYogaNode);
  public
    { Public declarations }
    property Node: TYogaNode read FNode write SetNode;
  end;

var
  YogaLayoutEditorForm: TYogaLayoutEditorForm;

implementation

{$R *.fmx}

procedure TYogaLayoutEditorForm.ControlChange(Sender: TObject);
var
  OrdValue: Cardinal;
  Prop, Text: String;
begin
  if FShowingProperties then
    Exit;

  var
  YogaLayout := FNode.BindLayout;
  var
  isYogaParent := YogaLayout.Parent is TYogaLayout;
  if (Sender is TEdit) then
  begin
    Prop := TEdit(Sender).StyleName;
    Text := TEdit(Sender).Text.Trim;
    if Prop = 'Width' then
    begin
      FNode.Width := SetYogaValue(Text);
      if YogaLayout.Align = TAlignLayout.None then
        if FNode.Width.Units = TYogaUnit.Point then
          YogaLayout.Width := FNode.Width.Value;
    end
    else if Prop = 'Height' then
    begin
      FNode.Height := SetYogaValue(Text);
      if YogaLayout.Align = TAlignLayout.None then
        if FNode.Height.Units = TYogaUnit.Point then
          YogaLayout.Height := FNode.Height.Value;
    end
    else if Prop = 'MaxWidth' then
      FNode.MaxWidth := SetYogaValue(Text)
    else if Prop = 'MaxHeight' then
      FNode.MaxHeight := SetYogaValue(Text)
    else if Prop = 'MinWidth' then
      FNode.MinWidth := SetYogaValue(Text)
    else if Prop = 'MinHeight' then
      FNode.MinHeight := SetYogaValue(Text)
    else if Prop = 'AspectRatio' then
      FNode.AspectRatio := SetSingleValue(Text)
    else if Prop = 'PaddingLeft' then
      FNode.PaddingLeft := SetYogaValue(Text)
    else if Prop = 'PaddingTop' then
      FNode.PaddingTop := SetYogaValue(Text)
    else if Prop = 'PaddingRight' then
      FNode.PaddingRight := SetYogaValue(Text)
    else if Prop = 'PaddingBottom' then
      FNode.PaddingBottom := SetYogaValue(Text)
    else if isYogaParent then
    begin
      if Prop = 'FlexBasis' then
        FNode.FlexBasis := SetYogaValue(Text)
      else if Prop = 'FlexGrow' then
        FNode.FlexGrow := SetSingleValue(Text)
      else if Prop = 'FlexShrink' then
        FNode.FlexShrink := SetSingleValue(Text)
      else if Prop = 'MarginLeft' then
        FNode.MarginLeft := SetYogaValue(Text)
      else if Prop = 'MarginTop' then
        FNode.MarginTop := SetYogaValue(Text)
      else if Prop = 'MarginRight' then
        FNode.MarginRight := SetYogaValue(Text)
      else if Prop = 'MarginBottom' then
        FNode.MarginBottom := SetYogaValue(Text)
      else if Prop = 'Left' then
        FNode.Left := SetYogaValue(Text)
      else if Prop = 'Top' then
        FNode.Top := SetYogaValue(Text)
      else if Prop = 'Right' then
        FNode.Right := SetYogaValue(Text)
      else if Prop = 'Bottom' then
        FNode.Bottom := SetYogaValue(Text);
    end;
  end
  else if (Sender is TSpeedButton) then
  begin
    Prop := TSpeedButton(Sender).StyleName;
    OrdValue := TSpeedButton(Sender).Tag;
    if Prop = 'Direction' then
      FNode.Direction := TYogaDirection(OrdValue)
    else if Prop = 'FlexWrap' then
      FNode.FlexWrap := TYogaWrap(OrdValue)
    else if isYogaParent then
    begin
      if Prop = 'PositionType' then
        FNode.PositionType := TYogaPositionType(OrdValue);
    end;
  end
  else if (Sender is TComboBox) then
  begin
    Prop := TComboBox(Sender).StyleName;
    OrdValue := TComboBox(Sender).ItemIndex;
    if Prop = 'JustifyContent' then
      FNode.JustifyContent := TYogaJustify(OrdValue)
    else if Prop = 'AlignItems' then
      FNode.AlignItems := TYogaAlign(OrdValue)
    else if Prop = 'AlignContent' then
      FNode.AlignContent := TYogaAlign(OrdValue)
    else if Prop = 'FlexDirection' then
      FNode.FlexDirection := TYogaFlexDirection(OrdValue)
    else if isYogaParent then
    begin
      if Prop = 'AlignSelf' then
        FNode.AlignSelf := TYogaAlign(OrdValue);
    end;
  end;

  if isYogaParent then
  begin
    var
    ParentLayout := TYogaLayout(YogaLayout.Parent);
    ParentLayout.Node.CalculateLayout;
    for var I := 0 to ParentLayout.Controls.Count - 1 do
    begin
      var
      C := ParentLayout.Controls[I];
      if C is TYogaLayout then
        TYogaLayout(C).ApplyLayout;
    end;
  end
  else
  begin
    var
    BindLayout := TYogaLayout(YogaLayout);
    BindLayout.Node.CalculateLayout;
    for var I := 0 to BindLayout.Controls.Count - 1 do
    begin
      var
      C := BindLayout.Controls[I];
      if C is TYogaLayout then
        TYogaLayout(C).ApplyLayout;
    end;
  end;
end;

procedure TYogaLayoutEditorForm.FormCreate(Sender: TObject);
begin
  TabControl.TabIndex := 0;
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TYogaLayoutEditorForm.FormDestroy(Sender: TObject);
begin
  FNode := nil;
end;

procedure TYogaLayoutEditorForm.SetNode(Node: TYogaNode);
begin
  FShowingProperties := True;
  FNode := Node;
  if FNode <> nil then
  begin
    EditWidth.Text := GetValueStr(FNode.Width);
    EditHeight.Text := GetValueStr(FNode.Height);
    EditMaxWidth.Text := GetValueStr(FNode.MaxWidth);
    EditMaxHeight.Text := GetValueStr(FNode.MaxHeight);
    EditMinWidth.Text := GetValueStr(FNode.MinWidth);
    EditMinHeight.Text := GetValueStr(FNode.MinHeight);
    EditAspectRatio.Text := GetValueStr(FNode.AspectRatio);
    EditPaddingLeft.Text := GetValueStr(FNode.PaddingLeft);
    EditPaddingTop.Text := GetValueStr(FNode.PaddingTop);
    EditPaddingRight.Text := GetValueStr(FNode.PaddingRight);
    EditPaddingBottom.Text := GetValueStr(FNode.PaddingBottom);
    ComboBoxJustifyContent.ItemIndex := Ord(FNode.JustifyContent);
    ComboBoxAlignItems.ItemIndex := Ord(FNode.AlignItems);
    ComboBoxAlignContent.ItemIndex := Ord(FNode.AlignContent);
    case FNode.Direction of
      TYogaDirection.Inherit:
        SpeedButtonInherit.IsPressed := True;
      TYogaDirection.LTR:
        SpeedButtonLtr.IsPressed := True;
      TYogaDirection.RTL:
        SpeedButtonRtl.IsPressed := True;
    end;
    ComboBoxFlexDirection.ItemIndex := Ord(FNode.FlexDirection);
    case FNode.FlexWrap of
      TYogaWrap.No:
        SpeedButtonNoWrap.IsPressed := True;
      TYogaWrap.Wrap:
        SpeedButtonWrap.IsPressed := True;
      TYogaWrap.WrapReverse:
        SpeedButtonWrapReverse.IsPressed := True;
    end;
    //
    if not(FNode.BindLayout.Parent is TYogaLayout) then
    begin
      EditBasis.Enabled := False;
      EditGrow.Enabled := False;
      EditShrink.Enabled := False;
      ComboBoxAlignSelf.Enabled := False;
      EditMarginLeft.Enabled := False;
      EditMarginTop.Enabled := False;
      EditMarginRight.Enabled := False;
      EditMarginBottom.Enabled := False;
      SpeedButtonRelative.Enabled := False;
      SpeedButtonAbsoute.Enabled := False;
      EditPositionLeft.Enabled := False;
      EditPositionTop.Enabled := False;
      EditPositionRight.Enabled := False;
      EditPositionBottom.Enabled := False;
    end
    else
    begin
      EditBasis.Text := GetValueStr(FNode.FlexBasis);
      EditGrow.Text := GetValueStr(FNode.FlexGrow);
      EditShrink.Text := GetValueStr(FNode.FlexShrink);
      ComboBoxAlignSelf.ItemIndex := Ord(FNode.AlignSelf);
      EditMarginLeft.Text := GetValueStr(FNode.MarginLeft);
      EditMarginTop.Text := GetValueStr(FNode.MarginTop);
      EditMarginRight.Text := GetValueStr(FNode.MarginRight);
      EditMarginBottom.Text := GetValueStr(FNode.MarginBottom);
      case FNode.PositionType of
        TYogaPositionType.Relative:
          SpeedButtonRelative.IsPressed := True;
        TYogaPositionType.Absolute:
          SpeedButtonAbsoute.IsPressed := True;
      end;
      EditPositionLeft.Text := GetValueStr(FNode.Left);
      EditPositionTop.Text := GetValueStr(FNode.Top);
      EditPositionRight.Text := GetValueStr(FNode.Right);
      EditPositionBottom.Text := GetValueStr(FNode.Bottom);
    end;
  end;
  FShowingProperties := False;
end;

end.
