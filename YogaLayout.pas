unit YogaLayout;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.UITypes,
  FMX.Types, FMX.Controls, FMX.Graphics,
  Neslib.Yoga;

type

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TYogaLayout = class(TControl)
  private
    FNode: TYogaNode;
    function GetNodeAlignContent: TYogaAlign;
    function GetNodeAlignItems: TYogaAlign;
    function GetNodeAlignSelf: TYogaAlign;
    function GetNodeAspectRatio: String;
    function GetNodeBottom: String;
    function GetNodeDirection: TYogaDirection;
    function GetNodeFlexBasis: String;
    function GetNodeFlexDirection: TYogaFlexDirection;
    function GetNodeFlexGrow: Single;
    function GetNodeFlexShrink: Single;
    function GetNodeFlexWrap: TYogaWrap;
    function GetNodeHeight: String;
    function GetNodeJustifyContent: TYogaJustify;
    function GetNodeLeft: String;
    function GetNodeMarginBottom: String;
    function GetNodeMarginLeft: String;
    function GetNodeMarginRight: String;
    function GetNodeMarginTop: String;
    function GetNodeMaxHeight: String;
    function GetNodeMaxWidth: String;
    function GetNodeMinHeight: String;
    function GetNodeMinWidth: String;
    function GetNodePaddingBottom: String;
    function GetNodePaddingLeft: String;
    function GetNodePaddingRight: String;
    function GetNodePaddingTop: String;
    function GetNodePositionType: TYogaPositionType;
    function GetNodeRight: String;
    function GetNodeTop: String;
    function GetNodeWidth: String;
    procedure SetNodeAlignContent(const Value: TYogaAlign);
    procedure SetNodeAlignItems(const Value: TYogaAlign);
    procedure SetNodeAlignSelf(const Value: TYogaAlign);
    procedure SetNodeAspectRatio(const Value: String);
    procedure SetNodeBottom(const Value: String);
    procedure SetNodeDirection(const Value: TYogaDirection);
    procedure SetNodeFlexBasis(const Value: String);
    procedure SetNodeFlexDirection(const Value: TYogaFlexDirection);
    procedure SetNodeFlexGrow(const Value: Single);
    procedure SetNodeFlexShrink(const Value: Single);
    procedure SetNodeFlexWrap(const Value: TYogaWrap);
    procedure SetNodeHeight(const Value: String);
    procedure SetNodeJustifyContent(const Value: TYogaJustify);
    procedure SetNodeLeft(const Value: String);
    procedure SetNodeMarginBottom(const Value: String);
    procedure SetNodeMarginLeft(const Value: String);
    procedure SetNodeMarginRight(const Value: String);
    procedure SetNodeMarginTop(const Value: String);
    procedure SetNodeMaxHeight(const Value: String);
    procedure SetNodeMaxWidth(const Value: String);
    procedure SetNodeMinHeight(const Value: String);
    procedure SetNodeMinWidth(const Value: String);
    procedure SetNodePaddingBottom(const Value: String);
    procedure SetNodePaddingLeft(const Value: String);
    procedure SetNodePaddingRight(const Value: String);
    procedure SetNodePaddingTop(const Value: String);
    procedure SetNodePositionType(const Value: TYogaPositionType);
    procedure SetNodeRight(const Value: String);
    procedure SetNodeTop(const Value: String);
    procedure SetNodeWidth(const Value: String);
  protected
    procedure Paint; override;
    procedure DoRealign; override;
    procedure DoAddObject(const AObject: TFmxObject); override;
    procedure DoRemoveObject(const AObject: TFmxObject); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ApplyLayout;
  published
    property Align;
    property Anchors;
    property ClipChildren;
    property ClipParent;
    property Cursor;
    property DragMode;
    property EnableDragHighlight;
    property Enabled;
    property Locked;
    property Height;
    property Hint;
    property HitTest default False;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;
    property TabOrder;
    property TabStop;
    { Events }
    property OnPainting;
    property OnPaint;
    property OnResize;
    property OnResized;
    { Drag and Drop events }
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    { Mouse events }
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;
    //
    property Node: TYogaNode read FNode;
    property NodeWidth: String read GetNodeWidth write SetNodeWidth;
    property NodeHeight: String read GetNodeHeight write SetNodeHeight;
    property NodeMaxWidth: String read GetNodeMaxWidth write SetNodeMaxWidth;
    property NodeMaxHeight: String read GetNodeMaxHeight write SetNodeMaxHeight;
    property NodeMinWidth: String read GetNodeMinWidth write SetNodeMinWidth;
    property NodeMinHeight: String read GetNodeMinHeight write SetNodeMinHeight;
    property NodeAspectRatio: String read GetNodeAspectRatio write SetNodeAspectRatio;
    property NodePaddingLeft: String read GetNodePaddingLeft write SetNodePaddingLeft;
    property NodePaddingTop: String read GetNodePaddingTop write SetNodePaddingTop;
    property NodePaddingRight: String read GetNodePaddingRight write SetNodePaddingRight;
    property NodePaddingBottom: String read GetNodePaddingBottom write SetNodePaddingBottom;
    property NodeFlexBasis: String read GetNodeFlexBasis write SetNodeFlexBasis;
    property NodeFlexGrow: Single read GetNodeFlexGrow write SetNodeFlexGrow;
    property NodeFlexShrink: Single read GetNodeFlexShrink write SetNodeFlexShrink;
    property NodeMarginLeft: String read GetNodeMarginLeft write SetNodeMarginLeft;
    property NodeMarginTop: String read GetNodeMarginTop write SetNodeMarginTop;
    property NodeMarginRight: String read GetNodeMarginRight write SetNodeMarginRight;
    property NodeMarginBottom: String read GetNodeMarginBottom write SetNodeMarginBottom;
    property NodeLeft: String read GetNodeLeft write SetNodeLeft;
    property NodeTop: String read GetNodeTop write SetNodeTop;
    property NodeRight: String read GetNodeRight write SetNodeRight;
    property NodeBottom: String read GetNodeBottom write SetNodeBottom;
    property NodeDirection: TYogaDirection read GetNodeDirection write SetNodeDirection;
    property NodeFlexWrap: TYogaWrap read GetNodeFlexWrap write SetNodeFlexWrap;
    property NodePositionType: TYogaPositionType read GetNodePositionType write SetNodePositionType;
    property NodeJustifyContent: TYogaJustify read GetNodeJustifyContent write SetNodeJustifyContent;
    property NodeAlignItems: TYogaAlign read GetNodeAlignItems write SetNodeAlignItems;
    property NodeAlignContent: TYogaAlign read GetNodeAlignContent write SetNodeAlignContent;
    property NodeFlexDirection: TYogaFlexDirection read GetNodeFlexDirection write SetNodeFlexDirection;
    property NodeAlignSelf: TYogaAlign read GetNodeAlignSelf write SetNodeAlignSelf;
  end;

