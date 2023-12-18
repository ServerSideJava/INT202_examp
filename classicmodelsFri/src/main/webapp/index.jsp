<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Classic Model Online Shop</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    <style>
        .div-link {
            cursor: pointer;
            border: 1px burlywood solid;
        }

        .div-link:hover {
            background-color: bisque;
        }

        .cart-info {
            margin-left: -1em;
            border-radius: 12px;
            background-color: bisque;
            position: absolute;
            z-index: 100;
            border: none;
            padding-left: 5px;
            padding-right: 5px;
            display: none;
        }

    </style>
    <script>
        <%--function testAjax() {--%>
        <%--    //alert("This is test Ajax method")--%>
        <%--    let xhr = new XMLHttpRequest();--%>
        <%--    xhr.onload =() => {--%>
        <%--        if (xhr.status != 200) {--%>
        <%--            alert(`Error ${xhr.status}: ${xhr.statusText}`);--%>
        <%--        } else { // show the result--%>
        <%--            alert("Status" + xhr.status + "==> " + xhr.response);--%>
        <%--        }--%>
        <%--    };--%>
        <%--    xhr.open('GET', 'hello-servlet');--%>
        <%--    xhr.send();--%>
        <%--}--%>

        function loadProduct(page, pageSize = document.getElementById("itemsPage").value) {
            //alert('page: '+ page + ", size: "+ pageSize)
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = () => {
                setLoading('off')
                if (xhttp.status == 200) {
                    document.getElementById("body-content").innerHTML = xhttp.responseText;
                } else {
                    alert("Error: " + xhttp.status)
                }
            }
            xhttp.open("GET", "product-list?page=" + page + "&pageSize=" + pageSize);
            xhttp.send();
        }

        function loadOffice(officeCode) {
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = () => {
                setLoading('off')
                if (xhttp.status == 200) {
                    document.getElementById("body-content").innerHTML = xhttp.responseText;
                } else {
                    alert("Error: " + xhttp.status)
                }
            }
            xhttp.open("GET", "office-list?officeCode=" + officeCode);
            xhttp.send();
        }

        let thisContent = "";

        function setLoading(on_off) {
            let loading = document.getElementById("loading");
            if (on_off == 'on') {
                loading.classList.remove("d-none");
                loading.classList.add("d-inline");
            } else {
                loading.classList.remove("d-inline");
                loading.classList.add("d-none");
            }
        }

        function addToCart(productCode) {
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = () => {
                setLoading('off');
                cartInfo = document.getElementById("noOfItemInCart");
                noOfItem = xhttp.responseText;
                if (noOfItem > 0) {
                    cartInfo.style.display = 'inline'
                } else {
                    cartInfo.style.display = 'none'
                }
                cartInfo.innerHTML = noOfItem;
            }
            xhttp.open("GET", "add-to-cart?productCode=" + productCode);
            xhttp.send();
        }

        function viewCart() {
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = () => {
                setLoading('off');
                if (xhttp.status === 200) {
                    document.getElementById("view-cart").innerHTML = xhttp.responseText;
                    $('#viewCartModal').modal('show');
                } else {
                    alert("Login error" + xhttp.status + " --- " + xhttp.getResponseHeader("error"));
                }
            }
            xhttp.open("GET", "view_cart.jsp"); // need to write servlet
            xhttp.send();
        }

        function showLoginForm() {
            let menu = document.getElementById("login-menu").innerHTML;
            if (menu.includes('Logout')) {
                logout();
            } else {
                $('#modalLoginForm').modal('show');
            }
        }

        function logout() {
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                location.reload();
            }
            xhttp.open("GET", "logout");
            xhttp.send();
        }

        function login(userName, password) {
            if (userName == '' || password == '' || userName == undefined) {
                document.getElementById("login-message").innerHTML = "Invalid user name or password !!!";
                return;
            }
            setLoading('on');
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                if (xhttp.status == 200) {
                    $('#modalLoginForm').modal('hide');
                    document.getElementById("login-menu").innerHTML = "<i class='bi bi-box-arrow-left'></i> Logout"
                } else {
                    // alert("Login error" + xhttp.status + " --- " + xhttp.getResponseHeader("error"));
                    document.getElementById("login-message").innerHTML = xhttp.getResponseHeader("error")
                }
            }
            let urlEncodedData = "", urlEncodedDataPairs = [];
            urlEncodedDataPairs.push(encodeURIComponent("userName") + '=' + encodeURIComponent(userName));
            urlEncodedDataPairs.push(encodeURIComponent("password") + '=' + encodeURIComponent(password));
            urlEncodedData = urlEncodedDataPairs.join('&').replace(/%20/g, '+');
            xhttp.open("POST", "login");
            xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhttp.send(urlEncodedData);
        }

    </script>
</head>
<body>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand text-warning" href="javascript:void(0)">Classic Model</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadOffice('')">Office</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadProduct(1,15)">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">Order History</a>
                </li>
                <li class="nav-item ml-4">
                    <a class="nav-link text-light" href="javascript:showLoginForm()" id="login-menu"><i
                            class="bi bi-box-arrow-in-right"></i> Login</a>
                </li>
            </ul>
            <div style="margin-right: 20px">
                <img src="assets/images/cart.png" width="42" onclick="viewCart()"/>
                <button id="noOfItemInCart" class="cart-info" onclick="viewCart()"></button>
            </div>
            <form class="d-flex">
                <input id="searchBox" class="form-control me-2" type="text" placeholder="Search">
                <button class="btn btn-primary" type="button" onclick="search(thisContent)">Search</button>
            </form>
            </ul>
        </div>
    </div>
</nav>

<%--div-container--%>
<jsp:include page="WEB-INF/jsp/container.html"></jsp:include>

</body>

<%--loding--%>
<jsp:include page="WEB-INF/jsp/loading.html"></jsp:include>

<%--viewCart--%>
<jsp:include page="WEB-INF/jsp/view-cart.html"></jsp:include>

<%--login form--%>
<jsp:include page="WEB-INF/jsp/login-form.html" flush="true"></jsp:include>


</html>