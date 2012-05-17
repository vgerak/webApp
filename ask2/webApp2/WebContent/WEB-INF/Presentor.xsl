<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>List of <xsl:value-of select="name(*/*)" />s</title>
			</head>
			<body background="Money.jpg">
				<h1 style="background-color: green; color: #FFFFFF; font-size: 20pt; text-align: center; letter-spacing: 1.0em">List of <xsl:value-of select="name(*/*)" />s</h1>
				<table align="center" border="2">
					<tr bgcolor="#446600">
						<th>
							<xsl:value-of select="name(*/*/@*)" />
						</th>
						<th>
							<xsl:value-of select="name(*/*/@*[2])" />
						</th>
						<th>
							<xsl:value-of select="name(*/*/@*[3])" />
						</th>
						<th>
							<xsl:value-of select="name(*/*/*)" />
						</th>
						<th>
							<xsl:value-of select="name(*/*/*[2])" />
						</th>
						<th>
							<xsl:value-of select="name(*/*/*[3])" />
						</th>
					</tr>
					<xsl:apply-templates />
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="/*/*">
		<tr>
			<td>
				<xsl:value-of select="@*[1]" />
			</td>
			<td>
				<xsl:value-of select="@*[2]" />
			</td>
			<td>
				<xsl:value-of select="@*[3]" />
			</td>
			<td>
				<xsl:value-of select="*[1]" />
			</td>
			<td>
				<xsl:value-of select="*[2]" />
			</td>
			<td>
				<xsl:value-of select="*[3]" />
			</td>
		</tr>

	</xsl:template>
</xsl:stylesheet>