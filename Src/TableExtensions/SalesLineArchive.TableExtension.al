tableextension 50017 "SalesLineArchive Ext" extends "Sales Line Archive"
{
    fields
    {
        field(50450; Sorting; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Added on 20JAN2022 for sorting Lines on report';
        }
    }

    var
        myInt: Integer;
}