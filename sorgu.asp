<% 'Response.CharSet = "windows-1254"
'Veritabanı bağlantımızı oluşturuyoruz
Set conn = Server.CreateObject("ADODB.Connection")
dsn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("veritabani.mdb")
conn.open dsn

'Formdan gelen veriyi alıyoruz
aranan = LCase(Request.QueryString("q"))
'Recordset açılıyor
Set RS=Server.CreateObject("ADODB.Recordset")
'Gelen veriyi veritabanında sorgulayacak sql cümlesini yazıyoruz
Sql = "Select * From isimler Where AdSoyad Like '%" & aranan & "%' Order By AdSoyad"
RS.Open Sql, conn, 1, 3

If RS.RecordCount > 0 Then 'Veritabanından dönen kayıt sayısı sıfırdan büyükse
	i = 1
	Sinirla = 10 'Listelenecek kayıt sayısını buradan sınırlayabiliriz
	'Toplam 10 kayıt listeliyoruz
	Do While Not RS.EOF And i < (Sinirla + 1)
		'Response.Write ("<li onClick=""fill('"&RS("ilce")&"');"">"&RS("ilce")&"</li>")
		'Response.Write RS("AdSoyad") & "|" & RS("ID") & vbCrlf
		Response.Write RS("AdSoyad") & vbCrlf
		i = i + 1
		RS.MoveNext
	Loop
End If
RS.Close
conn.Close
%>