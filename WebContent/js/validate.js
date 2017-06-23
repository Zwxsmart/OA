//扩展easyui表单的验证  
$.extend($.fn.validatebox.defaults.rules, {  
	//身份证
    IDCard: {
        validator: function(value, param){
        	if(value.length >=18 && value.length<19){
        		var value1 = value.substring(0,17);
        		if(!isNaN(value1)){
        			return value;
        		}
        	}
        },
        message: "请输入正确的身份证号码"
    },
    //邮箱
    Email:{
    	validator: function(value, param){
    		var reg = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+(\.[a-zA-Z]{2,3})+$/;
    		reg.test(value);
    	},
        message: "请输入正确的邮箱"
    },
    //验证汉字  
    CHS: {  
        validator: function (value) {  
            return /^[\u0391-\uFFE5]+$/.test(value);  
        },  
        message: 'The input Chinese characters only.'  
    },  
    //手机号码验证  
    Mobile: {//value值为文本框中的值  
        validator: function (value) {  
            var reg = /^1[3,4,5,8]\d{9}$/;  
            return reg.test(value);  
        },  
        message: '请输入正确的手机号'  
    },  
    //国内邮编验证  
    ZipCode: {  
        validator: function (value) {  
            var reg = /^[0-9]\d{5}$/;  
            return reg.test(value);  
        },  
        message: 'The zip code must be 6 digits and 0 began.'  
    },  
  //数字  
    Number: {  
        validator: function (value) {  
            var reg =/^[0-9]*$/;  
            return reg.test(value);  
        },  
        message: 'Please input number.'  
    },  
})  