function GetValueStr(Value: TYogaValue): String; overload;
function GetValueStr(Value: Single): String; overload;
function SetYogaValue(Value: String): TYogaValue;
function SetSingleValue(Value: String): Single;

implementation

procedure TYogaLayout.ApplyLayout;
begin
  if Align = TAlignLayout.None then
    SetBounds(FNode.LayoutLeft, FNode.LayoutTop, FNode.LayoutWidth, FNode.LayoutHeight);
  for var I := 0 to Controls.Count - 1 do
  begin
    var
    C := Controls[I];
    if C is TYogaLayout then
      TYogaLayout(C).ApplyLayout;
  end;
end;

constructor TYogaLayout.Create(AOwner: TComponent);
begin
  inherited;
  CanParentFocus := True;
  HitTest := False;
  FNode := TYogaNode.Create;
  FNode.BindLayout := TControl(Self);
end;

destructor TYogaLayout.Destroy;
begin
  FNode.BindLayout := nil;
  if FNode.Parent <> nil then
    FNode.Parent.Remove(FNode);
  inherited;
end;

procedure TYogaLayout.DoAddObject(const AObject: TFmxObject);
begin
  inherited;
  if AObject is TYogaLayout then
    FNode.Add(TYogaLayout(AObject).Node);
  Realign;
end;

procedure TYogaLayout.DoRealign;
begin
  if FNode.Parent = nil then
  begin
    FNode.CalculateLayout;
    for var I := 0 to Controls.Count - 1 do
    begin
      var
      C := Controls[I];
      if C is TYogaLayout then
        TYogaLayout(C).ApplyLayout;
    end;
  end;
  inherited;
end;

procedure TYogaLayout.DoRemoveObject(const AObject: TFmxObject);
begin
  if AObject is TYogaLayout then
  begin
    var
    Index := FNode.IndexOf(TYogaLayout(AObject).Node);
    if (Index >= 0) then
      FNode.Delete(Index, False);
  end;
  inherited;
  Realign;
