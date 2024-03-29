<c:set var="userBean" value="${sessionScope.user}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    
    <title>PainCare</title>
    
    <!-- Fav Icon -->
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
    
    <!-- Google Fonts -->
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Rubik:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    
    <!-- Stylesheets -->
    <link href="assets/css/variables.css" rel="stylesheet">
    <link href="assets/css/font-awesome-all.css" rel="stylesheet">
    <link href="assets/css/owl.css" rel="stylesheet">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/animate.css" rel="stylesheet">
    <link href="assets/css/color.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet">
    <link href="assets/css/main.css" rel="stylesheet">

    <c:if test="${not empty css_links}">
        <c:forEach var="cssLink" items="${css_links}">
            <link rel="stylesheet" href="${cssLink}">
        </c:forEach>
    </c:if>
</head>
<body class="boxed_wrapper">

    <!-- preloader -->
    <div class="preloader">
        <div id="handle-preloader" class="handle-preloader">
            <div class="animation-preloader">
                <div class="spinner"></div>
                <div class="txt-loading">
                    <span data-text-preloader="P" class="letters-loading">
                        P
                    </span>
                    <span data-text-preloader="a" class="letters-loading">
                        a
                    </span>
                    <span data-text-preloader="i" class="letters-loading">
                        i
                    </span>
                    <span data-text-preloader="n" class="letters-loading">
                        n
                    </span>
                    <span data-text-preloader="C" class="letters-loading" style="color:black">
                        C
                    </span>
                   
                    <span data-text-preloader="a" class="letters-loading" style="color:black">
                        a
                    </span>
                    <span data-text-preloader="r" class="letters-loading" style="color:black">
                        r
                    </span>
                      <span data-text-preloader="E" class="letters-loading" style="color:black">
                        e
                    </span>
                </div>
            </div>  
        </div>
    </div>
    <!-- preloader end -->