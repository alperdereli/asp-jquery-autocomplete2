<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ASP - Ajax AutoComplete</title>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery.autocomplete.pack.js"></script>
<link rel="stylesheet" type="text/css" href="jquery.autocomplete.css" />
<script type="text/javascript">
$().ready(function() {
	function formatItem(row) {
		return row[0] + " (<strong>id: " + row[1] + "</strong>)";
	}
	function formatResult(row) {
		return row[0].replace(/(<.+?>)/gi, '');
	}
	$("#input").autocomplete("sorgu.asp", {
		width: 260,
		selectFirst: false,
		cacheLength: 0
	});
	$("#input").result(function(event, data, formatted) {
		if (data)
			$(this).parent().next().find("input").val(data[1]);
	});
});
</script>
<style type="text/css">
body { font-family: Helvetica; font-size: 11px; color: #000; }
</style>
</head>
<body>
	<div>
		<form>
			<div>
				Bulmak istediğiniz ismin birkaç harfini yazınız:<br />
				<p>
					<label>İsim:</label>
					<input type="text" id="input" />
				</p>
			</div>
		</form>
	</div>
</body>
</html>