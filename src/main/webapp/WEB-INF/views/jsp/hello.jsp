<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MyLib</title>
 
<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>
 
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
	<div class="navbar-header">
		<a class="navbar-brand" href="#">MyLib Project Ver1.1</a>
	</div>
  </div>
</nav>
 
<div class="jumbotron">
  <div class="container">
	<h1>${title}</h1>
	<p>
		<c:if test="${not empty name}">
			Hello ${name}
		</c:if>
 
		<c:if test="${empty name}">
			Welcome Welcome!
		</c:if>
    </p>
    <p>
		<a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
		
	</p>
	</div>
</div>
 
<div class="container">
 
  <div class="row">
	<div class="col-md-4">
		<h2>Request For Approval</h2>
		
		<p>
			<a class="btn btn-default" href="#" role="button">Send Request</a>
			<a id="myLink" title="Click to do something" href="PleaseEnableJavascript.html" onclick="onButtonClick();return false;">link text</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>Open Door</h2>
		
		<p>
			<a class="btn btn-default" href="#" role="button">Open Door</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>Lock Door</h2>
		
		<p>
			<a class="btn btn-default" href="#" role="button">Lock Door</a>
		</p>
	</div>
  </div>
 
 
  <hr>
  
</div>
 
<spring:url value="/resources/core/css/hello.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />
 
<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">
    function onButtonClick() {
	
  alert("Hi");
  
  let filters = [];

  let filterService = document.querySelector('#service').value;
  if (filterService.startsWith('0x')) {
    filterService = parseInt(filterService);
  }
  if (filterService) {
    filters.push({services: [filterService]});
  }

  let filterName = document.querySelector('#name').value;
  if (filterName) {
    filters.push({name: filterName});
  }

  let filterNamePrefix = document.querySelector('#namePrefix').value;
  if (filterNamePrefix) {
    filters.push({namePrefix: filterNamePrefix});
  }

  let options = {};
  if (document.querySelector('#allDevices').checked) {
    options.acceptAllDevices = true;
  } else {
    options.filters = filters;
  }

  log('Requesting Bluetooth Device...');
  log('with ' + JSON.stringify(options));
  navigator.bluetooth.requestDevice(options)
  .then(device => {
    log('> Name:             ' + device.name);
    log('> Id:               ' + device.id);
    log('> Connected:        ' + device.gatt.connected);
  })
  .catch(error => {
    log('Argh! ' + error);
  });
}
</script>
 
</body>
</html>	