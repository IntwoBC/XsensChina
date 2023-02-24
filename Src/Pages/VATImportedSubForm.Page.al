page 50002 "VAT Imported SubForm"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "VAT Imported Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Posted Invoice No."; Rec."Posted Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Invoice No. field.';
                }
                field("Invoice Amount"; Rec."Invoice Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Amount field.';
                }
                field("VAT Invoice No."; Rec."VAT Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Invoice No. field.';
                }
                field("Validated Posted Invoice No."; Rec."Validated Posted Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Validated Posted Invoice No. field.';
                }
                field("Validated Customer No."; Rec."Validated Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Validated Customer No. field.';
                }
                field("Validated VAT Invoice No."; Rec."Validated VAT Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Validated VAT Invoice No. field.';
                }
                field("Posted Invoice Amount"; Rec."Posted Invoice Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Invoice Amount field.';
                }
                field("Posted Invoice Amount Incl VAT"; Rec."Posted Invoice Amount Incl VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Invoice Amount Incl VAT field.';
                }
                field("Line Status"; Rec."Line Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

