function validateRegister() {
    var regUname = document.getElementById('regUname').value;
    var regEmail = document.getElementById('regEmail').value;
    var regPsw = document.getElementById('regPsw').value;
    var confirmPsw = document.getElementById('confirmPsw').value;
    localStorage.setItem('regUname', regUname);
    localStorage.setItem('regEmail', regEmail);
    localStorage.setItem('regPsw', regPsw);
    localStorage.setItem('confirmPsw', confirmPsw);
    if (regPsw != confirmPsw) {
        alert("Opps! your password is not the same. Please re-enter.");
        location.href = "login.aspx";
        return false;
    }
    else {
        alert("Successfully registered!! Thanks for registering an account at JD Sports!! Now you can login.");
        location.href = "login.aspx";
        return true;
    }
}

function validateLogin() {
    var username = document.getElementById('username').value;
    var password = document.getElementById('psw').value;
    if ((username != localStorage.getItem('regUname')) && (password != localStorage.getItem('regPsw'))) {
        alert("Login failed!!");
        location.href = "login.aspx";
        return false;
    }
    else {
        alert("Login successfully!! Welcome to JD Sports!!");
        location.href = "index.aspx";
        return true;
    }
}
function validateReset() {
    /*var email = document.getElementById('resetEmail').value;*/
    var newPsw = document.getElementById('resetPsw').value;
    var confirmNewPsw = document.getElementById('confirmNewPsw').value;
    if (newPsw != confirmNewPsw) {
        alert("Opps! your password is not the same. Please re-enter.");
        location.href = "resetPsw.aspx";
        return false;
    }
    //else if (email != localStorage.getItem('regEmail')) {
    //    alert("We're sorry, you have not register an account.");
    //    return false;
    //}
    else {
        alert("Successfully changed password!! Now you can login.");
        localStorage.setItem('regPsw', newPsw);
        location.href = "../aspx/login.aspx";
        return true;
    }
}