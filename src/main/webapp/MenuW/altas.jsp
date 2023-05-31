<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medicmart</title>
        <link rel="shortcut icon" href="img/finite logo.png" type="image/x-icon">
        <link rel="stylesheet" href="estilos2.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet"> 
       
        <script>
            function agregar() {
                    abc = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]; 
    
                for (i = 0; i < abc.length; i++)
                    combito.options[i + 1] = new Option(abc[i]);
            }
    
            function agregarotrocombo() {
                var contador = 0;
                var abc;
                var cuantos = combito.length;
    
                for (contador = 1; contador <= cuantos; contador++)
                    combito2.options[1] = null;
                abc = combito.options[combito.selectedIndex];
                noabc = combito.options[combito.selectedIndex].index;
    
                if (noabc === 1) {
                    a = ["ATLÁNTICO","AFIRME","ANÁHUAC", "AMERICAN EXPRESS", "AZTECA", "AUTOFIN", "ABC CAPITAL"];
                    for (i = 0; i < a.length; i++)
                        combito2.options[i + 1] = new Option(a[i]);
                } 
                else
                if (noabc === 2) {
                    b = ["BANAMEX", "BBVA BANCOMER", "BBVA SERVICIOS", "BANSI", "BANPAÍS", "BANCEN",
                    "BAMSA", "BANORTE/IXE", "BOSTON", "BNP", "BANK ONE", "BARCLAYS", "BANCO FAMSA", "BANCO MULTIVA",
                    "BM ACTINVER", "BANCOPPEL", "BANK NEW YORK", "BM BASE", "BICENTENARIO", "BANKAOOL", "BANCREA",
                    "BANK OF CHINA", "Bancrecer, S.A." ];
                    for (i = 0; i < b.length; i++)
                        combito2.options[i + 1] = new Option(b[i]);
                } 
            else
                if (noabc === 3) {
                    c = ["CITIBANK", "CONFÍA", "CAPITAL", "CREMI", "COMPARTAMOS", "CONSUBANCO", "CIBANCO",
                      "CHIHUAHUA", "Credit Suisse First Boston"];
                    for (i = 0; i < c.length; i++)
                        combito2.options[i + 1] = new Option(c[i]);
                } 
            else
                if (noabc === 4) {
                    d = ["DONDÉ", "DEUTSCHE"];
                    for (i = 0; i < d.length; i++)
                        combito2.options[i + 1] = new Option(d[i]);
                } 
            else
                if (noabc === 5) {
                    e = ["//"];
                    for (i = 0; i < e.length; i++)
                        combito2.options[i + 1] = new Option(e[i]);
                } 
            else
                if (noabc === 6) {
                    f = ["FINTERRA", "FUJI"];
                    for (i = 0; i < f.length; i++)
                        combito2.options[i + 1] = new Option(f[i]);
                } 
            else
                if (noabc === 7) {
                    g = ["GE MONEY"];
                    for (i = 0; i < g.length; i++)
                        combito2.options[i + 1] = new Option(g[i]);
                } 
            else
                if (noabc === 8) {
                    h = ["HSBC"];
                    for (i = 0; i < h.length; i++)
                        combito2.options[i + 1] = new Option(h[i]);
                } 
            else
                if (noabc === 9) {
                    ji = ["INDUSTRIAL", "INTERBANCO", "IXE", "INBURSA", "INTERACCIONES", "INVEX", "INVESTA BANK", "ING", "INTERCAM BANCO"];
                    for (i = 0; i < ji.length; i++)
                        combito2.options[i + 1] = new Option(ji[i]);
                } 
            else
                if (noabc === 10) {
                    j = ["JP MORGAN"];
                    for (i = 0; i < j.length; i++)
                        combito2.options[i + 1] = new Option(j[i]);
                } 
            else
                if (noabc === 11) {
                    k = ["//"];
                    for (i = 0; i < k.length; i++)
                        combito2.options[i + 1] = new Option(k[i]);
                } 
            else
                if (noabc === 12) {
                    l = ["//"];
                    for (i = 0; i < l.length; i++)
                        combito2.options[i + 1] = new Option(l[i]);
                } 
            else
                if (noabc === 13) {
                    m = ["MONEX", "MIFEL"];
                    for (i = 0; i < m.length; i++)
                        combito2.options[i + 1] = new Option(m[i]);
                } 
            else
                if (noabc === 14) {
                    n = ["NATIONSBANK"];
                    for (i = 0; i < n.length; i++)
                        combito2.options[i + 1] = new Option(n[i]);
                } 
            else
                if (noabc === 15) {
                    o = ["ORIENTE", "OBRERO"];
                    for (i = 0; i < o.length; i++)
                        combito2.options[i + 1] = new Option(o[i]);
                } 
            else
                if (noabc === 16) {
                    p = ["PRONORTE", "PROMEX", "PAGATODO"];
                    for (i = 0; i < p.length; i++)
                        combito2.options[i + 1] = new Option(p[i]);
                }
            else
                if (noabc === 17) {
                    q = ["QUADRUM"];
                    for (i = 0; i < q.length; i++)
                        combito2.options[i + 1] = new Option(q[i]);
                }
            else
                if (noabc === 18) {
                    r = ["REPUBLIC NY"];
                    for (i = 0; i < r.length; i++)
                        combito2.options[i + 1] = new Option(r[i]);
                }
            else
                if (noabc === 19) {
                    s = ["SERFIN", "SANTANDER", "SURESTE", "SCOTIABANK INVERLAT", "SOCIÉTÉ"];
                    for (i = 0; i < s.length; i++)
                        combito2.options[i + 1] = new Option(s[i]);
                }
            else
                if (noabc === 20) {
                   t = ["TOKYO"];
                    for (i = 0; i < t.length; i++)
                        combito2.options[i + 1] = new Option(t[i]);
                }
            else
                if (noabc === 21) {
                    u = ["UNIÓN", "UBS BANK"];
                    for (i = 0; i < u.length; i++)
                        combito2.options[i + 1] = new Option(u[i]);
                }
            else
                if (noabc === 22) {
                    v = ["VOLKSWAGEN", "VE POR MÁS"];
                    for (i = 0; i < v.length; i++)
                        combito2.options[i + 1] = new Option(v[i]);
                }
            else
                if (noabc === 23) {
                    w = ["WAL-MART"];
                    for (i = 0; i < w.length; i++)
                        combito2.options[i + 1] = new Option(w[i]);
                }
            else
                if (noabc === 24) {
                    x = ["//"];
                    for (i = 0; i < x.length; i++)
                        combito2.options[i + 1] = new Option(x[i]);
                }
            else
                if (noabc === 25) {
                    y = ["//"];
                    for (i = 0; i < y.length; i++)
                        combito2.options[i + 1] = new Option(y[i]);
                }
            else
                if (noabc === 26) {
                    z = ["//"];
                    for (i = 0; i < z.length; i++)
                        combito2.options[i + 1] = new Option(z[i]);
                }
            }
            
        </script>
         <script language="JavaScript" type="text/javascript">
