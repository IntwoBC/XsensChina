tableextension 50110 SalesCrMemoHeaderExt extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50013; "Application area"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'LT280721';
        }
    }

    var
        myInt: Integer;
}