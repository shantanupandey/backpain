<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 

<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript">

function newSite() {
    var sites = ['https://www.charitycheckout.co.uk/285265/']
    
    document.getElementById('myIframe').src = sites[Math.floor(Math.random() * sites.length)];
}
</script>
<body>
<iframe style="width:100%; height:100%; border: none;" id="myIframe" src="https://www.charitycheckout.co.uk/285265/" onLoad="iframeDidLoad();"></iframe>
</body>
</html> 