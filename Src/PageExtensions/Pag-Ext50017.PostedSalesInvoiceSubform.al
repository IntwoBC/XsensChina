pageextension 50017 PostedSalesInvoiceSubform extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Units per Parcel")
        {

            field("VAT Invoice No."; Rec."VAT Invoice No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the VAT Invoice No. field.';
            }
            field("Amount Handled"; Rec."Amount Handled")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Amount Handled field.';
            }
            field("Quantity Handled"; Rec."Quantity Handled")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Quantity Handled field.';
            }
            field("Sales Order Line No."; Rec."Sales Order Line No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Order Line No. field.';
            }
            field("Sales Order No."; Rec."Sales Order No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Order No. field.';
            }
            field("Sorting"; Rec."Sorting")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sorting field.';
            }
            field("Document Type"; Rec."Document Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Document Type field.';
            }
            field(ExternalID; Rec.ExternalID)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the ExternalID field.';
            }
        }
    }
}
