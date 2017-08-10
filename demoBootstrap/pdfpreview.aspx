<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pdfpreview.aspx.cs" Inherits="pdfpreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/js/pdfobject.js"></script>
<script>PDFObject.embed("/pdf/testpdf.pdf", "#example1");</script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="example1">
       
        <iframe src="PDF/testpdf.pdf" width="100%" height="100%" style="border: none;">
            This browser does not support PDFs. Please download the PDF to view it: <a href="/pdf/sample-3pp.pdf">Download PDF</a>
        </iframe>
        <input id="Button1" type="button" value="button" onclick="playPause()"/>
        
         <iframe src="http://techslides.com/demos/sample-videos/small.mp4" width="100%" height="100%" style="border: none;">
            This browser does not support PDFs. Please download the PDF to view it: <a href="/pdf/sample-3pp.pdf">Download PDF</a>
        </iframe>
     
       
    </div>
    </form>
</body>
</html>
