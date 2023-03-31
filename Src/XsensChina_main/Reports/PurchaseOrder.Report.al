report 50011 "Purchase - Order"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\PurchaseOrder.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = FILTER(Order));
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
            column(CopmanyInfo_Contact; CompanyInfo."Contact Person")
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
            column(CompanyInfo_PostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyInfo_CountryName; CountryName)
            {
            }
            column(CompanyInfo_VATRegistrationNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(PurchHeader_No; "Purchase Header"."No.")
            {
            }
            column(PurchHeader_OrderDate; "Purchase Header"."Order Date")
            {
            }
            column(PurchHeader_PurchaserCode; "Purchase Header"."Purchaser Code")
            {
            }
            column(PurchHeader_PurchaserName; PurchaserName)
            {
            }
            column(PurchHeader_PurchaserEmail; PurchaserEmail)
            {
            }
            column(PurchHeader_VendorNo; "Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(PurchHeader_VendorName; "Purchase Header"."Buy-from Vendor Name")
            {
            }
            column(PurchHeader_VendorName2; "Purchase Header"."Buy-from Vendor Name 2")
            {
            }
            column(PurchHeader_VendorAddress; "Purchase Header"."Buy-from Address")
            {
            }
            column(PurchHeader_VendorAddress2; "Purchase Header"."Buy-from Address 2")
            {
            }
            column(PurchHeader_VendorCity; "Purchase Header"."Buy-from City")
            {
            }
            column(PurchHeader_VendorCountryCode; "Purchase Header"."Buy-from Country/Region Code")
            {
            }
            column(PurchHeader_VendorCountryName; VendorCountryName)
            {
            }
            column(PurchHeader_CurrencyCode; CurrencyCode)
            {
            }
            column(VATRate; VATRate)
            {
            }
            column(PurchHeader_PaymentTermCode; "Purchase Header"."Payment Terms Code")
            {
            }
            column(PaymentTermDescription; PaymentTermDescription)
            {
            }
            column(TotalAmtExclVAT; TotalAmtExclVAT)
            {
            }
            column(TotalAmtInclVAT; TotalAmtInclVAT)
            {
            }
            column(TotalVATAmt; TotalVATAmt)
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
            column(postcode; "Purchase Header"."Ship-to Post Code")
            {
            }
            column(city; "Purchase Header"."Ship-to City")
            {
            }
            column(shipcity; shipcity)
            {
            }
            column(invoicecity; invoicecity)
            {
            }
            column(shippostcode; shippostcode)
            {
            }
            column(invoicepostcode; invoicepostcode)
            {
            }
            column(shipmentmethodcode; "Purchase Header"."Shipment Method Code")
            {
            }
            column(PurchHeader_ShiptoAddress; "Purchase Header"."Ship-to Address")
            {
            }
            column(PurchHeader_ShiptoAddress2; "Purchase Header"."Ship-to Address 2")
            {
            }
            column(PurchHeader_ShiptoName; "Purchase Header"."Ship-to Name")
            {
            }
            column(PurchHeader_ShiptoName2; "Purchase Header"."Ship-to Name 2")
            {
            }
            column(PurchHeader_ShiptoCity; "Purchase Header"."Ship-to City")
            {
            }
            column(PurchHeader_ShiptoContact; "Purchase Header"."Ship-to Contact")
            {
            }
            column(PurchHeader_ShiptoPostCode; "Purchase Header"."Ship-to Post Code")
            {
            }
            column(PruchHeader_ShiptoCountry; "Purchase Header"."Ship-to Country/Region Code")
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"),
                               "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                column(DocumentNo_PurchaseLine; "Purchase Line"."Document No.")
                {
                }
                column(PurchLine_LineNo; "Purchase Line"."Line No.")
                {
                }
                column(PurchLine_No; "Purchase Line"."No.")
                {
                }
                column(PurchLine_Description; "Purchase Line".Description)
                {
                }
                column(PurchLine_Quantity; "Purchase Line".Quantity)
                {
                }
                column(PurchLine_DirectUnitCost; "Purchase Line"."Direct Unit Cost")
                {
                }
                column(PurchLine_LineAmount; "Purchase Line"."Line Amount")
                {
                }
                column(PurchLine_ExpectedReceiptDate; "Purchase Line"."Expected Receipt Date")
                {
                }
                column(CostCenter; CostCenter)
                {
                }
                column(ProjectCode; ProjectCode)
                {
                }
                column(Sorting; "Purchase Line".Sorting)
                {
                }
                column(LineDiscountAmount_PurchaseLine; "Purchase Line"."Line Discount Amount")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CostCenter := '';
                    ProjectCode := '';
                    DimensionSet.RESET;
                    DimensionSet.SETRANGE("Dimension Set ID", "Purchase Line"."Dimension Set ID");
                    IF DimensionSet.FIND('-') THEN BEGIN
                        DimensionSet.SETRANGE("Dimension Code", 'COST CENTER');
                        IF DimensionSet.FIND('-') THEN BEGIN
                            CostCenter := DimensionSet."Dimension Value Code";
                        END;
                    END;

                    DimensionSet.RESET;
                    DimensionSet.SETRANGE("Dimension Set ID", "Purchase Line"."Dimension Set ID");
                    IF DimensionSet.FIND('-') THEN BEGIN
                        DimensionSet.SETRANGE("Dimension Code", 'PROJECT');
                        IF DimensionSet.FIND('-') THEN BEGIN
                            ProjectCode := DimensionSet."Dimension Value Code";
                        END;
                    END;
                end;

                trigger OnPreDataItem()
                begin
                    SETCURRENTKEY("Document No.", Sorting, "Line No.");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                shippostcode := '';
                invoicepostcode := '';
                shipcity := '';
                invoicecity := '';

                IF STRPOS("Purchase Header"."Ship-to City", '/') > 0 THEN BEGIN
                    shipcity := COPYSTR("Purchase Header"."Ship-to City", 1, STRPOS("Purchase Header"."Ship-to City", '/') - 1);
                    invoicecity := COPYSTR("Purchase Header"."Ship-to City", STRPOS("Purchase Header"."Ship-to City", '/') + 1);
                END;

                IF STRPOS("Purchase Header"."Ship-to Post Code", '/') > 0 THEN BEGIN
                    shippostcode := COPYSTR("Purchase Header"."Ship-to Post Code", 1, STRPOS("Purchase Header"."Ship-to Post Code", '/') - 1);
                    invoicepostcode := COPYSTR("Purchase Header"."Ship-to Post Code", STRPOS("Purchase Header"."Ship-to Post Code", '/') + 1);
                END;


                PurchaserName := '';
                PurchaserEmail := '';
                IF Purchaser.GET("Purchaser Code") THEN BEGIN
                    PurchaserName := Purchaser.Name;
                    PurchaserEmail := Purchaser."E-Mail";
                END;

                VendorCountryName := '';
                IF Country.GET("Buy-from Country/Region Code") THEN
                    VendorCountryName := Country.Name;

                PaymentTermDescription := '';
                IF PaymentTerms.GET("Payment Terms Code") THEN
                    PaymentTermDescription := PaymentTerms.Description;

                IF "Currency Code" <> '' THEN
                    CurrencyCode := "Currency Code"
                ELSE BEGIN
                    GLSetup.GET;
                    CurrencyCode := GLSetup."LCY Code";
                END;

                TotalAmtExclVAT := 0;
                TotalAmtInclVAT := 0;
                TotalVATAmt := 0;
                VATRate := 0;
                PurchLine.SETRANGE("Document Type", "Document Type");
                PurchLine.SETRANGE("Document No.", "No.");
                IF PurchLine.FINDSET THEN
                    REPEAT
                        IF (VATRate = 0) AND (PurchLine."VAT %" > 0) THEN
                            VATRate := PurchLine."VAT %";

                        IF "Prices Including VAT" THEN BEGIN
                            TotalAmtInclVAT += PurchLine."Line Amount";
                            TotalAmtExclVAT += ROUND(PurchLine."Line Amount" / (1 + PurchLine."VAT %" / 100), 0.01);
                        END ELSE BEGIN
                            TotalAmtInclVAT += ROUND(PurchLine."Line Amount" * (1 + PurchLine."VAT %" / 100), 0.01);
                            TotalAmtExclVAT += PurchLine."Line Amount";
                        END;
                    UNTIL PurchLine.NEXT = 0;

                TotalVATAmt := TotalAmtInclVAT - TotalAmtExclVAT;
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

        BankInfo1[1] := CompanyInfo."Bank Name";
        BankInfo1[2] := CompanyInfo."Bank Account No.";
    end;

    var
        CompanyInfo: Record "Company Information";
        GLSetup: Record "General Ledger Setup";
        Vendor: Record Vendor;
        Purchaser: Record "Salesperson/Purchaser";
        Country: Record "Country/Region";
        PurchLine: Record "Purchase Line";
        PaymentTerms: Record "Payment Terms";
        PurchaserName: Text;
        PurchaserEmail: Text;
        CountryName: Text;
        VendorCountryName: Text;
        CurrencyCode: Code[10];
        VATRate: Decimal;
        VATRegisterNo: Text;
        PaymentTermDescription: Text;
        TotalAmtExclVAT: Decimal;
        TotalAmtInclVAT: Decimal;
        TotalVATAmt: Decimal;
        BankInfo1: array[4] of Text;
        BankInfo2: array[4] of Text;
        BankInfo: array[3, 4] of Text;
        DimensionSet: Record "Dimension Set Entry";
        CostCenter: Text;
        ProjectCode: Text;
        BankRec: Record "Bank Account";
        BankFilter: Text;
        BankIndex: Integer;
        shippostcode: Text;
        invoicepostcode: Text;
        shipcity: Text;
        invoicecity: Text;
}

