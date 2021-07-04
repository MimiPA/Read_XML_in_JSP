<%@ page contentType="text/html; charset=utf-8" language="java" import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*" errorPage="" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Maskapai</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#maskapai').DataTable();
        });
    </script>
</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50">
    <!--Tabel List Maskapai-->
    <h1 class="text-center" style="padding-top: 20px;"><i class='fas fa-plane' style='font-size:24px'></i> Jadwal Penerbangan <i class='fas fa-plane' style='font-size:24px'></i></h1>
    <div class="container" style="padding-top: 30px;">
        <table class="table table-bordered table-hover" id="maskapai">
            <thead class="bg-info">
                <tr>
                    <th>ID</th>
                    <th>From</th>
                    <th>To</th>
                    <th>Depart</th>
                    <th>Arrive</th>
                    <th>Price</th>
                    <th>Maskapai</th>
                </tr>
            </thead>
            <tbody>
                <%
                    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                    DocumentBuilder db = dbf.newDocumentBuilder();
                    String[] aFile = {"maskapaiRS.xml", "maskapaiCH.xml", "maskapaiMS.xml"};
                    String[] aMaskapai = {"Maskapai RS", "Maskapai CH", "Maskapai MS"};
                    int m = 1;

                    for (int z = 0; z < aFile.length; z++) {
                        Document doc = db.parse("http://localhost:8080/xml/" + aFile[z]);
                        NodeList ID = doc.getElementsByTagName("ID");
                        NodeList dari = doc.getElementsByTagName("dari");
                        NodeList ke = doc.getElementsByTagName("ke");
                        NodeList depart = doc.getElementsByTagName("depart");
                        NodeList arrive = doc.getElementsByTagName("arrive");
                        NodeList price = doc.getElementsByTagName("price");
                        
                        for(int i=0;i<=ID.getLength()-1;i++) {
                %>
                            <tr>
                                <td><%=m%></td>
                                <td><%=dari.item(i).getFirstChild().getNodeValue()%></td>
                                <td><%=ke.item(i).getFirstChild().getNodeValue()%></td>
                                <td><%=depart.item(i).getFirstChild().getNodeValue()%></td>
                                <td><%=arrive.item(i).getFirstChild().getNodeValue()%></td>
                                <td><%=price.item(i).getFirstChild().getNodeValue()%></td>
                                <td><%=aMaskapai[z]%></td>
                            </tr>
                <%
                            m++;
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
    <!--End of List Mhs-->
    <hr>

</body>

</html>