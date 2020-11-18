
var RulesInput = {};
var bpType = $.context.BPRequest.BusinessPartnerCategory;

RulesInput.__type__=  "BPOrg";
RulesInput.BPType = bpType;

$.context.ApproveRulesInput=RulesInput;