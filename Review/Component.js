sap.ui.define([
	"sap/ui/core/UIComponent",
	"sap/ui/Device",
	"demo/sap/com/Review/model/models"
], function(UIComponent, Device, models) {
	"use strict";

	return UIComponent.extend("demo.sap.com.Review.Component", {

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
		
			var startupParameters = this.getComponentData().startupParameters;
			var taskModel = startupParameters.taskModel;
			var taskData = taskModel.getData();
			var taskId = taskData.InstanceID;
			
			var processModel = new sap.ui.model.json.JSONModel("/bpmworkflowruntime/rest/v1/task-instances/" + taskId + "/context");
			var that = this;
			that.setModel(processModel);
			// read process context & bind it to the view's model 
				processModel.attachRequestCompleted(function() {
				var processContext = processModel.getData();
				processContext.task = {};
				processContext.task.Title = taskData.TaskTitle;
				processContext.task.Priority = taskData.Priority;
				processContext.task.Status = taskData.Status;
				processContext.task.CreatedOn = taskData.CreatedOn.toDateString();
				processContext.Address={};
				processContext.Address=processContext.BPRequest.to_BusinessPartnerAddress[0];
				processContext.Tax={};
				processContext.Tax= processContext.BPRequest.to_BusinessPartnerTax[0];
					processContext.Bank={};
				processContext.Bank= processContext.BPRequest.to_BusinessPartnerBank[0];
				// get task description and add it to the model
				startupParameters.inboxAPI.getDescription("NA", taskData.InstanceID).done(function(dataDescr) {
					processContext.task.Description = dataDescr.Description;
					processModel.setData(processContext);
				});

			});
			
	
				//4. Create Complete action
			var oPositiveAction = {
				sBtnTxt: "Confirm",
				onBtnPressed: function(e) {
					that._triggerComplete(that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID, true, jQuery.proxy(
						that._refreshTask, that));
				}
			};

			//5. Add Complete action using MyInbox API
			startupParameters.inboxAPI.addAction({
				action: oPositiveAction.sBtnTxt,
				label: oPositiveAction.sBtnTxt,
				type: "Accept"
			}, oPositiveAction.onBtnPressed);
		},

		_triggerComplete: function(taskId, approvalStatus, refreshTask) {
			//6. Get X-CSRF token and complete the task instance
			$.ajax({
				url: "/bpmworkflowruntime/rest/v1/xsrf-token",
				method: "GET",
				headers: {
					"X-CSRF-Token": "Fetch"
				},
				success: function(result, xhr, data) {
					var token = data.getResponseHeader("X-CSRF-Token");
					var dataText = "{ \"status\":\"COMPLETED\",\"context\": {\"workplaceConfirmed\": \"" + approvalStatus + "\" }}";
					$.ajax({
						url: "/bpmworkflowruntime/rest/v1/task-instances/" + taskId,
						method: "PATCH",
						contentType: "application/json",
						data: dataText,
						headers: {
							"X-CSRF-Token": token
						},
						success: refreshTask
					});
				}
			});

		},
		//6. Update task status to remove the task instance from SAP MyInbox
		_refreshTask: function() {
			//7. Update task status to remove the task instnace from SAP MyInbox.
			var taskId = this.getComponentData().startupParameters.taskModel.getData().InstanceID;
			this.getComponentData().startupParameters.inboxAPI.updateTask("NA", taskId);
		}

	});
});