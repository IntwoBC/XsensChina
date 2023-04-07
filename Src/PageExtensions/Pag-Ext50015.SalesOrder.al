pageextension 50015 SalesOrder extends "Sales Order"
{
    layout
    {
        addlast(General)
        {

            field(ExternalID; Rec.ExternalID)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the ExternalID field.';
            }
            field("Comment 2"; Rec."Comment 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Comment 2 field.';
            }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            }
            field("Application area"; Rec."Application area")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Application area field.';
            }
            field("Sell-to Customer Name 3"; Rec."Sell-to Customer Name 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to Customer Name 3 field.';
            }
            // field("Currency Code IT"; Rec."Currency Code IT")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Currency Code IT field.';
            // }
            // field("Payment Method Code IT"; Rec."Payment Method Code IT")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Payment Method Code IT field.';
            // }
            // field("Payment Terms Code IT"; Rec."Payment Terms Code IT")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Payment Terms Code IT field.';
            // }
            // field("Salesperson Code IT"; Rec."Salesperson Code IT")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Salesperson Code IT field.';
            // }
            // field("Shipment Date IT"; Rec."Shipment Date IT")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Shipment Date IT field.';
            // }
            // field("Rapidi Fields Updated"; Rec."Rapidi Fields Updated")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Rapidi Fields Updated field.';
            // }
            // field("Created By Rapidi"; Rec."Created By Rapidi")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Created By Rapidi field.';
            // }
            field("VAT Country/Region Code"; Rec."VAT Country/Region Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the VAT Country/Region Code field.';
            }
            field("Sell-to Contact E-mail"; Rec."Sell-to Contact E-mail")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to Contact E-mail field.';
            }
            field("Sell-to Contact Phone"; Rec."Sell-to Contact Phone")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to Contact Phone field.';
            }
            field("Sell-to IC City"; Rec."Sell-to IC City")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to IC City field.';
            }
            field("Sell-to IC Name"; Rec."Sell-to IC Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to IC Name field.';
            }
            field("Sell-to IC Name 2"; Rec."Sell-to IC Name 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to IC Name 2 field.';
            }
            field("Sell-to IC Address"; Rec."Sell-to IC Address")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to IC Address field.';
            }
            field("Sell-to IC Contact"; Rec."Sell-to IC Contact")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to IC Contact field.';
            }
            field("Sell-to IC Address 2"; Rec."Sell-to IC Address 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to IC Address 2 field.';
            }
            field("Sell-to IC Post Code"; Rec."Sell-to IC Post Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to IC Post Code field.';
            }
            field("Sell-to IC Customer No."; Rec."Sell-to IC Customer No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to IC Customer No. field.';
            }
            field("Sell-to IC Partner Code"; Rec."Sell-to IC Partner Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sell-to IC Partner Code field.';
            }
            field("IC Payment Terms"; Rec."IC Payment Terms")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the IC Payment Terms field.';
            }
            field("IC Sales Order No."; Rec."IC Sales Order No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the IC Sales Order No. field.';
            }
        }
    }
    trigger OnOpenPage()
    begin
        if (Rec."Created By Rapidi") AND (Rec."Rapidi Fields Updated" = false) then begin
            Rec.PopulateCustomFields();
            Rec."Rapidi Fields Updated" := true;
            Rec.Modify();
            Commit();// used commit as it was throwing error while opening other Runmodal pages on SO card like Dimensions
        end;
    end;
}
