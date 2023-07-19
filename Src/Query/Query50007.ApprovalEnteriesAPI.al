query 50007 ApprovalEnteriesAPI
{

    elements
    {
        dataitem(ApprovalEntry; "Approval Entry")
        {
            DataItemTableFilter = "Document Type" = filter(Order), Status = filter('Open|Created');
            column(Document_No_; "Document No.")
            {

            }
            column(Sequence_No_; "Sequence No.")
            {

            }
            column(Approval_Code; "Approval Code")
            {

            }
            column(Sender_ID; "Sender ID")
            {

            }
            column(Salespers__Purch__Code; "Salespers./Purch. Code")
            {

            }
            column(Approver_ID; "Approver ID")
            {

            }
            column(Status_; Status)
            {

            }
            column(Date_Time_Sent_for_Approval; "Date-Time Sent for Approval")
            {

            }
            column(Last_Date_Time_Modified; "Last Date-Time Modified")
            {

            }
            column(Last_Modified_By_User_ID; "Last Modified By User ID")
            {

            }
            column(Comment; Comment)
            {

            }
            column(Due_Date; "Due Date")
            {

            }
            column(Amount_; Amount)
            {

            }
            column(Amount__LCY_; "Amount (LCY)")
            {

            }
            column(Currency_Code; "Currency Code")
            {

            }
        }
    }
}