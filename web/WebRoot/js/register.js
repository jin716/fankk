var r_p="";
var TB = YAHOO.namespace("TB");
YAHOO.namespace("TB.app.reg");
(function () {
	var D = YAHOO.util.Dom, E = YAHOO.util.Event, CE = YAHOO.util.CustomEvent;
	var MSG_TYPE_ATTENTION = "attention", MSG_TYPE_ERROR = "error", MSG_TYPE_OK = "ok", MSG_TYPE_TIPS = "tips", MSG_TYPES = [MSG_TYPE_ATTENTION, MSG_TYPE_ERROR, MSG_TYPE_OK, MSG_TYPE_TIPS];
	TB.app.reg.CONSTANTS = {};
	TB.app.reg.AbstractField = function (el, config) {
		this.field = D.get(el);
		this.input = D.getElementsByClassName("J_Field", "input", this.field)[0];
		this.msg = D.getElementsByClassName("msg", "div", this.field)[0];
		this.config = config ? config : {};
		for (var i = 0, len = MSG_TYPES.length; i < len; i++) {
			var type = MSG_TYPES[i];
			if (D.hasClass(this.msg, "show-" + type)) {
				this.currentMsgType = type;
				break;
			}
		}
		this.currentValue = this.input.value;
		this.events = {};
		this.events.valueChangeEvent = new CE("valueChange", this);
		this.events.validateEvent = new CE("validate", this);
		E.on(this.input, "focus", function () {
			var self = this;
			setTimeout(function () {
				D.addClass(self.field, "hover");
			}, 200);
		}, this, true);
		E.on(this.input, "blur", function () {
			var self = this;
			setTimeout(function () {
				D.removeClass(self.field, "hover");
				var value = TB.common.trim(self.input.value);
				if (self.currentValue !== value) {
					self.events.valueChangeEvent.fire(value, self.currentValue);
					self.currentValue = value;
					self.validate();
				}
			}, 200);
		}, this, true);
		this.events.validateEvent.subscribe(function (eventType, args) {
			if (args[0] === MSG_TYPE_ERROR) {
				D.addClass(this.input, "error");
			} else {
				D.removeClass(this.input, "error");
			}
		});
	};
	TB.app.reg.AbstractField.prototype = {showMsg:function (type, text) {
		if (this.msg && text) {
			text = TB.app.reg.CONSTANTS[text] || text;
			D.getElementsByClassName(type, "p", this.msg)[0].innerHTML = text;
		}
		D.replaceClass(this.msg, "show-" + this.currentMsgType, "show-" + type);
		this.currentMsgType = type;
	}, validate:function () {
		var value = this.currentValue;
		if (value !== "") {
			try {
				if (this.localValidate) {
					this.localValidate(value);
				}
				if (this.config.remoteValidateUrl) {
					this.remoteValidate(value);
				} else {
					this.showMsg(MSG_TYPE_OK);
					this.events.validateEvent.fire(MSG_TYPE_OK);
				}
			}
			catch (text) {
				this.showMsg(MSG_TYPE_ERROR, text);
				this.events.validateEvent.fire(MSG_TYPE_ERROR, text);
			}
		} else {
			this.showMsg(MSG_TYPE_ATTENTION);
			this.events.validateEvent.fire(MSG_TYPE_ATTENTION);
		}
	}, localValidate:false, remoteValidate:function (value) {
		var self = this;
		var callback = function (data) {
			var result = eval("(" + data.responseText + ")");
			var validateSuccess = function () {
				self.showMsg(MSG_TYPE_OK);
				self.remoteValidateSuccess(result);
				self.events.validateEvent.fire(MSG_TYPE_OK);
			};
			var validateFailure = function () {
				self.showMsg(MSG_TYPE_ERROR, result.reason);
				self.remoteValidateFailure(result);
				self.events.validateEvent.fire(MSG_TYPE_ERROR, result.reason);
			};
			if (result.success) {
				validateSuccess();
			} else {
				if (result.reason === "UNKNOWN") {
					validateSuccess();
				} else {
					validateFailure();
				}
			}
		};
		var failure = function () {
			self.showMsg(MSG_TYPE_OK);
			self.events.validateEvent.fire(MSG_TYPE_OK);
		};
		var params = TB.app.reg.Utils.toParamString(this.remoteValidateQueryObjFn(value));
		YAHOO.util.Connect.asyncRequest("post", this.config.remoteValidateUrl + "?_input_charset=utf-8", {success:callback, failure:failure, cache:false, timeout:2000}, params);
	}, remoteValidateQueryObjFn:false, remoteValidateSuccess:function (result) {
	}, remoteValidateFailure:function (result) {
	}};
	TB.app.reg.UserNameField = function (el, config) {
		TB.app.reg.UserNameField.superclass.constructor.call(this, el, config);
		this.showChouter();
		E.on(this.input, "keyup", function () {
			this.showChouter();
		}, this, true);
		this.events.valueChangeEvent.subscribe(function (eventType, args) {
			if (args[0] === "") {
				D.setStyle("another-name", "display", "none");
			}
		});
	};
	YAHOO.extend(TB.app.reg.UserNameField, TB.app.reg.AbstractField, {showChouter:function () {
		if (!this.counter) {
			this.counter = D.getElementsByClassName("J_CharCounter", "div", this.field)[0];
			this.counterNum = D.getElementsByClassName("num", "span", this.counter)[0];
		}
		var value = TB.common.trim(this.input.value);
		if (value === "") {
			D.setStyle(this.counter, "display", "none");
		} else {
			var len = TB.app.reg.Utils.getCharCount(value);
			this.counterNum.innerHTML = len;
			D.setStyle(this.counter, "display", "block");
		}
	}, localValidate:function (userName) {
		var len = parseInt(this.counterNum.innerHTML);
		if (len < 4 || len > 20) {
			throw "\u4f1a\u5458\u540d\u57284-20\u4e2a\u5b57\u7b26\u5185";
		} else {
			if (/^\d*$/.test(userName)) {
				throw "\u4f1a\u5458\u540d\u4e0d\u80fd\u5168\u4e3a\u6570\u5b57";
			} else {
				if (/\.\.|--|__|\uff0d|\uff3f|\u203b|\u25b2|\u25b3|\u3000| /.test(userName)) {
					throw "\u975e\u6cd5\u7684\u4f1a\u5458\u540d";
				}
			}
		}
	}, remoteValidateQueryObjFn:function (userName) {
		return {nick:userName};
	}, remoteValidateSuccess:function (result) {
		D.setStyle("another-name", "display", "none");
	}, remoteValidateFailure:function (result) {
		if (!result.commandNick || result.commandNick.length == 0) {
			return;
		}
		var tpl = "<li><input type=\"radio\" name=\"another-name\" value=\"{0}\" id=\"anothor-name-{1}\" /><label for=\"anothor-name-{1}\">{0}</label></li>";
		var inner = "";
		for (var i = 0, len = result.commandNick.length; i < len; i++) {
			inner += tpl.replace(/\{0\}/g, result.commandNick[i]).replace(/\{1\}/g, i);
		}
		var container = D.get("another-name").getElementsByTagName("ul")[0];
		container.innerHTML = inner;
		D.setStyle("another-name", "display", "block");
		E.on(container.getElementsByTagName("input"), "click", function (evt) {
			var radio = E.getTarget(evt);
			this.input.value = radio.value;
			this.currentValue = radio.value;
			this.showMsg(MSG_TYPE_OK);
			this.events.validateEvent.fire(MSG_TYPE_OK);
			D.removeClass(this.input, "error");
			this.input.focus();
			this.showChouter();
		}, this, true);
	}});
	TB.app.reg.EmailField = function (el, config) {
		TB.app.reg.EmailField.superclass.constructor.call(this, el, config);
		this.alipay = config ? D.get(config.alipay) : null;
		this.canDisabledAlipay = config ? config.canDisabledAlipay : false;
	};
	YAHOO.extend(TB.app.reg.EmailField, TB.app.reg.AbstractField, {localValidate:function (email) {
		var pattern = /^[_a-zA-Z0-9\-]+(\.[_a-zA-Z0-9\-]*)*@[a-zA-Z0-9\-]+([\.][a-zA-Z0-9\-]+)+$/;
		if (email.length > 60) {
			throw "\u90ae\u7bb1\u540d\u957f\u5ea6\u8fc7\u5927\uff0c\u8bf7\u51cf\u5c11\u523060\u4e2a\u5b57\u7b26\u4ee5\u5185";
		} else {
			if (!pattern.test(email)) {
				throw "ERROR_MALFORM_EMAIL";
			}
			//
		var html="";
		html=jQuery.ajax({
		   async:false,
		   type: "GET",
		   url: "check.do",
		   data: "type=email&value="+email
		}).responseText; 
		
	
		if (html=="false") throw "ERROR_DUP_EMAIL";

		}
	}});
	TB.app.reg.PhoneField = function (el, config) {
		TB.app.reg.PhoneField.superclass.constructor.call(this, el, config);
		this.alipay = config ? D.get(config.alipay) : null;
		this.canDisabledAlipay = config ? config.canDisabledAlipay : false;
	};
	
	
	YAHOO.extend(TB.app.reg.PhoneField, TB.app.reg.AbstractField, {localValidate:function (phone) {
		var pattern = /(^1[358]{1}[0-9]{9}$)|(^[0-9]{8}$)/;
		if (!pattern.test(phone)) {
			throw "ERROR_MALFORM_MOBILE";
		}
		//验证手机号码唯一性
		var html="";
		html=jQuery.ajax({
		   async:false,
		   type: "GET",
		   url: "check.do",
		   data: "type=phone&value="+phone
		}).responseText; 
		
	
		if (html=="false") throw "ERROR_CELLPHONE_EXISTED";
			

	}});
	TB.app.reg.PasswordField = function (el, config) {
		TB.app.reg.PasswordField.superclass.constructor.call(this, el, config);
		new YAHOO.util.KeyListener(this.input, {ctrl:true, keys:86}, {fn:function (type, arg) {
			$E.preventDefault(arg[1]);
		}}).enable();
	};
	YAHOO.extend(TB.app.reg.PasswordField, TB.app.reg.AbstractField, {addRepeatFiled:function (passwordField) {
		this.repeatField = passwordField;
		passwordField.firstField = this;
	}, localValidate:function (password) {
		var repeatErrorText = "ERROR_PASSWORD_NOT_MATCH";
		if (this.repeatField) {
			var rpw = this.repeatField.input.value;
			if (rpw !== "") {
				if (password !== rpw) {
					this.repeatField.showMsg(MSG_TYPE_ERROR, repeatErrorText);
					this.repeatField.events.validateEvent.fire(MSG_TYPE_ERROR, repeatErrorText);
				} else {
					this.repeatField.showMsg(MSG_TYPE_OK);
					this.repeatField.events.validateEvent.fire(MSG_TYPE_OK);
				}
			} else {
				this.repeatField.showMsg(MSG_TYPE_ATTENTION);
				this.repeatField.events.validateEvent.fire(MSG_TYPE_ATTENTION);
			}
		} else {
			if (this.firstField) {
				var fpw = this.firstField.input.value;
				if (password != "" && password !== fpw) {
					throw repeatErrorText;
				}
			}
		}
		if (password.length < 6) {
			throw "\u5bc6\u7801\u57286-16\u4e2a\u5b57\u7b26\u5185";
		} else {
			//if (/^\d*$/.test(password)) {
			//	throw "\u5bc6\u7801\u4e0d\u80fd\u5168\u4e3a\u6570\u5b57";
			//}
		}
	}});
	TB.app.reg.SubmitBtn = function (el, fields) {
		this.btn = D.get(el);
		this.fields = fields;
		this.validateResult = {};
		var self = this;
		var changeBtnDisabledStatus = function (status) {
			setTimeout(function () {
				self.btn.disabled = status;
			}, 100);
		};
		var fieldValidListener = function (eventType, args) {
			var type = args[0];
			if (type === MSG_TYPE_OK) {
				self.validateResult[this.field.id] = true;
				for (var key in self.validateResult) {
					if (!self.validateResult[key]) {
						changeBtnDisabledStatus(true);
						D.addClass(self.btn, "disabled");
						return;
					}
				}
				changeBtnDisabledStatus(false);
				D.removeClass(self.btn, "disabled");
			} else {
				self.validateResult[this.field.id] = false;
				changeBtnDisabledStatus(true);
				D.addClass(self.btn, "disabled");
			}
		};
		for (var i = 0, len = fields.length; i < len; i++) {
			var fieldObj = fields[i];
			this.validateResult[fieldObj.field.id] = false;
			fieldObj.events.validateEvent.subscribe(fieldValidListener);
		}
	};
	TB.app.reg.SubmitBtn.prototype = {validateFields:function () {
		for (var i = 0, len = this.fields.length; i < len; i++) {
			this.fields[i].validate();
		}
	}, initValidateStatus:function () {
		for (var i = 0, len = this.fields.length; i < len; i++) {
			var fieldEl = this.fields[i];
			if (D.hasClass(fieldEl.msg, "show-ok") || D.hasClass(fieldEl.msg, "show-tips")) {
				this.validateResult[fieldEl.field.id] = true;
			}
		}
	}};
	TB.app.reg.PasswordStatus = function (el, passwordField) {
		this.status = D.get(el);
		this.bar = D.getElementsByClassName("status-bar", "span", this.status)[0].childNodes[0];
		this.result = D.getElementsByClassName("status-result", "span", this.status)[0];
		this.passwordField = passwordField;
		this.resultValue = D.getElementsByClassName("J_ResultValue", "input", this.status)[0];
		E.on(passwordField.input, "keyup", this.check, this, true);
		TB.widget.SimplePopup.decorate("J_StatusTipTrigger", "J_StatusTip", {position:"bottom", offset:[TB.bom.isIE ? (TB.bom.isIE6 ? -3 : 2) : 1, 0]});
	};
	TB.app.reg.PasswordStatus.prototype = {check:function () {
		var value = this.passwordField.input.value;
		if (value === "") {
			D.setStyle(this.status, "display", "none");
			this.resultValue.value = "";
		} else {
			var score = TB.app.reg.Utils.gCheckPassword(value);
			D.setStyle(this.bar, "width", score + "%");
			var resultDesp = TB.app.reg.Utils.getResultDesp(score);
			this.result.innerHTML = resultDesp;
			this.resultValue.value = {"\u5f31":1, "\u4e2d":2, "\u5f3a":3}[resultDesp];
			D.setStyle(this.status, "display", "block");
		}
	}};
	TB.app.reg.EmailRegPage = {initialize:function (config) {
		E.onDOMReady(function () {
			var userNameField = new TB.app.reg.UserNameField("J_UserNameField", {remoteValidateUrl:config.userNameValidateUrl});
			var emailField = new TB.app.reg.EmailField("J_EmailField", {remoteValidateUrl:config.emailValidateUrl, alipay:"create-alipay", canDisabledAlipay:config.alipay});
			userNameField.remoteValidateQueryObjFn = function (userName) {
				return {nick:userName, email:emailField.input.value, type:1};
			};
			var passwordField = new TB.app.reg.PasswordField("J_PasswordField", {remoteValidateUrl:config.passwordValidateUrl});
			passwordField.remoteValidateQueryObjFn = function (password) {
				return {nick:userNameField.input.value, password:password};
			};
			var rePasswordField = new TB.app.reg.PasswordField("J_RePasswordField");
			passwordField.addRepeatFiled(rePasswordField);
			/**
			var btn = new TB.app.reg.SubmitBtn("J_SubmitBtn", [userNameField, emailField, passwordField, rePasswordField]);
			if (config.validateOnInit) {
				btn.validateFields();
			} else {
				btn.initValidateStatus();
			}
			*/
			var passwordStatus = new TB.app.reg.PasswordStatus("J_PasswordStatus", passwordField);
			passwordStatus.check();
			E.on("J_ChangeCodeImg", "click", function (evt) {
				E.preventDefault(evt);
				D.get("J_CheckCode").src = config.checkCodeUrl + "&r=" + new Date().getTime();
			});
			emailField.input.focus();
		});
	}};
	TB.app.reg.PhoneRegPage = {initialize:function (config) {
		E.onDOMReady(function () {
			var userNameField = new TB.app.reg.UserNameField("J_UserNameField", {remoteValidateUrl:config.userNameValidateUrl});
			var phoneField = new TB.app.reg.PhoneField("J_PhoneField", {remoteValidateUrl:config.phoneValidateUrl, alipay:"create-alipay", canDisabledAlipay:config.alipay});
			var emailField = new TB.app.reg.EmailField("J_EmailField", {remoteValidateUrl:config.emailValidateUrl});
			userNameField.remoteValidateQueryObjFn = function (userName) {
				return {nick:userName, phone:phoneField.input.value, type:2};
			};
			var passwordField = new TB.app.reg.PasswordField("J_PasswordField", {remoteValidateUrl:config.passwordValidateUrl});
			passwordField.remoteValidateQueryObjFn = function (password) {
				return {nick:userNameField.input.value, password:password};
			};
			var remoteValidateUrl = new TB.app.reg.PasswordField("J_RePasswordField");
			passwordField.addRepeatFiled(remoteValidateUrl);
			var passwordStatus = new TB.app.reg.PasswordStatus("J_PasswordStatus", passwordField);
			passwordStatus.check();
			
			var btn = new TB.app.reg.SubmitBtn("J_SubmitBtn", [userNameField, phoneField, emailField, passwordField, remoteValidateUrl]);
			if (config.validateOnInit) {
				btn.validateFields();
			} else {
				btn.initValidateStatus();
			}
			
			E.on("J_ChangeCodeImg", "click", function (evt) {
				E.preventDefault(evt);
				D.get("J_CheckCode").src = config.checkCodeUrl + "&r=" + new Date().getTime();
			});
			phoneField.input.focus();
		});
	}};
	TB.app.reg.CheckEmailPage = {initialize:function (config) {
		E.onDOMReady(function () {
			var activationEmail = D.get("J_ActivationEmail"), changeEmail = D.get("J_ChangeEmail");
			E.on(activationEmail, "click", function () {
				var self = this;
				YAHOO.util.Connect.asyncRequest("post", config.activationUrl + "?_input_charset=utf-8", {cache:false, success:function (data) {
					var result = eval("(" + data.responseText + ")");
					if (result.success) {
						activationEmail.innerHTML = "\u53d1\u9001\u6210\u529f";
					} else {
						activationEmail.innerHTML = TB.app.reg.CONSTANTS[result.reason] || result.reason;
					}
					D.addClass(activationEmail, "inactive");
					E.removeListener(activationEmail, self.callee);
				}}, TB.app.reg.Utils.toParamString({userId:D.get("J_UserId").value}));
			});
			var changeEmailDialog;
			var showChangeEmailDialog = function () {
				if (!changeEmailDialog) {
					var loader = new YAHOO.util.YUILoader({require:["container"], base:"http://a.tbcdn.cn/yui/2.7.0/build/", onSuccess:function () {
						changeEmailDialog = new YAHOO.widget.Panel("J_ChangeEmailDialog", {modal:true, draggable:false, close:false});
						changeEmailDialog.render();
						D.setStyle("J_ChangeEmailDialog", "display", "block");
						changeEmailDialog.center();
						changeEmailDialog.cfg.setProperty("y", 220);
						changeEmailDialog.show();
						D.get("J_EmailAddress").focus();
					}});
					loader.insert();
				} else {
					changeEmailDialog.show();
					D.get("J_EmailAddress").focus();
				}
			};
			if (D.getElementsByClassName("show-error", "div", "J_ChangeEmailField")[0]) {
				showChangeEmailDialog();
			}
			E.on(changeEmail, "click", showChangeEmailDialog);
			E.on(["J_DialogClose", "J_DialogCancel"], "click", function () {
				D.get("J_EmailAddress").value = "";
				emailField.currentValue = "";
				D.replaceClass(emailField.msg, "show-error", "show-attention");
				emailField.currentMsgType = "attention";
				changeEmailDialog.hide();
			});
			var emailField = new TB.app.reg.EmailField("J_ChangeEmailField");
		});
	}};
	TB.app.reg.CheckPhonePage = {initialize:function (config) {
		E.on("J_Code", "focus", function () {
			D.addClass("J_CodeFiled", "hover");
		});
		E.on("J_Code", "blur", function () {
			D.removeClass("J_CodeFiled", "hover");
		});
		var sendCodeBtn = D.get("J_ReSendCode");
		var timer;
		var countDown = function () {
			sendCodeBtn.disabled = true;
			var time = 60;
			timer = setInterval(function () {
				time--;
				if (time !== 0) {
					sendCodeBtn.innerHTML = "\u5728" + time + "\u79d2\u540e\u70b9\u6b64\u91cd\u53d1";
				} else {
					sendCodeBtn.innerHTML = "\u91cd\u65b0\u53d1\u9001\u624b\u673a\u9a8c\u8bc1\u7801";
					sendCodeBtn.disabled = false;
					clearTimeout(timer);
				}
			}, 1000);
		};
		/**
		E.on(sendCodeBtn, "click", function (evt) {
			E.stopEvent(evt);
			countDown();
			YAHOO.util.Connect.asyncRequest("post", config.activationUrl + "?_input_charset=utf-8", {cache:false, success:function (data) {
				var result = eval("(" + data.responseText + ")");
				D.setStyle("J_SendCodeMsg", "display", "block");
				if (result.success) {
					D.replaceClass("J_SendCodeMsg", "show-error", "show-attention");
				} else {
					D.getElementsByClassName("error", "p", "J_SendCodeMsg")[0].innerHTML = TB.app.reg.CONSTANTS[result.reason] || result.reason;
					D.replaceClass("J_SendCodeMsg", "show-attention", "show-error");
					sendCodeBtn.disabled = true;
					clearTimeout(timer);
					sendCodeBtn.innerHTML = "\u91cd\u65b0\u53d1\u9001\u624b\u673a\u9a8c\u8bc1\u7801";
				}
			}}, TB.app.reg.Utils.toParamString({userId:D.get("J_UserId").value}));
		});
		*/
		if (config.enableCountDown) {
			countDown();
		} else {
			sendCodeBtn.innerHTML = "\u91cd\u65b0\u53d1\u9001\u624b\u673a\u9a8c\u8bc1\u7801";
		}
		D.get("J_Code").focus();
		var changePhoneDialog;
		var showChangePhoneDialog = function () {
			if (!changePhoneDialog) {
				var loader = new YAHOO.util.YUILoader({require:["container"], base:"http://a.tbcdn.cn/yui/2.7.0/build/", onSuccess:function () {
					changePhoneDialog = new YAHOO.widget.Panel("J_ChangePhoneDialog", {modal:true, draggable:false, close:false});
					changePhoneDialog.render();
					D.setStyle("J_ChangePhoneDialog", "display", "block");
					changePhoneDialog.center();
					changePhoneDialog.cfg.setProperty("y", 150);
					changePhoneDialog.show();
					D.get("J_PhoneNumber").focus();
				}});
				loader.insert();
			} else {
				changePhoneDialog.show();
				D.get("J_PhoneNumber").focus();
			}
		};
		if (D.getElementsByClassName("show-error", "div", "J_ChangePhoneField")[0]) {
			showChangePhoneDialog();
		}
		E.on("J_ChangePhone", "click", showChangePhoneDialog);
		E.on(["J_DialogClose", "J_DialogCancel"], "click", function () {
			D.get("J_PhoneNumber").value = "";
			phoneField.currentValue = "";
			D.replaceClass(phoneField.msg, "show-error", "show-attention");
			phoneField.currentMsgType = "attention";
			changePhoneDialog.hide();
		});
		var phoneField = new TB.app.reg.PhoneField("J_ChangePhoneField");
		E.on("J_CheckNumber", "click", function () {
			phoneField.config.remoteValidateUrl = config.phoneValidateUrl;
			phoneField.validate();
			phoneField.config.remoteValidateUrl = null;
		});
	}};
	TB.app.reg.Utils = {getCharCount:function (str) {
		var sum = 0;
		for (var i = 0, len = str.length; i < len; i++) {
			if ((str.charCodeAt(i) >= 0) && (str.charCodeAt(i) <= 255)) {
				sum = sum + 1;
			} else {
				sum = sum + 2;
			}
		}
		return sum;
	}, toParamString:function (obj) {
		var result = [];
		for (var key in obj) {
			var value = obj[key];
			if (YAHOO.lang.isArray(value)) {
				for (var i = 0; i < value.length; i++) {
					result.push(encodeURIComponent(key) + "=" + encodeURIComponent(value[i]));
				}
			} else {
				result.push(encodeURIComponent(key) + "=" + encodeURIComponent(value));
			}
		}
		return result.join("&");
	}, gCheckPassword:function (password) {
		var _score = 0;
		if (!password) {
			return 0;
		}
		if (password.length <= 4) {
			_score += 5;
		} else {
			if (password.length >= 5 && password.length <= 7) {
				_score += 10;
			} else {
				if (password.length >= 8) {
					_score += 25;
				}
			}
		}
		var _UpperCount = (password.match(/[A-Z]/g) || []).length;
		var _LowerCount = (password.match(/[a-z]/g) || []).length;
		var _LowerUpperCount = _UpperCount + _LowerCount;
		if (_UpperCount && _LowerCount) {
			_score += 20;
		} else {
			if (_UpperCount || _LowerCount) {
				_score += 10;
			}
		}
		var _NumberCount = (password.match(/[\d]/g, "") || []).length;
		if (_NumberCount > 0 && _NumberCount <= 2) {
			_score += 10;
		} else {
			if (_NumberCount >= 3) {
				_score += 20;
			}
		}
		var _CharacterCount = (password.match(/[!@#$%^&*?_\.\-~]/g) || []).length;
		if (_CharacterCount == 1) {
			_score += 10;
		} else {
			if (_CharacterCount > 1) {
				_score += 25;
			}
		}
		if (_NumberCount && _LowerUpperCount) {
			_score += 2;
		} else {
			if (_NumberCount && _LowerUpperCount && _CharacterCount) {
				_score += 3;
			} else {
				if (_NumberCount && (_UpperCount && _LowerCount) && _CharacterCount) {
					_score += 5;
				}
			}
		}
		return _score;
	}, getResultDesp:function (score) {
		if (score <= 5) {
			return "\u592a\u77ed";
		} else {
			if (score > 5 && score <= 20) {
				return "\u5f31";
			} else {
				if (score > 20 && score < 60) {
					return "\u4e2d";
				} else {
					if (score >= 60) {
						return "\u5f3a";
					} else {
						return "";
					}
				}
			}
		}
	}};
})();

