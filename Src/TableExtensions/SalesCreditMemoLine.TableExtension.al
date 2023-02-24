tableextension 50010 "SalesCreditMemoLine Ext" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50450; "Sorting"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Added on 20JAN2022 for sorting Lines on report';
        }
    }

    var
        myInt: Integer;
}