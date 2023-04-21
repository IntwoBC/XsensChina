permissionset 50000 Mcube_InTWO
{
    Assignable = true;
    Caption = 'Mcube_InTWO', MaxLength = 30;
    Permissions =
        codeunit "Event Subscriber" = X,
        page "Posted Sales Credit Memo_LT" = X,
        page "Posted Sales Cr Memo Lines_LT" = X,
        page "Posted Sales Invoice Lines_LT" = X,
        page "Posted Sales Invoice_LT" = X,
        page "Sales Order LT" = X,
        query "Manual Journal entry" = X,
        query SalesOrder = X,
        //report "Detail Customer Ledger" = X,
        //report "Detail General Ledger" = X,
        //report "Detail Vendor Ledger" = X,
        //report "Purchase - Order" = X,
        //report Reminder2 = X,
        //report "Sales - Credit Memo2" = X,
        //report "Sales - Invoice2" = X,
        //report "Sales - Order Confirmation" = X,
        //report "Sales -ReturnOrderConfirmation" = X,
        //report "Sales - Return Receipt2" = X,
        //report "Sales - Shipment2" = X,
        xmlport "IC Outbox Imp/Exp_Intwo" = X;
}