end;

function TYogaLayout.GetNodeAlignContent: TYogaAlign;
begin
  Result := FNode.AlignContent;
end;

function TYogaLayout.GetNodeAlignItems: TYogaAlign;
begin
  Result := FNode.AlignItems;
end;

function TYogaLayout.GetNodeAlignSelf: TYogaAlign;
begin
  Result := FNode.AlignSelf;
end;

function TYogaLayout.GetNodeAspectRatio: String;
begin
  Result := GetValueStr(FNode.AspectRatio);
end;

function TYogaLayout.GetNodeBottom: String;
begin
  Result := GetValueStr(FNode.Bottom);
end;

function TYogaLayout.GetNodeDirection: TYogaDirection;
begin
  Result := FNode.Direction;
end;

function TYogaLayout.GetNodeFlexBasis: String;
begin
  Result := GetValueStr(FNode.FlexBasis);
end;

function TYogaLayout.GetNodeFlexDirection: TYogaFlexDirection;
begin
  Result := FNode.FlexDirection;
end;

function TYogaLayout.GetNodeFlexGrow: Single;
begin
  Result := FNode.FlexGrow;
end;

function TYogaLayout.GetNodeFlexShrink: Single;
begin
  Result := FNode.FlexShrink;
end;

function TYogaLayout.GetNodeFlexWrap: TYogaWrap;
begin
  Result := FNode.FlexWrap;
end;

function TYogaLayout.GetNodeHeight: String;
begin
  Result := GetValueStr(FNode.Height);
end;

function TYogaLayout.GetNodeJustifyContent: TYogaJustify;
begin
  Result := FNode.JustifyContent;
end;

function TYogaLayout.GetNodeLeft: String;
begin
  Result := GetValueStr(FNode.Left);
end;

function TYogaLayout.GetNodeMarginBottom: String;
begin
  Result := GetValueStr(FNode.MarginBottom);
end;

function TYogaLayout.GetNodeMarginLeft: String;
begin
  Result := GetValueStr(FNode.MarginLeft);
end;

function TYogaLayout.GetNodeMarginRight: String;
begin
  Result := GetValueStr(FNode.MarginRight);
end;

function TYogaLayout.GetNodeMarginTop: String;
begin
  Result := GetValueStr(FNode.MarginTop);
end;

function TYogaLayout.GetNodeMaxHeight: String;
begin
  Result := GetValueStr(FNode.MaxHeight);
end;

function TYogaLayout.GetNodeMaxWidth: String;
begin
  Result := GetValueStr(FNode.MaxWidth);
end;

function TYogaLayout.GetNodeMinHeight: String;
begin
  Result := GetValueStr(FNode.MinHeight);
end;

function TYogaLayout.GetNodeMinWidth: String;
begin
  Result := GetValueStr(FNode.MinWidth);
end;

function TYogaLayout.GetNodePaddingBottom: String;
begin
  Result := GetValueStr(FNode.PaddingBottom);
end;

function TYogaLayout.GetNodePaddingLeft: String;
begin
  Result := GetValueStr(FNode.PaddingLeft);
end;

function TYogaLayout.GetNodePaddingRight: String;
begin
  Result := GetValueStr(FNode.PaddingRight);
end;

function TYogaLayout.GetNodePaddingTop: String;
begin
  Result := GetValueStr(FNode.PaddingTop);
end;

function TYogaLayout.GetNodePositionType: TYogaPositionType;
begin
  Result := FNode.PositionType;
end;

function TYogaLayout.GetNodeRight: String;
begin
  Result := GetValueStr(FNode.Right);
end;

function TYogaLayout.GetNodeTop: String;
begin
  Result := GetValueStr(FNode.Top);
end;

function TYogaLayout.GetNodeWidth: String;
begin
  Result := GetValueStr(FNode.Width);
end;

procedure TYogaLayout.Paint;
begin
  inherited;
  if (csDesigning in ComponentState) and not Locked then
    DrawDesignBorder;
end;

procedure TYogaLayout.SetNodeAlignContent(const Value: TYogaAlign);
begin
  FNode.AlignContent := Value;
end;

procedure TYogaLayout.SetNodeAlignItems(const Value: TYogaAlign);
begin
  FNode.AlignItems := Value;
end;

procedure TYogaLayout.SetNodeAlignSelf(const Value: TYogaAlign);
begin
  FNode.AlignSelf := Value;
end;

