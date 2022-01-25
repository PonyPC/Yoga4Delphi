unit YogaLayoutRegister;

interface

procedure Register;

implementation

uses
  System.UITypes,
  System.SysUtils,
  System.Classes,
  FMX.Forms,
  DesignEditors,
  DesignIntf,

  Neslib.Yoga,
  Yoga.Designtime.Editor,
  YogaLayout;

type
  TYogaNodePropertyEditor = class(TClassProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
    class function TryEdit(ASource: TYogaNode): Boolean; static;
  end;

  TYogaLayoutComponentEditor = class(TDefaultEditor)
  public
    procedure Edit; override;
  end;

procedure TYogaNodePropertyEditor.Edit;
begin
  var
  EditorForm := TYogaLayoutEditorForm.Create(nil);
  try
    EditorForm.Node := TYogaNode(Pointer(GetOrdValue));
    EditorForm.ShowModal;
  finally
    EditorForm.Free;
  end;
end;

function TYogaNodePropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

function TYogaNodePropertyEditor.GetValue: string;
begin
  Result := '(TYogaNode)';
end;

class function TYogaNodePropertyEditor.TryEdit(ASource: TYogaNode): Boolean;
begin
  var
  EditorForm := TYogaLayoutEditorForm.Create(nil);
  try
    EditorForm.Node := ASource;
    EditorForm.ShowModal;
  finally
    EditorForm.Free;
  end;
end;

{ TYogaLayoutComponentEditor }

procedure TYogaLayoutComponentEditor.Edit;
begin
  TYogaNodePropertyEditor.TryEdit(TYogaLayout(Component).Node);
end;

procedure Register;
begin
  RegisterComponents('Layouts', [TYogaLayout]);
  RegisterPropertyEditor(TypeInfo(TYogaNode), nil, '', TYogaNodePropertyEditor);
  RegisterComponentEditor(TYogaLayout, TYogaLayoutComponentEditor);
end;

end.
