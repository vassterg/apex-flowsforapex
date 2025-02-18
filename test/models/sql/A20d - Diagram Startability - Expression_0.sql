declare
  l_dgrm_content clob;
begin
  l_dgrm_content := apex_string.join_clob(
    apex_t_varchar2(
      q'[<?xml version="1.0" encoding="UTF-8"?>]'
      ,q'[<bpmn:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:apex="https://flowsforapex.org" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" id="Definitions_1wzb475" targetNamespace="http://bpmn.io/schema/b" exporter="Flows for APEX" exporterVersion="23.1.0">]'
      ,q'[  <bpmn:process id="Process_A20d" name="A20d - Startability - Expressions" isExecutable="true" apex:isStartable="true" apex:manualInput="false">]'
      ,q'[    <bpmn:extensionElements>]'
      ,q'[      <apex:potentialStartingUsers>]'
      ,q'[        <apex:expressionType>plsqlRawExpression</apex:expressionType>]'
      ,q'[        <apex:expression>'SMITH'||':'||'JONES'</apex:expression>]'
      ,q'[      </apex:potentialStartingUsers>]'
      ,q'[      <apex:potentialStartingGroups>]'
      ,q'[        <apex:expressionType>plsqlRawExpression</apex:expressionType>]'
      ,q'[        <apex:expression>'SALES:MARKETING'</apex:expression>]'
      ,q'[      </apex:potentialStartingGroups>]'
      ,q'[      <apex:excludedStartingUsers>]'
      ,q'[        <apex:expressionType>plsqlRawExpression</apex:expressionType>]'
      ,q'[        <apex:expression>'BADBOSS'</apex:expression>]'
      ,q'[      </apex:excludedStartingUsers>]'
      ,q'[    </bpmn:extensionElements>]'
      ,q'[    <bpmn:startEvent id="Event_0hascl9" name="Start">]'
      ,q'[      <bpmn:outgoing>Flow_09b7lxc</bpmn:outgoing>]'
      ,q'[    </bpmn:startEvent>]'
      ,q'[    <bpmn:task id="Activity_0peaehs" name="A">]'
      ,q'[      <bpmn:incoming>Flow_09b7lxc</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1uihtja</bpmn:outgoing>]'
      ,q'[    </bpmn:task>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_09b7lxc" sourceRef="Event_0hascl9" targetRef="Activity_0peaehs" />]'
      ,q'[    <bpmn:endEvent id="Event_1raikhy" name="End">]'
      ,q'[      <bpmn:incoming>Flow_1uihtja</bpmn:incoming>]'
      ,q'[    </bpmn:endEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1uihtja" sourceRef="Activity_0peaehs" targetRef="Event_1raikhy" />]'
      ,q'[  </bpmn:process>]'
      ,q'[  <bpmndi:BPMNDiagram id="BPMNDiagram_1">]'
      ,q'[    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Process_A20d">]'
      ,q'[      <bpmndi:BPMNShape id="Event_0hascl9_di" bpmnElement="Event_0hascl9">]'
      ,q'[        <dc:Bounds x="652" y="372" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="658" y="415" width="24" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_0peaehs_di" bpmnElement="Activity_0peaehs">]'
      ,q'[        <dc:Bounds x="740" y="350" width="100" height="80" />]'
      ,q'[        <bpmndi:BPMNLabel />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_1raikhy_di" bpmnElement="Event_1raikhy">]'
      ,q'[        <dc:Bounds x="892" y="372" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="900" y="415" width="20" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_09b7lxc_di" bpmnElement="Flow_09b7lxc">]'
      ,q'[        <di:waypoint x="688" y="390" />]'
      ,q'[        <di:waypoint x="740" y="390" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1uihtja_di" bpmnElement="Flow_1uihtja">]'
      ,q'[        <di:waypoint x="840" y="390" />]'
      ,q'[        <di:waypoint x="892" y="390" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[    </bpmndi:BPMNPlane>]'
      ,q'[  </bpmndi:BPMNDiagram>]'
      ,q'[</bpmn:definitions>]'
      ,q'[]'
  ));
  flow_diagram.upload_and_parse(
    pi_dgrm_name => 'A20d - Diagram Startability - Expression',
    pi_dgrm_version => '0',
    pi_dgrm_category => 'Testing',
    pi_dgrm_content => l_dgrm_content,
    pi_force_overwrite => true
);
end;
/
