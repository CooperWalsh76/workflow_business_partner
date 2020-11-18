sap.ui.define([
	"sap/ui/core/UIComponent",
	"sap/ui/Device",
	"demo/sap/com/CreateRequest/model/models"
], function(UIComponent, Device, models) {
	"use strict";

	return UIComponent.extend("demo.sap.com.CreateRequest.Component", {

		metadata: {
			manifest: "json"
		},

		/**
		 * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
		 * @public
		 * @override
		 */
		init: function() {
			// call the base component's init function
			UIComponent.prototype.init.apply(this, arguments);

			// enable routing
			this.getRouter().initialize();

			// set the device model
			this.setModel(models.createDeviceModel(), "device");
			var bpModel = new sap.ui.model.json.JSONModel();
			bpModel.attachRequestCompleted(function() {
			var bpContext =  bpModel.getData();
			
			bpContext.Address={};
			bpContext.Address=bpContext.BPRequest.to_BusinessPartnerAddress[0];
			bpContext.Tax={};
			bpContext.Tax= bpContext.BPRequest.to_BusinessPartnerTax[0];
			bpContext.Bank={};
			bpContext.Bank= bpContext.BPRequest.to_BusinessPartnerBank[0];
			bpModel.setData(bpContext);
       
    	});
			bpModel.loadData("/CreateRequest/model/BPMaster.json");
			bpModel.setDefaultBindingMode(sap.ui.model.BindingMode.TwoWay);
		
			var that = this;
			that.setModel(bpModel);
		}
		
	});
});
