tableextension 50008 "Sales Invoice Line Ext" extends "Sales Invoice Line"
{
    fields
    {
        field(50450; Sorting; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Added on 20JAN2022 for sorting Lines on report';
        }
        field(50451; ExternalID; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}