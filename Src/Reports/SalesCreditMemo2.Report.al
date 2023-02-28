report 50015 "Sales - Credit Memo2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\SalesCreditMemo2.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            RequestFilterFields = "No.";
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Name2; CompanyInfo."Name 2")
            {
            }
            column(CompanyInfo_Address; CompanyInfo.Address)
            {
            }
            column(CompanyInfo_Address2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo_City; CompanyInfo.City)
            {
            }
            column(CompanyInfo_PhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfo_FaxNo; CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfo_CountryCode; CompanyInfo."Country/Region Code")
            {
            }
            column(CompanyInfo_CountryName; CountryName)
            {
            }
            column(CompanyInfo_VATRegistrationNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(SalesHeader_VATREgistrationNo; Cust."VAT Registration No.")
            {
            }
            column(SalesHeader_No; "Sales Cr.Memo Header"."No.")
            {
            }
            column(SalesHeader_PostingDate; "Sales Cr.Memo Header"."Posting Date")
            {
            }
            column(SalesHeader_SalesCode; "Sales Cr.Memo Header"."Salesperson Code")
            {
            }
            column(SalesHeader_SalesName; SalesName)
            {
            }
            column(SalesHeader_SalesEmail; SalesEmail)
            {
            }
            column(YourReference; "Sales Cr.Memo Header"."Your Reference")
            {
            }
            column(SalesHeader_CustNo; "Sales Cr.Memo Header"."Bill-to Customer No.")
            {
            }
            column(SalesHeader_CustName; "Sales Cr.Memo Header"."Bill-to Name")
            {
            }
            column(SalesHeader_CustName2; "Sales Cr.Memo Header"."Bill-to Name 2")
            {
            }
            column(SalesHeader_CustAddress; "Sales Cr.Memo Header"."Bill-to Address")
            {
            }
            column(SalesHeader_CustAddress2; "Sales Cr.Memo Header"."Bill-to Address 2")
            {
            }
            column(SalesHeader_CustCity; "Sales Cr.Memo Header"."Bill-to City")
            {
            }
            column(SalesHeader_CustCountryCode; "Sales Cr.Memo Header"."Bill-to Country/Region Code")
            {
            }
            column(SalesHeader_YourReference; "Sales Cr.Memo Header"."Your Reference")
            {
            }
            column(SalesHeader_CustContact; "Sales Cr.Memo Header"."Bill-to Contact")
            {
            }
            column(SalesHeader_CustCountryName; CustCountryName)
            {
            }
            column(SalesHeader_CurrencyCode; CurrencyCode)
            {
            }
            column(SalesHeader_PaymentTermCode; "Sales Cr.Memo Header"."Payment Terms Code")
            {
            }
            column(PaymentTermDescription; PaymentTermDescription)
            {
            }
            column(TotalAmt; TotalAmt)
            {
            }
            column(BankInfo11; BankInfo[1] [1])
            {
            }
            column(BankInfo12; BankInfo[1] [2])
            {
            }
            column(BankInfo13; BankInfo[1] [3])
            {
            }
            column(BankInfo14; BankInfo[1] [4])
            {
            }
            column(BankInfo21; BankInfo[2] [1])
            {
            }
            column(BankInfo22; BankInfo[2] [2])
            {
            }
            column(BankInfo23; BankInfo[2] [3])
            {
            }
            column(BankInfo24; BankInfo[2] [4])
            {
            }
            column(BankInfo31; BankInfo[3] [1])
            {
            }
            column(BankInfo32; BankInfo[3] [2])
            {
            }
            column(BankInfo33; BankInfo[3] [3])
            {
            }
            column(BankInfo34; BankInfo[3] [4])
            {
            }
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    WHERE(Quantity = FILTER(<> 0));
                column(DocumentNo_SalesCrMemoLine; "Sales Cr.Memo Line"."Document No.")
                {
                }
                column(SalesLine_LineNo; "Sales Cr.Memo Line"."Line No.")
                {
                }
                column(SalesLine_No; "Sales Cr.Memo Line"."No.")
                {
                }
                column(SalesLine_Description; "Sales Cr.Memo Line".Description)
                {
                }
                column(SalesLine_Quantity; "Sales Cr.Memo Line".Quantity)
                {
                }
                column(SalesLine_DirectUnitCost; "Sales Cr.Memo Line"."Unit Price")
                {
                }
                column(SalesLine_LineAmount; "Sales Cr.Memo Line"."Line Amount")
                {
                }
                column(Sorting; "Sales Cr.Memo Line".Sorting)
                {
                }

                trigger OnPreDataItem()
                begin
                    SETCURRENTKEY("Document No.", Sorting, "Line No.");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                SalesName := '';
                SalesEmail := '';
                IF SalesPerson.GET("Salesperson Code") THEN BEGIN
                    SalesName := SalesPerson.Name;
                    SalesEmail := SalesPerson."E-Mail";
                END;

                CustCountryName := '';
                IF Country.GET("Bill-to Country/Region Code") THEN
                    CustCountryName := Country.Name;

                PaymentTermDescription := '';
                IF PaymentTerms.GET("Payment Terms Code") THEN
                    PaymentTermDescription := PaymentTerms.Description;

                IF "Currency Code" <> '' THEN
                    CurrencyCode := "Currency Code"
                ELSE BEGIN
                    GLSetup.GET;
                    CurrencyCode := GLSetup."LCY Code";
                END;

                SalesInvLine.SETRANGE("Document No.", "No.");
                IF SalesInvLine.FINDSET THEN
                    REPEAT
                        TotalAmt += SalesInvLine."Line Amount";
                    UNTIL SalesInvLine.NEXT = 0;

                IF Cust.GET("Bill-to Customer No.") THEN;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);

        CountryName := '';
        IF Country.GET(CompanyInfo."Country/Region Code") THEN
            CountryName := Country.Name;

        BankFilter := CompanyInfo."Bank Branch No.";

        BankRec.RESET;
        BankRec.SETFILTER("No.", BankFilter);
        BankIndex := 0;
        IF BankRec.FIND('-') THEN BEGIN
            REPEAT
                IF BankIndex < 3 THEN BEGIN
                    BankIndex += 1;
                    BankInfo[BankIndex] [1] := BankRec."Currency Code";
                    BankInfo[BankIndex] [2] := BankRec.Name;
                    BankInfo[BankIndex] [3] := BankRec."Name 2";
                    BankInfo[BankIndex] [4] := BankRec."Bank Account No.";
                END;
            UNTIL BankRec.NEXT = 0;
        END;
    end;

    var
        CompanyInfo: Record "Company Information";
        GLSetup: Record "General Ledger Setup";
        Cust: Record Customer;
        SalesPerson: Record "Salesperson/Purchaser";
        Country: Record "Country/Region";
        SalesInvLine: Record "Sales Cr.Memo Line";
        PaymentTerms: Record "Payment Terms";
        SalesName: Text;
        SalesEmail: Text;
        CountryName: Text;
        CustCountryName: Text;
        CurrencyCode: Code[10];
        PaymentTermDescription: Text;
        TotalAmt: Decimal;
        BankInfo: array[3, 4] of Text;
        BankRec: Record "Bank Account";
        BankIndex: Integer;
        BankFilter: Text;
}

