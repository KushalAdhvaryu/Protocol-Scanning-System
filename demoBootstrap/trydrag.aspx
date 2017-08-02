<%@ Page Title="" Language="C#" MasterPageFile="~/dragtry.master" AutoEventWireup="true" CodeFile="trydrag.aspx.cs" Inherits="trydrag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
    <script>
        $(function () {
            var sPositions = localStorage.positions || "{}",
                positions = JSON.parse(sPositions);
            $.each(positions, function (id, pos) {
                $("#" + id).css(pos)
            })
            $(function () {
                $("#draggable").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
        });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="draggable" >
  <p class="lead">Drag me around</p>
        <asp:Button ID="Button1" runat="server" Text="Button" CssClass="btn btn-primary"/>
</div>
</asp:Content>

