page 50003 "VAT Imported Documnent List"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'VAT Imported Documnent List';
    CardPageID = "VAT Imported Document";
    Editable = false;
    PageType = List;
    SourceTable = "VAT Imported Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Validated By"; Rec."Validated By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Validated By field.';
                }
                field("Validated Date"; Rec."Validated Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Validated Date field.';
                }
                field("Validated Time"; Rec."Validated Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Validated Time field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

