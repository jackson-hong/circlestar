<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
	<meta charset="UTF-8">
	<title>nbbang</title>
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700,800">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
	<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
	<link href="<%=request.getContextPath()%>/css/section.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/footer.css" rel="stylesheet">
	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<style>
html,body {
  margin: 0;
  padding: 0;
  width: 100%;
  min-height: 100vh;
  background-color: #f2eee8;
  font-family: "Open Sans";
}

*,
*:before,
*:after {
  box-sizing: content-box;
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
}

.face {
  width: 300px;
  height: 300px;
  border: 4px solid #383a41;
  border-radius: 10px;
  background-color: #ffffff;
  margin: 0 auto;
  margin-top: 100px;
}
@media screen and (max-width: 400px) {
  .face {
    margin-top: 40px;
    -webkit-transform: scale(0.8);
            transform: scale(0.8);
  }
}
.face .band {
  width: 350px;
  height: 27px;
  border: 4px solid #383a41;
  border-radius: 5px;
  margin-left: -25px;
  margin-top: 50px;
}
.face .band .red {
  height: calc(100% / 3);
  width: 100%;
  background-color: #eb6d6d;
}
.face .band .white {
  height: calc(100% / 3);
  width: 100%;
  background-color: #ffffff;
}
.face .band .blue {
  height: calc(100% / 3);
  width: 100%;
  background-color: #5e7fdc;
}
.face .band:before {
  content: "";
  display: inline-block;
  height: 27px;
  width: 30px;
  background-color: rgba(255, 255, 255, 0.3);
  position: absolute;
  z-index: 999;
}
.face .band:after {
  content: "";
  display: inline-block;
  height: 27px;
  width: 30px;
  background-color: rgba(56, 58, 65, 0.3);
  position: absolute;
  z-index: 999;
  right: 0;
  margin-top: -27px;
}
.face .eyes {
  width: 128px;
  margin: 0 auto;
  margin-top: 40px;
}
.face .eyes:before {
  content: "";
  display: inline-block;
  width: 30px;
  height: 15px;
  border: 7px solid #383a41;
  margin-right: 20px;
  border-top-left-radius: 22px;
  border-top-right-radius: 22px;
  border-bottom: 0;
}
.face .eyes:after {
  content: "";
  display: inline-block;
  width: 30px;
  height: 15px;
  border: 7px solid #383a41;
  margin-left: 20px;
  border-top-left-radius: 22px;
  border-top-right-radius: 22px;
  border-bottom: 0;
}
.face .dimples {
  width: 180px;
  margin: 0 auto;
  margin-top: 15px;
}
.face .dimples:before {
  content: "";
  display: inline-block;
  width: 10px;
  height: 10px;
  margin-right: 80px;
  border-radius: 50%;
  background-color: rgba(235, 109, 109, 0.4);
}
.face .dimples:after {
  content: "";
  display: inline-block;
  width: 10px;
  height: 10px;
  margin-left: 80px;
  border-radius: 50%;
  background-color: rgba(235, 109, 109, 0.4);
}
.face .mouth {
  width: 40px;
  height: 5px;
  border-radius: 5px;
  background-color: #383a41;
  margin: 0 auto;
  margin-top: 25px;
}

h1 {
  font-weight: 800;
  color: #383a41;
  text-align: center;
  font-size: 2.5em;
  padding-top: 20px;
}
@media screen and (max-width: 400px) {
  h1 {
    padding-left: 20px;
    padding-right: 20px;
    font-size: 2em;
  }
}

.btn {
  font-family: "Open Sans";
  font-weight: 400;
  padding: 20px;
  background-color: #5e7fdc;
  color: white;
  width: 320px;
  margin: 0 auto;
  text-align: center;
  font-size: 1.2em;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 80px;
  margin-bottom: 50px;
  -webkit-transition: all 0.2s linear;
  transition: all 0.2s linear;
}
@media screen and (max-width: 400px) {
  .btn {
    margin: 0 auto;
    margin-top: 60px;
    margin-bottom: 50px;
    width: 200px;
  }
}
.btn:hover {
  background-color: rgba(94, 127, 220, 0.8);
  -webkit-transition: all 0.2s linear;
  transition: all 0.2s linear;
}
</style>
</head>
<body>
	<div class="face">
	<div class="band">
		<div class="red"></div>
		<div class="white"></div>
		<div class="blue"></div>
	</div>
	<div class="eyes"></div>
	<div class="dimples"></div>
	<div class="mouth"></div>
</div>

<h1>404 : 페이지를 찾을 수 없습니다.</h1>
</body>
<script>
</script>
</html>