pageextension 50001 ItemExt extends "Item Card"
{
    layout
    {
        addafter("Item Category Code")
        {
            field("Not synchronize to SF"; rec."Not synchronize to SF")

            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Not synchronize to SF field.';
            }
            field("Print Item Description 2"; rec."Print Item Description 2")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Print Item Description 2 field.';
            }
        }
    }
}
