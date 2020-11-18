
var RulesInput = {};
var bpType = $.context.BPRequest.BusinessPartnerCategory;

RulesInput.__type__=  "BPRequest";
RulesInput.SearchTerm = $.context.BPRequest.SearchTerm1;
RulesInput.Name1 = $.context.BPRequest.BusinessPartnerName;
$.context.DefaultRuleInput=RulesInput;