pageextension 50019 SalesOrderArchiveSubform extends "Sales Order Archive Subform"
{
    layout
    {
        addafter("FA Posting Date")
        {
            field(Sorting; Rec.Sorting)
            {
                ApplicationArea = All;
            }
        }
    }
}
