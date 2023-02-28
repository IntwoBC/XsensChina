pageextension 50017 PostedSalesInvoiceSubform extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Units per Parcel")
        {
            field("Sorting"; Rec."Sorting")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sorting field.';
            }
            field(ExternalID; Rec.ExternalID)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the ExternalID field.';
            }
        }
    }
}
