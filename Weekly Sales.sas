
proc import datafile='/home/u63491031/KIGEA/Train1.csv'
    dbms=csv
    out=train
    replace;
    getnames=yes;
run;


options format=12.2;


proc means data=train noprint;

    var Weekly_Sales;

    class Store Dept Date;

    types Store Dept Date;

    output out=weekly_sales_stats mean=Mean_Sales sum=Total_Sales n=N_Sales min=Min_Sales max=Max_Sales;
run;


title "Weekly Sales Descriptive Statistics for a Certain Department in a Given Store";
footnote "Data source: train.csv";


proc print data=weekly_sales_stats (obs=20) label noobs;
    label
        Mean_Sales = 'Mean Weekly Sales'
        Total_Sales = 'Total Weekly Sales'
        N_Sales = 'Number of Sales'
        Min_Sales = 'Minimum Weekly Sales'
        Max_Sales = 'Maximum Weekly Sales';
run;
