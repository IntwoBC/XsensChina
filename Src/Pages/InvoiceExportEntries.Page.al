page 50006 "Invoice Export Entries"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Invoice Export Entries';
    Editable = false;
    PageType = List;
    SourceTable = "Invoice Export Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Handled No."; Rec."Handled No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Handled No. field.';
                }
                field("Handled by"; Rec."Handled by")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Handled by field.';
                }
                field("Handled Date"; Rec."Handled Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Handled Date field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(Handled; Rec.Handled)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Handled field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Line No. field.';
                }
                field("Ref. Line No."; Rec."Ref. Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ref. Line No. field.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Type field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Factor field.';
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoiced Quantity field.';
                }
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT % field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Including VAT field.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount (LCY) field.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order No. field.';
                }
                field(DescriptionCHN; Rec.DescriptionCHN)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DescriptionCHN field.';
                }
                field(Splited; Rec.Splited)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Splited field.';
                }
                field(Exported; Rec.Exported)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exported field.';
                }
                field("Exported by"; Rec."Exported by")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exported by field.';
                }
                field("Exported Date"; Rec."Exported Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exported Date field.';
                }
                field("Exported Number"; Rec."Exported Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exported Number field.';
                }
                field("Credit Memo Applied"; Rec."Credit Memo Applied")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Credit Memo Applied field.';
                }
                field("Applied Amount"; Rec."Applied Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Applied Amount field.';
                }
                field("Expansion Status"; Rec."Expansion Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expansion Status field.';
                }
                field("Parent Entry No."; Rec."Parent Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Parent Entry No. field.';
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Level field.';
                }
                field("Hide Line"; Rec."Hide Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Hide Line field.';
                }
                field("Actual Entry No."; Rec."Actual Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actual Entry No. field.';
                }
                field("Sorting Level"; Rec."Sorting Level")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sorting Level field.';
                }
                field("Invoice Type"; Rec."Invoice Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Type field.';
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
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Registration No. field.';
                }
                field("VAT Address & Telephone"; Rec."VAT Address & Telephone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Address && Telephone field.';
                }
                field("Bank Name & Account"; Rec."Bank Name & Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Name & Account field.';
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remark field.';
                }
                field("Invoice User"; Rec."Invoice User")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice User field.';
                }
                field("Check User"; Rec."Check User")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Check User field.';
                }
                field(Receipt; Rec.Receipt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt field.';
                }
                field("Bank Account"; Rec."Bank Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account field.';
                }
                field("Address&Telephone"; Rec."Address&Telephone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address&&Telephone field.';
                }
                field("Invoice Mail Address"; Rec."Invoice Mail Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Mail Address field.';
                }
                field("Contact Information"; Rec."Contact Information")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact Information field.';
                }
            }
        }
    }

    actions
    {
    }
}

