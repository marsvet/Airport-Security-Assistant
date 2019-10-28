function toggleUserDashboard() {
	let userDashboard = $("#header .user-dashboard");
	if (userDashboard.hasClass("show-user-dashboard"))
		userDashboard.removeClass("show-user-dashboard");
	else
		userDashboard.addClass("show-user-dashboard");
}

function verify_email() {
	let _email = $("#register-email-input-box").val();
	let verify_email_button = $("#verify_email_button");
	if (_email) {
		if (_email.match(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/)) {
			$.post("/_verify_email", { email: _email }, data => {
				verify_email_button.html("发送成功(60s)");
				verify_email_button.attr("disabled", true);
				verify_email_button.css("cursor", "no-drop");
				$("#hidden_verification_code_hash").val(data);
			});
			let timer = setInterval(() => {
				let currentTime = verify_email_button.html().match(/(?<=\().*?(?=s\))/);
				if (currentTime > 1) {
					verify_email_button.html(`发送成功(${currentTime - 1}s)`);
				} else {
					clearInterval(timer);
					verify_email_button.html("发送验证码");
					verify_email_button.attr("disabled", false);
					verify_email_button.css("cursor", "pointer");
				}
			}, 1000);
		} else {
			$("#register-email-input-box+span").html("邮箱格式不正确");
		}
	}
}
