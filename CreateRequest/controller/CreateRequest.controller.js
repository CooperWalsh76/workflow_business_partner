sap.ui.define([
	"sap/ui/core/mvc/Controller",
	"sap/m/MessageToast"
], function(Controller,MessageToast) {
	"use strict";

	return Controller.extend("demo.sap.com.CreateRequest.controller.CreateRequest", {
	onSubmit: function(evt) {
	 var contextModel =	evt.getSource().getModel().getData();
	  contextModel.BPRequest.to_BusinessPartnerAddress[0] = contextModel.Address;
	  contextModel.BPRequest.to_BusinessPartnerTax[0] =  contextModel.Tax;
	 var token;
			$.ajax({
				url: "/bpmworkflowruntime/rest/v1/xsrf-token",
				method: "GET",
				async: false,
				headers: {
					"X-CSRF-Token": "Fetch"
				},
				success: function(result, xhr, data) {
					token = data.getResponseHeader("X-CSRF-Token");
					$.ajax({
						type: "POST",
						contentType: "application/json",
						headers: {
							"X-CSRF-Token": token
						},
						url: "/bpmworkflowruntime/rest/v1/workflow-instances",
						data: JSON.stringify({
							definitionId: "businesspartnercreation",
							context: contextModel
						}),
						success: function(result, xhr, data) {
						
							MessageToast.show("Request submited with success");
							
						},
						error: function(err) {
							
							MessageToast.show("Error submiting the request");
						}
					});
				}
			});
	}

	});
});