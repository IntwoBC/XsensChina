tableextension 50107 SalesShipmentLineExt extends "Sales Shipment Line"
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