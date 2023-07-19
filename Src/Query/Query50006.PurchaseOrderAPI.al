query 50006 PurchaseOrderAPI
{

    elements
    {
        dataitem(Purchase_Header; "Purchase Header")
        {
            DataItemTableFilter = "Document Type" = FILTER(Order);
            column(DocumentType; "Document Type")
            {

            }
            column(No; "No.")
            {

            }
            column(ExpectedReceiptDate; "Expected Receipt Date")
            {

            }
            column(BuyfromVendorNo; "Buy-from Vendor No.")
            {

            }
            column(CurrencyCode; "Currency Code")
            {

            }
            column(buyFromVendorName; "Buy-from Vendor Name")
            {

            }
            column(vendorAuthorizationNo; "Vendor Authorization No.")
            {

            }
            column(Amount; Amount)
            {

            }
            column(LocationCode; "Location Code")
            {

            }
            column(AssignedUserID; "Assigned User ID")
            {

            }
            column(DocumentDate; "Document Date")
            {

            }
            column(Status; Status)
            {

            }
            column(OnHold; "On Hold")
            {

            }
        }
    }
}