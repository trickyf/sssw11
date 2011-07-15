#!/usr/bin/perl
$data = "";
while(<STDIN>){
 $line = $_;
 @stats = split(/\s/, $line);
 $predicate = $stats[0];
 $count = $stats[1];
 if($data ne ""){
  $data = "$data,\n['$predicate', $count]";
 }else{
  $data = "['$predicate', $count]";
 }
}


print "<html>\n";
print "<head>\n";
print "    <!--Load the AJAX API-->\n";
print "    <script type=\"text/javascript\" src=\"https://www.google.com/jsapi\"></script>\n";
print "    <script type=\"text/javascript\">\n";
    
print "      // Load the Visualization API and the piechart package.\n";
print "      google.load('visualization', '1', {'packages':['corechart']});\n";
      
print "      // Set a callback to run when the Google Visualization API is loaded.\n";
print "      google.setOnLoadCallback(drawChart);\n";
      
print "      // Callback that creates and populates a data table, \n";
print "      // instantiates the pie chart, passes in the data and\n";
print "      // draws it.\n";
print "      function drawChart() {\n";

print "      // Create our data table.\n";
print "      var data = new google.visualization.DataTable();\n";
print "      data.addColumn('string', 'Predicates');\n";
print "      data.addColumn('number', 'Count');\n";
print "      data.addRows([\n";
print "	     $data\n";
print "      ]);\n";

print "      // Instantiate and draw our chart, passing in some options.\n";
print "      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));\n";
print "      chart.draw(data, {width: 1200, height: 400});\n";
print "    }\n";
print "    </script>\n";
print "  </head>\n";

print "  <body>\n";
print "    <!--Div that will hold the pie chart-->\n";
print "    <div id=\"chart_div\"></div>\n";
print "  </body>\n";
print "</html>\n";


