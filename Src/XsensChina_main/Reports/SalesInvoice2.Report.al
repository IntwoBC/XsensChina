report 50014 "Sales - Invoice2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\SalesInvoice2.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
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
            column(SalesHeader_No; "Sales Invoice Header"."No.")
            {
            }
            column(SalesHeader_PostingDate; "Sales Invoice Header"."Posting Date")
            {
            }
            column(SalesHeader_SalesCode; "Sales Invoice Header"."Salesperson Code")
            {
            }
            column(SalesHeader_SalesName; SalesName)
            {
            }
            column(SalesHeader_SalesEmail; SalesEmail)
            {
            }
            column(SalesHeader_CustNo; "Sales Invoice Header"."Bill-to Customer No.")
            {
            }
            column(SalesHeader_CustName; "Sales Invoice Header"."Bill-to Name")
            {
            }
            column(SalesHeader_CustName2; "Sales Invoice Header"."Bill-to Name 2")
            {
            }
            column(SalesHeader_CustAddress; "Sales Invoice Header"."Bill-to Address")
            {
            }
            column(SalesHeader_CustAddress2; "Sales Invoice Header"."Bill-to Address 2")
            {
            }
            column(SalesHeader_CustCity; "Sales Invoice Header"."Bill-to City")
            {
            }
            column(SalesHeader_CustCountryCode; "Sales Invoice Header"."Bill-to Country/Region Code")
            {
            }
            column(SalesHeader_YourReference; "Sales Invoice Header"."Your Reference")
            {
            }
            column(SalesHeader_CustContact; "Sales Invoice Header"."Bill-to Contact")
            {
            }
            column(SalesHeader_PostCode; "Sales Invoice Header"."Bill-to Post Code")
            {
            }
            column(SalesHeader_CustCountryName; CustCountryName)
            {
            }
            column(SalesHeader_CurrencyCode; CurrencyCode)
            {
            }
            column(SalesHeader_PaymentTermCode; "Sales Invoice Header"."Payment Terms Code")
            {
            }
            column(PaymentMethodCode; "Sales Invoice Header"."Payment Method Code")
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
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    WHERE(Quantity = FILTER(<> 0));
                column(DocumentNo_SalesInvoiceLine; "Sales Invoice Line"."Document No.")
                {
                }
                column(SalesLine_LineNo; "Sales Invoice Line"."Line No.")
                {
                }
                column(SalesLine_No; "Sales Invoice Line"."No.")
                {
                }
                column(SalesLine_Description; "Sales Invoice Line".Description)
                {
                }
                column(SalesLine_Quantity; "Sales Invoice Line".Quantity)
                {
                }
                column(SalesLine_DirectUnitCost; "Sales Invoice Line"."Unit Price")
                {
                }
                column(SalesLine_LineAmount; "Sales Invoice Line"."Line Amount")
                {
                }
                column(SalesLine_CrossNo; "Sales Invoice Line"."Cross-Reference No.")
                {
                }
                column(Sorting; "Sales Invoice Line".Sorting)
                {
                }
                column(LineDiscount_SalesInvoiceLine; "Sales Invoice Line"."Line Discount %")
                {
                }
                column(LineDiscountAmount_SalesInvoiceLine; "Sales Invoice Line"."Line Discount Amount")
                {
                }
                column(VAT_SalesInvoiceLine; "Sales Invoice Line"."VAT %")
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
        SalesInvLine: Record "Sales Invoice Line";
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