function click(){
	if(event.button===2)
		{
			alert('Accion invalida!');
		}
}
document.onmousedown = click;
</script>
<script type = "text/javascript" language = "javascript">
		
		function solonumeros(e)
			{
				var keynum;
				if(window.event)
					{	/*	IE*/
						keynum = e.keyCode;
					}
				else
					if(e.which)
						{	// Netscape Firefox Opera
							keynum = e.which;
						}
				if((keynum>=48 && keynum<=57) || keynum === 8 || keynum ===46)
					{
						return true;
					}
				else
					{
						return false;
					}
			}
                function validaCaracteres(e)
			{
				var keynum;
				if(window.event)
					{
						keynum = e.keyCode;
					}
				else
					if(e.which)
						{ // Netscape Firefox Opera
							keynum = e.which;
						}
				if((keynum>=48 && keynum<=57) || (keynum>=97 && keynum<=122) || (keynum>=65 && keynum<= 90) || (keynum === 8) || (keynum === 32) || 
				(keynum >= 160 && keynum <=163))
					{
						return true;
					}
					else
						{
							return false;
						}
			}
                       
                        
                        </script>
<script type="text/javascript">
function disableCopyPaste(elm) 
	{
		// Deshabilitar los eventos cut/copy/paste
		elm.onkeydown = interceptKeys;
		elm.oncontextmenu = function() {
			return false;
		};
	}

function interceptKeys(evt) {
    evt = evt||window.event // IE support
    var c = evt.keyCode;
    var ctrlDown = evt.ctrlKey||evt.metaKey // Mac
    if (ctrlDown && evt.altKey) return true;
    // Verifica los ctrl + c, v y x
    else if (ctrlDown && c===67) return false // c
    else if (ctrlDown && c===86) return false // v
    else if (ctrlDown && c===88) return false // x

    return true;
}
</script>
<style>
            input[type=submit]{
                height: 30px;
                width: 120px;
                cursor: pointer;
                background-color: lightseagreen;
                color: whitesmoke;
            }
            input[type=text]{
                height: 20px;
                width: 100px;
            }
        </style>
    </head>
    <body onload = agregar();>
         <%
            
            int info = Integer.parseInt(request.getParameter("cad"));
           
            

            Connection conx = null;
            Statement sta = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conx = DriverManager.getConnection("jdbc:mysql://localhost/Fondo_financiero3?autoReconnect=true&useSSL=false", "root", "n0m3l0");
                sta = conx.createStatement();
                rs = sta.executeQuery("select Id_ff from fondo_financiero3 where Id_ff='"+info+"';");
                rs.next();
            %>
        <div align="center">
            <form action="altas2.jsp" method="post" name="formu">
        <h3> Para el optimo uso del software, ingrese los siguientes datos </h3>
            <br>
            
            <input type="hidden" name="cad" value="<%=rs.getInt(1)%>">
            <br><br>
            RFC: &nbsp; <input type="text" name="RFC">
            <br><br>
            Firma Digital: &nbsp;<input type="number" name="FirmaDigi" >
            <br><br>

            Letra: &nbsp;
            <select  id="combito" onchange=agregarotrocombo() name="ltr">
                <option value="opca"> Seleccione alguna</option>
            </select>&nbsp; &nbsp;&nbsp;&nbsp;
            
            Banco de conveniencia: &nbsp; &nbsp;
            <select  id="combito2" onchange="desplegar()" name="Banco">
                <option value="opcaa"> Seleccione alguna</option>
            </select><br><br>
            
            No. de Tarjeta: &nbsp; <input type="text" name="NoTarjeta" onfocus = " return disbaleCopyPaste(elm)" autocomplete="off" onkeydown = "return interceptKeys(event)" onkeypress = "return solonumeros(event)"> 
            <br><br>
            CURP: &nbsp; <input type="text" name="CurP" > 
            
            <br><br>
            <input type="submit" name="altas" value="Alta"><br><br>
            <br><br><br><br>
        </form>
            </div>
        
       <%
        } catch (SQLException error) {
                out.print(error.toString());
            }
             
            
        %>
                </main>
    </body>
</html>