procedure TYogaLayout.SetNodeAspectRatio(const Value: String);
begin
  FNode.AspectRatio := SetSingleValue(Value);
end;

procedure TYogaLayout.SetNodeBottom(const Value: String);
begin
  FNode.Bottom := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeDirection(const Value: TYogaDirection);
begin
  FNode.Direction := Value;
end;

procedure TYogaLayout.SetNodeFlexBasis(const Value: String);
begin
  FNode.FlexBasis := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeFlexDirection(const Value: TYogaFlexDirection);
begin
  FNode.FlexDirection := Value;
end;

procedure TYogaLayout.SetNodeFlexGrow(const Value: Single);
begin
  FNode.FlexGrow := Value;
end;

procedure TYogaLayout.SetNodeFlexShrink(const Value: Single);
begin
  FNode.FlexShrink := Value;
end;

procedure TYogaLayout.SetNodeFlexWrap(const Value: TYogaWrap);
begin
  FNode.FlexWrap := Value;
end;

procedure TYogaLayout.SetNodeHeight(const Value: String);
begin
  FNode.Height := SetYogaValue(Value);
  if Align = TAlignLayout.None then
    if FNode.Height.Units = TYogaUnit.Point then
      Height := FNode.Height.Value;
end;

procedure TYogaLayout.SetNodeJustifyContent(const Value: TYogaJustify);
begin
  FNode.JustifyContent := Value;
end;

procedure TYogaLayout.SetNodeLeft(const Value: String);
begin
  FNode.Left := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeMarginBottom(const Value: String);
begin
  FNode.MarginBottom := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeMarginLeft(const Value: String);
begin
  FNode.MarginLeft := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeMarginRight(const Value: String);
begin
  FNode.MarginRight := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeMarginTop(const Value: String);
begin
  FNode.MarginTop := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeMaxHeight(const Value: String);
begin
  FNode.MaxHeight := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeMaxWidth(const Value: String);
begin
  FNode.MaxWidth := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeMinHeight(const Value: String);
begin
  FNode.MinHeight := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeMinWidth(const Value: String);
begin
  FNode.MinWidth := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodePaddingBottom(const Value: String);
begin
  FNode.PaddingBottom := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodePaddingLeft(const Value: String);
begin
  FNode.PaddingLeft := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodePaddingRight(const Value: String);
begin
  FNode.PaddingRight := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodePaddingTop(const Value: String);
begin
  FNode.PaddingTop := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodePositionType(const Value: TYogaPositionType);
begin
  FNode.PositionType := Value;
end;

procedure TYogaLayout.SetNodeRight(const Value: String);
begin
  FNode.Right := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeTop(const Value: String);
begin
  FNode.Top := SetYogaValue(Value);
end;

procedure TYogaLayout.SetNodeWidth(const Value: String);
begin
  FNode.Width := SetYogaValue(Value);
  if Align = TAlignLayout.None then
    if FNode.Width.Units = TYogaUnit.Point then
      Width := FNode.Width.Value;
end;

function GetValueStr(Value: Single): String;
begin
  if YogaIsUndefined(Value) then
  begin
    Result := '';
  end
  else
  begin
    FloatToStr(Value);
  end;
end;

function GetValueStr(Value: TYogaValue): String;
begin
  case Value.Units of
    TYogaUnit.Undefined:
      Result := '';
    TYogaUnit.Auto:
      Result := '%';
    TYogaUnit.Point:
      Result := FloatToStr(Value.Value);
    TYogaUnit.Percent:
      Result := FloatToStr(Value.Value) + '%';
  end;
end;

function SetSingleValue(Value: String): Single;
var
  FloatValue: Single;
begin
  Result := YOGA_UNDEFINED;
  if Value <> '' then
    if TryStrToFloat(Value, FloatValue) then
      Result := FloatValue;
end;

function SetYogaValue(Value: String): TYogaValue;
var
  FloatValue: Single;
begin
  Result.SetUndefined;
  if Value.EndsWith('%') then
  begin
    SetLength(Value, Value.Length - 1);
    if Value <> '' then
    begin
      if TryStrToFloat(Value, FloatValue) then
        Result.SetPercent(FloatValue);
    end
    else
    begin
      Result.SetAuto;
    end;
  end
  else
  begin
    if Value <> '' then
      if TryStrToFloat(Value, FloatValue) then
        Result.SetPoint(FloatValue);
  end;
end;

initialization

RegisterFMXClasses([TYogaLayout]);

end.
