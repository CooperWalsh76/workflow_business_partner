{
	"contents": {
		"b442ca22-9036-43f4-b465-443760bfd16e": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "businesspartnercreation",
			"subject": "BusinessPartnerCreation ${context.BPRequest.BusinessPartnerFullName}",
			"businessKey": "${context.BPRequest.BusinessPartnerFullName}",
			"name": "BusinessPartnerCreation",
			"lastIds": "f68ab32f-9c71-4de1-a137-75b54635d213",
			"events": {
				"505b0575-1346-4c5f-a0e4-457a638f0ec8": {
					"name": "StartEvent1"
				},
				"849c3549-1e23-406b-a3a5-ec064cd9a24c": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"3fa85c70-ac87-42df-9e2f-31ac516122d5": {
					"name": "Enrich Finance Data"
				},
				"9a2aa5eb-88e4-45f2-b27e-a0c860c482cb": {
					"name": "Approve Business Partner Data"
				},
				"ec0d870e-f4c1-4f74-aa84-958364fcf1ef": {
					"name": "ExclusiveGateway1"
				},
				"31cf918b-4311-4659-a9d3-5738daad6624": {
					"name": "Create Business Partner "
				},
				"2f4a3dc6-5672-4ec6-ada7-47f3e946e60a": {
					"name": "Reviewer Business Partner "
				},
				"eb67251d-86e1-4c93-9a42-8a59694bc556": {
					"name": "SetRuleContext"
				},
				"8cf187c2-eca9-4181-9650-c0748d690a0c": {
					"name": "SetRuleContext"
				},
				"2b8df146-58c0-446b-8a8a-8f5ac4e9d0d2": {
					"name": "GetDefaultValues"
				},
				"7cc9ad60-908d-410f-b5c7-91a9ff55c92f": {
					"name": "UpdateContext"
				}
			},
			"sequenceFlows": {
				"20cd32ea-539e-472f-a782-f2a9ef74a67c": {
					"name": "SequenceFlow4"
				},
				"61880561-ce79-4ed6-9f52-3aee33c19789": {
					"name": "Approved"
				},
				"807237b0-0711-4d65-85a6-7bc512c163e2": {
					"name": "Rework"
				},
				"9a4ace7e-9416-4691-b40b-71714bb16e3f": {
					"name": "SequenceFlow9"
				},
				"dad281e0-dbad-4db3-9cd5-f8cf252a3245": {
					"name": "SequenceFlow10"
				},
				"c4239793-daa1-4bce-9597-d053cfc7a8aa": {
					"name": "SequenceFlow11"
				},
				"d94818c1-c985-4673-870c-a7ee54dae075": {
					"name": "SequenceFlow12"
				},
				"a8b1bc63-06c2-4f06-935f-1c89eaa8201d": {
					"name": "SequenceFlow13"
				},
				"682755e0-dbe4-42be-9cdb-b3eef3b62ef0": {
					"name": "SequenceFlow14"
				},
				"4b77c85a-3020-4b93-89a7-1ae6312b9793": {
					"name": "SequenceFlow17"
				},
				"3fe605d1-8551-47ea-8ccc-845da96ffdfc": {
					"name": "SequenceFlow18"
				}
			},
			"diagrams": {
				"8a02bd56-9d12-4d0d-9885-eef2afd90e37": {}
			}
		},
		"505b0575-1346-4c5f-a0e4-457a638f0ec8": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"849c3549-1e23-406b-a3a5-ec064cd9a24c": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"3fa85c70-ac87-42df-9e2f-31ac516122d5": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Enrich BusinessPartner Creation ${context.BPRequest.BusinessPartnerFullName}",
			"description": "Enrich BusinessPartner Creation ${context.BPRequest.BusinessPartnerFullName} and submit the task",
			"priority": "HIGH",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/s4cloudextension/Enrich/demo.sap.com.Enrich",
			"recipientUsers": "Kevin",
			"id": "usertask1",
			"name": "Enrich Finance Data",
			"dueDateRef": "5a75714c-0789-4a78-81b3-dc92a30d4a7f"
		},
		"9a2aa5eb-88e4-45f2-b27e-a0c860c482cb": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve Business PartnerData ${context.BPRequest.BusinessPartnerFullName}",
			"description": "Approve Business PartnerData ${context.BPRequest.BusinessPartnerFullName}. Approve or send it for rework",
			"priority": "HIGH",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/s4cloudextension/Approval/demo.sap.com.Approval",
			"recipientUsers": "John",
			"id": "usertask3",
			"name": "Approve Business Partner Data",
			"dueDateRef": "0c1b8bed-443d-4e9c-ab9f-a8e6f81c4a6a"
		},
		"ec0d870e-f4c1-4f74-aa84-958364fcf1ef": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "ExclusiveGateway1",
			"default": "61880561-ce79-4ed6-9f52-3aee33c19789"
		},
		"31cf918b-4311-4659-a9d3-5738daad6624": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "S4H",
			"path": "/sap/opu/odata/sap/API_BUSINESS_PARTNER/A_BusinessPartner",
			"httpMethod": "POST",
			"xsrfPath": "/sap/opu/odata/SAP/API_BUSINESS_PARTNER",
			"requestVariable": "${context.BPRequest}",
			"responseVariable": "${context.BPResponse}",
			"id": "servicetask1",
			"name": "Create Business Partner ",
			"apiReference": "6f105ae5-2851-4bc2-bb56-51a70b7b6a77"
		},
		"2f4a3dc6-5672-4ec6-ada7-47f3e946e60a": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Review Business Partner Data ${context.BPResponse.d.BusinessPartner}",
			"description": "Review Business Partner ${context.BPResponse.d.BusinessPartner}",
			"priority": "HIGH",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/s4cloudextension/Review/demo.sap.com.Review",
			"recipientUsers": "Lorin",
			"id": "usertask4",
			"name": "Reviewer Business Partner "
		},
		"eb67251d-86e1-4c93-9a42-8a59694bc556": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/BPCreationWorkflow/RulesContext.js",
			"id": "scripttask1",
			"name": "SetRuleContext"
		},
		"8cf187c2-eca9-4181-9650-c0748d690a0c": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/BPCreationWorkflow/defaultvalues.js",
			"id": "scripttask2",
			"name": "SetRuleContext"
		},
		"2b8df146-58c0-446b-8a8a-8f5ac4e9d0d2": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rest/v1/rule-services/java/S4HBPDefaultValues/BPDefaultValuesService",
			"httpMethod": "POST",
			"xsrfPath": "/v1/rules/xsrf-token",
			"requestVariable": "${context.DefaultRuleInput}",
			"responseVariable": "${context.DefaultRuleOutput}",
			"id": "servicetask3",
			"name": "GetDefaultValues"
		},
		"7cc9ad60-908d-410f-b5c7-91a9ff55c92f": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/BPCreationWorkflow/SetDefaultValues.js",
			"id": "scripttask3",
			"name": "UpdateContext"
		},
		"20cd32ea-539e-472f-a782-f2a9ef74a67c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "9a2aa5eb-88e4-45f2-b27e-a0c860c482cb",
			"targetRef": "ec0d870e-f4c1-4f74-aa84-958364fcf1ef"
		},
		"61880561-ce79-4ed6-9f52-3aee33c19789": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "Approved",
			"sourceRef": "ec0d870e-f4c1-4f74-aa84-958364fcf1ef",
			"targetRef": "31cf918b-4311-4659-a9d3-5738daad6624"
		},
		"807237b0-0711-4d65-85a6-7bc512c163e2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.BPRequest.ApprovalStatus == false}",
			"id": "sequenceflow7",
			"name": "Rework",
			"sourceRef": "ec0d870e-f4c1-4f74-aa84-958364fcf1ef",
			"targetRef": "3fa85c70-ac87-42df-9e2f-31ac516122d5"
		},
		"9a4ace7e-9416-4691-b40b-71714bb16e3f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "31cf918b-4311-4659-a9d3-5738daad6624",
			"targetRef": "2f4a3dc6-5672-4ec6-ada7-47f3e946e60a"
		},
		"dad281e0-dbad-4db3-9cd5-f8cf252a3245": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "SequenceFlow10",
			"sourceRef": "2f4a3dc6-5672-4ec6-ada7-47f3e946e60a",
			"targetRef": "849c3549-1e23-406b-a3a5-ec064cd9a24c"
		},
		"c4239793-daa1-4bce-9597-d053cfc7a8aa": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "SequenceFlow11",
			"sourceRef": "3fa85c70-ac87-42df-9e2f-31ac516122d5",
			"targetRef": "eb67251d-86e1-4c93-9a42-8a59694bc556"
		},
		"d94818c1-c985-4673-870c-a7ee54dae075": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow12",
			"name": "SequenceFlow12",
			"sourceRef": "eb67251d-86e1-4c93-9a42-8a59694bc556",
			"targetRef": "9a2aa5eb-88e4-45f2-b27e-a0c860c482cb"
		},
		"a8b1bc63-06c2-4f06-935f-1c89eaa8201d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "SequenceFlow13",
			"sourceRef": "505b0575-1346-4c5f-a0e4-457a638f0ec8",
			"targetRef": "8cf187c2-eca9-4181-9650-c0748d690a0c"
		},
		"682755e0-dbe4-42be-9cdb-b3eef3b62ef0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow14",
			"name": "SequenceFlow14",
			"sourceRef": "8cf187c2-eca9-4181-9650-c0748d690a0c",
			"targetRef": "2b8df146-58c0-446b-8a8a-8f5ac4e9d0d2"
		},
		"4b77c85a-3020-4b93-89a7-1ae6312b9793": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow17",
			"name": "SequenceFlow17",
			"sourceRef": "2b8df146-58c0-446b-8a8a-8f5ac4e9d0d2",
			"targetRef": "7cc9ad60-908d-410f-b5c7-91a9ff55c92f"
		},
		"3fe605d1-8551-47ea-8ccc-845da96ffdfc": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow18",
			"name": "SequenceFlow18",
			"sourceRef": "7cc9ad60-908d-410f-b5c7-91a9ff55c92f",
			"targetRef": "3fa85c70-ac87-42df-9e2f-31ac516122d5"
		},
		"8a02bd56-9d12-4d0d-9885-eef2afd90e37": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"801cd57a-4e45-479b-9b7d-924d89c8f9c0": {},
				"a826c3aa-f292-48b2-b8b2-7cb87f5224a8": {},
				"c6ca460b-b044-44c2-a740-a31ed4930c7e": {},
				"b9cb3e18-ed3f-4d40-a5a9-0a68650923c7": {},
				"516ba46d-7b20-447a-93d0-4db2c611b1ab": {},
				"5057db26-c5b6-4852-be92-76a998846c92": {},
				"1ba42984-76d1-4c2f-b8c9-86eb9105e2a7": {},
				"23f35e86-4d73-4a1b-b3f7-f96b45fd844f": {},
				"ec826d66-5aa4-4f4d-8566-d8b7bea9723b": {},
				"5e29710c-a3bc-4966-a076-7294f141ed05": {},
				"14c34c4c-8592-46de-a975-c221c4c9de11": {},
				"c04f5360-b139-44fe-9dc7-0bbc405bb3f9": {},
				"81ac9216-4193-4162-b16d-99a5301cbce9": {},
				"64dda247-82e4-4f7f-9916-b10ca3c6d109": {},
				"7e82eaba-84df-4c7a-b784-75af421e6947": {},
				"f20752cb-b879-4233-82e5-e3feb23514c5": {},
				"b32e949d-5221-4297-8205-132dac9e9f13": {},
				"23e54f36-c386-49df-bcb7-4a126e955152": {},
				"80ba10fa-877b-4c2d-b9ad-ce0421b27451": {},
				"920120ef-ba8a-4e97-a58c-b2574bb760e0": {},
				"38f2d86c-2ba9-4e0a-b5fe-a29631e2e77b": {},
				"405ff489-32df-48cb-97d1-6141379f8483": {}
			}
		},
		"801cd57a-4e45-479b-9b7d-924d89c8f9c0": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": -449,
			"y": 56.796904865577346,
			"width": 32,
			"height": 32,
			"object": "505b0575-1346-4c5f-a0e4-457a638f0ec8"
		},
		"a826c3aa-f292-48b2-b8b2-7cb87f5224a8": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 947,
			"y": 57.428666804203374,
			"width": 32,
			"height": 32,
			"object": "849c3549-1e23-406b-a3a5-ec064cd9a24c"
		},
		"c6ca460b-b044-44c2-a740-a31ed4930c7e": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 30,
			"y": 42.796904865577346,
			"width": 100,
			"height": 60,
			"object": "3fa85c70-ac87-42df-9e2f-31ac516122d5"
		},
		"b9cb3e18-ed3f-4d40-a5a9-0a68650923c7": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 370,
			"y": 43.26379917227743,
			"width": 100,
			"height": 60,
			"object": "9a2aa5eb-88e4-45f2-b27e-a0c860c482cb"
		},
		"516ba46d-7b20-447a-93d0-4db2c611b1ab": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "470,73.26379917227743 548,73.26379917227743",
			"sourceSymbol": "b9cb3e18-ed3f-4d40-a5a9-0a68650923c7",
			"targetSymbol": "5057db26-c5b6-4852-be92-76a998846c92",
			"object": "20cd32ea-539e-472f-a782-f2a9ef74a67c"
		},
		"5057db26-c5b6-4852-be92-76a998846c92": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 548,
			"y": 52.26379917227743,
			"object": "ec0d870e-f4c1-4f74-aa84-958364fcf1ef"
		},
		"1ba42984-76d1-4c2f-b8c9-86eb9105e2a7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "590,73.26379917227743 625,73.26380157470703 625,73.42866516113281 660,73.42866680420337",
			"sourceSymbol": "5057db26-c5b6-4852-be92-76a998846c92",
			"targetSymbol": "23f35e86-4d73-4a1b-b3f7-f96b45fd844f",
			"object": "61880561-ce79-4ed6-9f52-3aee33c19789"
		},
		"23f35e86-4d73-4a1b-b3f7-f96b45fd844f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 660,
			"y": 43.428666804203374,
			"width": 100,
			"height": 60,
			"object": "31cf918b-4311-4659-a9d3-5738daad6624"
		},
		"ec826d66-5aa4-4f4d-8566-d8b7bea9723b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "569,73.26379917227743 569,-7.703094482421875 84,-7.703094482421875 84,92",
			"sourceSymbol": "5057db26-c5b6-4852-be92-76a998846c92",
			"targetSymbol": "c6ca460b-b044-44c2-a740-a31ed4930c7e",
			"object": "807237b0-0711-4d65-85a6-7bc512c163e2"
		},
		"5e29710c-a3bc-4966-a076-7294f141ed05": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 809,
			"y": 43.428666804203374,
			"width": 100,
			"height": 60,
			"object": "2f4a3dc6-5672-4ec6-ada7-47f3e946e60a"
		},
		"14c34c4c-8592-46de-a975-c221c4c9de11": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "710,73.42866680420337 859,73.42866680420337",
			"sourceSymbol": "23f35e86-4d73-4a1b-b3f7-f96b45fd844f",
			"targetSymbol": "5e29710c-a3bc-4966-a076-7294f141ed05",
			"object": "9a4ace7e-9416-4691-b40b-71714bb16e3f"
		},
		"c04f5360-b139-44fe-9dc7-0bbc405bb3f9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "859,75.92866680420337 960,75.92866680420337",
			"sourceSymbol": "5e29710c-a3bc-4966-a076-7294f141ed05",
			"targetSymbol": "a826c3aa-f292-48b2-b8b2-7cb87f5224a8",
			"object": "dad281e0-dbad-4db3-9cd5-f8cf252a3245"
		},
		"81ac9216-4193-4162-b16d-99a5301cbce9": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 206,
			"y": 42.796904865577346,
			"width": 100,
			"height": 60,
			"object": "eb67251d-86e1-4c93-9a42-8a59694bc556"
		},
		"64dda247-82e4-4f7f-9916-b10ca3c6d109": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "80,72.79690486557735 256,72.79690486557735",
			"sourceSymbol": "c6ca460b-b044-44c2-a740-a31ed4930c7e",
			"targetSymbol": "81ac9216-4193-4162-b16d-99a5301cbce9",
			"object": "c4239793-daa1-4bce-9597-d053cfc7a8aa"
		},
		"7e82eaba-84df-4c7a-b784-75af421e6947": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "256,73.03035201892739 420,73.03035201892739",
			"sourceSymbol": "81ac9216-4193-4162-b16d-99a5301cbce9",
			"targetSymbol": "b9cb3e18-ed3f-4d40-a5a9-0a68650923c7",
			"object": "d94818c1-c985-4673-870c-a7ee54dae075"
		},
		"f20752cb-b879-4233-82e5-e3feb23514c5": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -393,
			"y": 42.796904865577346,
			"width": 100,
			"height": 60,
			"object": "8cf187c2-eca9-4181-9650-c0748d690a0c"
		},
		"b32e949d-5221-4297-8205-132dac9e9f13": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-433,72.79690486557735 -343,72.79690486557735",
			"sourceSymbol": "801cd57a-4e45-479b-9b7d-924d89c8f9c0",
			"targetSymbol": "f20752cb-b879-4233-82e5-e3feb23514c5",
			"object": "a8b1bc63-06c2-4f06-935f-1c89eaa8201d"
		},
		"23e54f36-c386-49df-bcb7-4a126e955152": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -250,
			"y": 42.796904865577346,
			"width": 100,
			"height": 60,
			"object": "2b8df146-58c0-446b-8a8a-8f5ac4e9d0d2"
		},
		"80ba10fa-877b-4c2d-b9ad-ce0421b27451": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-343,72.79690486557735 -200,72.79690486557735",
			"sourceSymbol": "f20752cb-b879-4233-82e5-e3feb23514c5",
			"targetSymbol": "23e54f36-c386-49df-bcb7-4a126e955152",
			"object": "682755e0-dbe4-42be-9cdb-b3eef3b62ef0"
		},
		"920120ef-ba8a-4e97-a58c-b2574bb760e0": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -110,
			"y": 42.796904865577346,
			"width": 100,
			"height": 60,
			"object": "7cc9ad60-908d-410f-b5c7-91a9ff55c92f"
		},
		"38f2d86c-2ba9-4e0a-b5fe-a29631e2e77b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-200,72.79690486557735 -60,72.79690486557735",
			"sourceSymbol": "23e54f36-c386-49df-bcb7-4a126e955152",
			"targetSymbol": "920120ef-ba8a-4e97-a58c-b2574bb760e0",
			"object": "4b77c85a-3020-4b93-89a7-1ae6312b9793"
		},
		"405ff489-32df-48cb-97d1-6141379f8483": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-60,72.79690486557735 51,72.79690486557735",
			"sourceSymbol": "920120ef-ba8a-4e97-a58c-b2574bb760e0",
			"targetSymbol": "c6ca460b-b044-44c2-a740-a31ed4930c7e",
			"object": "3fe605d1-8551-47ea-8ccc-845da96ffdfc"
		},
		"f68ab32f-9c71-4de1-a137-75b54635d213": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"timereventdefinition": 6,
			"hubapireference": 1,
			"sequenceflow": 18,
			"startevent": 1,
			"boundarytimerevent": 2,
			"endevent": 1,
			"usertask": 4,
			"servicetask": 3,
			"scripttask": 3,
			"exclusivegateway": 1
		},
		"5a75714c-0789-4a78-81b3-dc92a30d4a7f": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P2D",
			"id": "timereventdefinition1"
		},
		"0c1b8bed-443d-4e9c-ab9f-a8e6f81c4a6a": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P2D",
			"id": "timereventdefinition6"
		},
		"6f105ae5-2851-4bc2-bb56-51a70b7b6a77": {
			"classDefinition": "com.sap.bpm.wfs.HubAPIReference",
			"apiPackage": "SAPS4HANACloud",
			"api": "API_BUSINESS_PARTNER",
			"apiName": "OData Service for Business Partner",
			"id": "hubapireference1"
		}
	}
}