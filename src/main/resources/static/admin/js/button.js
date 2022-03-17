let index = {
	init: function(){
		$("#eReturnCompleteBtn").on("click", () => {
			this.returns();
		});
		
		$("#eRefundComplete").on("click", () => {
			this.refund();
		});
		
		$("#ePaymentOkBtn").on("click", () => {
			this.pOk();
		});
		
		$("#ePaymentCancelBtn").on("click", () => {
			this.pCancle();
		});
		
		$("#eShipStartBtn").on("click", () => {
			this.sStart();
		});
		
		$("#eMoveShipBegin").on("click", () => {
			this.sBegin();
		});
		
		$("#eShippedStandByBtn").on("click", () => {
			this.sStandBy();
		});
		
		$("#eShippedEndBtn").on("click", () => {
			this.sEnd();
		});
	},
	
	returns: function(){
		console.log("returns");
		var checkbox = $("input[id=allChk]:checked");
		var row = checkbox.parent().parent();
		var colume = row.children();
		
		var ocode = colume.eq(3).text();
		var ocodeObj = new Object;
		ocodeObj.ocode = ocode;
		
		console.log("ocode : " + ocode);
		console.log(ocodeObj);
		
		$.ajax({
			type: "put",
			url: "/admin/api/returns",
			dataType: "json",
			data: ocodeObj
		}).done(function(resp) {
			console.log(resp);
			alert("성공");
			location.reload();
		}).fail(function(error) {
			alert("실패");
		});
	},
	
	refund: function(){
		console.log("refund");
		var checkbox = $("input[id=allChk]:checked");
		var row = checkbox.parent().parent();
		var colume = row.children();
		
		var ocode = colume.eq(4).text();
		var ocodeObj = new Object;
		ocodeObj.ocode = ocode;
		
		console.log("ocode : " + ocode);
		console.log(ocodeObj);
		
		$.ajax({
			type: "put",
			url: "/admin/api/refund",
			dataType: "json",
			data: ocodeObj
		}).done(function(resp) {
			console.log(resp);
			alert("성공");
			location.reload();
		}).fail(function(error) {
			alert("실패");
		});
	},
	
	pOk: function(){
		console.log("pOk");
		var checkbox = $("input[id=allChk]:checked");
		var row = checkbox.parent().parent();
		var colume = row.children();
		
		var ocode = colume.eq(3).text();
		var ocodeObj = new Object;
		ocodeObj.ocode = ocode;
		
		console.log("ocode : " + ocode);
		console.log(ocodeObj);
		
		$.ajax({
			type: "put",
			url: "/admin/api/pOk",
			dataType: "json",
			data: ocodeObj
		}).done(function(resp) {
			console.log(resp);
			alert("성공");
			location.reload();
		}).fail(function(error) {
			alert("실패");
		});
	},
	
	pCancle: function(){
		console.log("pCancle");
		var checkbox = $("input[id=allChk]:checked");
		var row = checkbox.parent().parent();
		var colume = row.children();
		
		var ocode = colume.eq(3).text();
		var ocodeObj = new Object;
		ocodeObj.ocode = ocode;
		
		console.log("ocode : " + ocode);
		console.log(ocodeObj);
		
		$.ajax({
			type: "put",
			url: "/admin/api/pCancle",
			dataType: "json",
			data: ocodeObj
		}).done(function(resp) {
			console.log(resp);
			alert("성공");
			location.reload();
		}).fail(function(error) {
			alert(error);
		});
	},
	
	sStart: function(){
		console.log("sStart");
		var checkbox = $("input[id=allChk]:checked");
		var row = checkbox.parent().parent();
		var colume = row.children();
		
		var ocode = colume.eq(2).text();
		var ocodeObj = new Object;
		ocodeObj.ocode = ocode;
		
		console.log("ocode : " + ocode);
		console.log(ocodeObj);
		
		$.ajax({
			type: "put",
			url: "/admin/api/sStart",
			dataType: "json",
			data: ocodeObj
		}).done(function(resp) {
			console.log(resp);
			alert("성공");
			location.reload();
		}).fail(function(error) {
			alert(error);
		});
	},
	
	sBegin: function(){
		console.log("sBegin");
		var checkbox = $("input[id=allChk]:checked");
		var row = checkbox.parent().parent();
		var colume = row.children();
		
		var ocode = colume.eq(2).text();
		var ocodeObj = new Object;
		ocodeObj.ocode = ocode;
		
		console.log("ocode : " + ocode);
		console.log(ocodeObj);
		
		$.ajax({
			type: "put",
			url: "/admin/api/sBegin",
			dataType: "json",
			data: ocodeObj
		}).done(function(resp) {
			console.log(resp);
			alert("성공");
			location.reload();
		}).fail(function(error) {
			alert(error);
		});
	},
	
	sStandBy: function(){
		console.log("sStandBy");
		var checkbox = $("input[id=allChk]:checked");
		var row = checkbox.parent().parent();
		var colume = row.children();
		
		var ocode = colume.eq(2).text();
		var ocodeObj = new Object;
		ocodeObj.ocode = ocode;
		
		console.log("ocode : " + ocode);
		console.log(ocodeObj);
		
		$.ajax({
			type: "put",
			url: "/admin/api/sStandBy",
			dataType: "json",
			data: ocodeObj
		}).done(function(resp) {
			console.log(resp);
			alert("성공");
			location.reload();
		}).fail(function(error) {
			alert(error);
		});
	},
	
	sEnd: function(){
		console.log("sEnd");
		var checkbox = $("input[id=allChk]:checked");
		var row = checkbox.parent().parent();
		var colume = row.children();
		
		var ocode = colume.eq(2).text();
		var ocodeObj = new Object;
		ocodeObj.ocode = ocode;
		
		console.log("ocode : " + ocode);
		console.log(ocodeObj);
		
		$.ajax({
			type: "put",
			url: "/admin/api/sEnd",
			dataType: "json",
			data: ocodeObj
		}).done(function(resp) {
			console.log(resp);
			alert("성공");
			location.reload();
		}).fail(function(error) {
			alert(error);
		});
	}
	
}

index.init();

