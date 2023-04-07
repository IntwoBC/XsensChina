report 50016 "Sales -ReturnOrderConfirmation"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\vSalesReturnOrderConfirmation.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = FILTER("Return Order"));
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
            column(SalesHeader_No; "Sales Header"."No.")
            {
            }
            column(SalesHeader_OrderDate; "Sales Header"."Order Date")
            {
            }
            column(SalesHeader_SalesCode; "Sales Header"."Salesperson Code")
            {
            }
            column(SalesHeader_SalesName; SalesName)
            {
            }
            column(SalesHeader_SalesEmail; SalesEmail)
            {
            }
            column(SalesHeader_CustNo; "Sales Header"."Bill-to Customer No.")
            {
            }
            column(SalesHeader_CustName; "Sales Header"."Bill-to Name")
            {
            }
            column(SalesHeader_CustName2; "Sales Header"."Bill-to Name 2")
            {
            }
            column(SalesHeader_CustAddress; "Sales Header"."Bill-to Address")
            {
            }
            column(SalesHeader_CustAddress2; "Sales Header"."Bill-to Address 2")
            {
            }
            column(SalesHeader_CustCity; "Sales Header"."Bill-to City")
            {
            }
            column(SalesHeader_CustCountryCode; "Sales Header"."Bill-to Country/Region Code")
            {
            }
            column(SalesHeader_YourReference; "Sales Header"."Your Reference")
            {
            }
            column(SalesHeader_ShipName; "Sales Header"."Ship-to Name")
            {
            }
            column(SalesHeader_ShipName2; "Sales Header"."Ship-to Name 2")
            {
            }
            column(SalesHeader_ShipAddress; "Sales Header"."Ship-to Address")
            {
            }
            column(SalesHeader_ShipAddress2; "Sales Header"."Ship-to Address 2")
            {
            }
            column(SalesHeader_ShipCity; "Sales Header"."Ship-to City")
            {
            }
            column(SalesHeader_ShipCountryCode; "Sales Header"."Ship-to Country/Region Code")
            {
            }
            column(SalesHeader_CustContact; "Sales Header"."Bill-to Contact")
            {
            }
            column(SalesHeader_ShipContact; "Sales Header"."Ship-to Contact")
            {
            }
            column(SalesHeader_SellContact; "Sales Header"."Sell-to Contact")
            {
            }
            column(SalesHeader_ShipCountryName; ShipCountryName)
            {
            }
            column(SalesHeader_CustCountryName; CustCountryName)
            {
            }
            column(SalesHeader_CurrencyCode; CurrencyCode)
            {
            }
            column(SalesHeader_PaymentTermCode; "Sales Header"."Payment Terms Code")
            {
            }
            column(PaymentTermDescription; PaymentTermDescription)
            {
            }
            column(PaymentMethodName; PaymentMethodName)
            {
            }
            column(ShipmentMethodName; ShipmentMethodName)
            {
            }
            column(SalesHeader_ShipmentDate; "Sales Header"."Shipment Date")
            {
            }
            column(TotalAmt; TotalAmt)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"),
                               "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                column(DocumentNo_SalesLine; "Sales Line"."Document No.")
                {
                }
                column(SalesLine_LineNo; "Sales Line"."Line No.")
                {
                }
                column(SalesLine_No; "Sales Line"."No.")
                {
                }
                column(SalesLine_Description; "Sales Line".Description)
                {
                }
                column(SalesLine_Quantity; "Sales Line".Quantity)
                {
                }
                column(SalesLine_DirectUnitCost; "Sales Line"."Unit Price")
                {
                }
                column(SalesLine_LineAmount; "Sales Line"."Line Amount")
                {
                }
                column(Sorting; "Sales Line".Sorting)
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
                ShipCountryName := '';
                IF Country.GET("Ship-to Country/Region Code") THEN
                    ShipCountryName := Country.Name;

                PaymentTermDescription := '';
                IF PaymentTerms.GET("Payment Terms Code") THEN
                    PaymentTermDescription := PaymentTerms.Description;

                PaymentMethodName := '';
                IF PaymentMethod.GET("Payment Method Code") THEN
                    PaymentMethodName := PaymentMethod.Description;
                ShipmentMethodName := '';
                IF ShipmentMethod.GET("Shipment Method Code") THEN
                    ShipmentMethodName := ShipmentMethod.Description;

                IF "Currency Code" <> '' THEN
                    CurrencyCode := "Currency Code"
                ELSE BEGIN
                    GLSetup.GET;
                    CurrencyCode := GLSetup."LCY Code";
                END;

                SalesLine.SETRANGE("Document Type", "Document Type");
                SalesLine.SETRANGE("Document No.", "No.");
                IF SalesLine.FINDSET THEN
                    REPEAT
                        TotalAmt += SalesLine."Line Amount";
                    UNTIL SalesLine.NEXT = 0;

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
    end;

    var
        CompanyInfo: Record "Company Information";
        GLSetup: Record "General Ledger Setup";
        Cust: Record Customer;
        SalesPerson: Record "Salesperson/Purchaser";
        Country: Record "Country/Region";
        SalesLine: Record "Sales Line";
        PaymentTerms: Record "Payment Terms";
        PaymentMethod: Record "Payment Method";
        ShipmentMethod: Record "Shipment Method";
        SalesName: Text;
        SalesEmail: Text;
        CountryName: Text;
        CustCountryName: Text;
        CurrencyCode: Code[10];
        PaymentTermDescription: Text;
        ShipCountryName: Text;
        PaymentMethodName: Text;
        ShipmentMethodName: Text;
        TotalAmt: Decimal;
}

