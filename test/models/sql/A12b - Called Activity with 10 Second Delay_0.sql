declare
  l_dgrm_content clob;
begin
  l_dgrm_content := apex_string.join_clob(
    apex_t_varchar2(
      q'[<?xml version="1.0" encoding="UTF-8"?>]'
      ,q'[<bpmn:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:apex="https://flowsforapex.org" id="Definitions_1wzb475" targetNamespace="http://bpmn.io/schema/b" exporter="Flows for APEX" exporterVersion="23.1.0">]'
      ,q'[  <bpmn:process id="Process_10SecDelay" name="10SecDelay" isExecutable="false" apex:isCallable="true" apex:manualInput="false">]'
      ,q'[    <bpmn:documentation>This Process just implements a 10 Second delay via an ICE with Timer Defined as PT20S then returns.</bpmn:documentation>]'
      ,q'[    <bpmn:startEvent id="Event_1p87ip5" name="Start 10s Delay">]'
      ,q'[      <bpmn:outgoing>Flow_0m5f8c0</bpmn:outgoing>]'
      ,q'[    </bpmn:startEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0m5f8c0" sourceRef="Event_1p87ip5" targetRef="Event_DelayTimer10s" />]'
      ,q'[    <bpmn:intermediateCatchEvent id="Event_DelayTimer10s" name="Event_DelayTimer10s">]'
      ,q'[      <bpmn:extensionElements>]'
      ,q'[        <apex:onEvent>]'
      ,q'[          <apex:processVariable>]'
      ,q'[            <apex:varSequence>0</apex:varSequence>]'
      ,q'[            <apex:varName>SetInCalled</apex:varName>]'
      ,q'[            <apex:varDataType>VARCHAR2</apex:varDataType>]'
      ,q'[            <apex:varExpressionType>static</apex:varExpressionType>]'
      ,q'[            <apex:varExpression>SetInCalled</apex:varExpression>]'
      ,q'[          </apex:processVariable>]'
      ,q'[        </apex:onEvent>]'
      ,q'[      </bpmn:extensionElements>]'
      ,q'[      <bpmn:incoming>Flow_0m5f8c0</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1l4x6yf</bpmn:outgoing>]'
      ,q'[      <bpmn:timerEventDefinition id="TimerEventDefinition_1l0hbhg">]'
      ,q'[        <bpmn:timeDuration xsi:type="bpmn:tFormalExpression">PT10S</bpmn:timeDuration>]'
      ,q'[      </bpmn:timerEventDefinition>]'
      ,q'[    </bpmn:intermediateCatchEvent>]'
      ,q'[    <bpmn:endEvent id="Event_1iyxzpq" name="End 10s Delay">]'
      ,q'[      <bpmn:incoming>Flow_1l4x6yf</bpmn:incoming>]'
      ,q'[    </bpmn:endEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1l4x6yf" sourceRef="Event_DelayTimer10s" targetRef="Event_1iyxzpq" />]'
      ,q'[  </bpmn:process>]'
      ,q'[  <bpmndi:BPMNDiagram id="BPMNDiagram_1">]'
      ,q'[    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Process_10SecDelay">]'
      ,q'[      <bpmndi:BPMNShape id="Event_1p87ip5_di" bpmnElement="Event_1p87ip5">]'
      ,q'[        <dc:Bounds x="342" y="442" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="323" y="485" width="76" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_1vo9s18_di" bpmnElement="Event_DelayTimer10s">]'
      ,q'[        <dc:Bounds x="432" y="442" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="407" y="485" width="87" height="27" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_1iyxzpq_di" bpmnElement="Event_1iyxzpq">]'
      ,q'[        <dc:Bounds x="522" y="442" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="505" y="485" width="72" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0m5f8c0_di" bpmnElement="Flow_0m5f8c0">]'
      ,q'[        <di:waypoint x="378" y="460" />]'
      ,q'[        <di:waypoint x="432" y="460" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1l4x6yf_di" bpmnElement="Flow_1l4x6yf">]'
      ,q'[        <di:waypoint x="468" y="460" />]'
      ,q'[        <di:waypoint x="522" y="460" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[    </bpmndi:BPMNPlane>]'
      ,q'[  </bpmndi:BPMNDiagram>]'
      ,q'[</bpmn:definitions>]'
      ,q'[]'
  ));
  flow_diagram.upload_and_parse(
    pi_dgrm_name => 'A12b - Called Activity with 10 Second Delay',
    pi_dgrm_version => '0',
    pi_dgrm_category => 'Testing',
    pi_dgrm_content => l_dgrm_content,
    pi_force_overwrite => true
);
end;
/
