declare
  l_dgrm_content clob;
begin
  l_dgrm_content := apex_string.join_clob(
    apex_t_varchar2(
      q'[<?xml version="1.0" encoding="UTF-8"?>]'
      ,q'[<bpmn:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:apex="https://flowsforapex.org" id="Definitions_1wzb475" targetNamespace="http://bpmn.io/schema/bpmn" exporter="Flows for APEX" exporterVersion="23.1.0">]'
      ,q'[  <bpmn:collaboration id="Collaboration_1rka1qz">]'
      ,q'[    <bpmn:documentation>Tutorials by Richard Allen.]'
      ,q'[Flowquest Consulting.]'
      ,q'[twitter: @FlowquestR</bpmn:documentation>]'
      ,q'[    <bpmn:participant id="Participant_0o8ym8r" name="MyCompany" processRef="Process_0rxermh" />]'
      ,q'[  </bpmn:collaboration>]'
      ,q'[  <bpmn:process id="Process_0rxermh" isExecutable="false">]'
      ,q'[    <bpmn:laneSet id="LaneSet_1vcug1u">]'
      ,q'[      <bpmn:lane id="Lane_1di2z70" name="Sales" apex:isRole="false">]'
      ,q'[        <bpmn:flowNodeRef>Event_15p5zwa</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_1fb79se</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Gateway_0xszxbu</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_1btthx3</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_0u1cxe0</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Event_0hcbcm9</bpmn:flowNodeRef>]'
      ,q'[      </bpmn:lane>]'
      ,q'[      <bpmn:lane id="Lane_06y2vip" name="Finance" apex:isRole="false">]'
      ,q'[        <bpmn:flowNodeRef>Gateway_0ctvx3o</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_1bbwgpd</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_080aaf2</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_00ou09q</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_1enngrb</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Gateway_1uzm09b</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_0j2a5z0</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Event_0052vug</bpmn:flowNodeRef>]'
      ,q'[      </bpmn:lane>]'
      ,q'[      <bpmn:lane id="Lane_03etxno" name="Shipping" apex:isRole="false">]'
      ,q'[        <bpmn:flowNodeRef>Gateway_1hvg7i1</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Event_1fqq9sr</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_0a9stdf</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_1r5snya</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_0rghtfj</bpmn:flowNodeRef>]'
      ,q'[        <bpmn:flowNodeRef>Activity_0lm6w3e</bpmn:flowNodeRef>]'
      ,q'[      </bpmn:lane>]'
      ,q'[    </bpmn:laneSet>]'
      ,q'[    <bpmn:startEvent id="Event_15p5zwa" name="start">]'
      ,q'[      <bpmn:outgoing>Flow_0kubj9p</bpmn:outgoing>]'
      ,q'[    </bpmn:startEvent>]'
      ,q'[    <bpmn:task id="Activity_1fb79se" name="Take Order">]'
      ,q'[      <bpmn:incoming>Flow_0kubj9p</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0ry9q57</bpmn:outgoing>]'
      ,q'[    </bpmn:task>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0kubj9p" sourceRef="Event_15p5zwa" targetRef="Activity_1fb79se" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0ry9q57" sourceRef="Activity_1fb79se" targetRef="Gateway_0xszxbu" />]'
      ,q'[    <bpmn:parallelGateway id="Gateway_0xszxbu">]'
      ,q'[      <bpmn:incoming>Flow_0ry9q57</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1air6n9</bpmn:outgoing>]'
      ,q'[      <bpmn:outgoing>Flow_06iqwjh</bpmn:outgoing>]'
      ,q'[      <bpmn:outgoing>Flow_08s6jze</bpmn:outgoing>]'
      ,q'[    </bpmn:parallelGateway>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1air6n9" sourceRef="Gateway_0xszxbu" targetRef="Activity_1btthx3" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_06iqwjh" sourceRef="Gateway_0xszxbu" targetRef="Activity_080aaf2" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1ututkm" sourceRef="Activity_080aaf2" targetRef="Activity_00ou09q" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1pyqngd" sourceRef="Activity_00ou09q" targetRef="Activity_1enngrb" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_08s6jze" sourceRef="Gateway_0xszxbu" targetRef="Activity_0a9stdf" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_006uuj2" sourceRef="Activity_0a9stdf" targetRef="Gateway_1hvg7i1" />]'
      ,q'[    <bpmn:exclusiveGateway id="Gateway_1hvg7i1" name="Embargoed Customer?" default="Flow_1aa0af4">]'
      ,q'[      <bpmn:incoming>Flow_006uuj2</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1aa0af4</bpmn:outgoing>]'
      ,q'[      <bpmn:outgoing>Flow_1tof406</bpmn:outgoing>]'
      ,q'[    </bpmn:exclusiveGateway>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1aa0af4" name="N" sourceRef="Gateway_1hvg7i1" targetRef="Activity_1r5snya" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1tof406" name="Y" sourceRef="Gateway_1hvg7i1" targetRef="Event_1fqq9sr" />]'
      ,q'[    <bpmn:endEvent id="Event_1fqq9sr" name="Terminate Order">]'
      ,q'[      <bpmn:incoming>Flow_1tof406</bpmn:incoming>]'
      ,q'[      <bpmn:terminateEventDefinition id="TerminateEventDefinition_180cega">]'
      ,q'[        <apex:processStatus>terminated</apex:processStatus>]'
      ,q'[      </bpmn:terminateEventDefinition>]'
      ,q'[    </bpmn:endEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_10doy19" sourceRef="Activity_1r5snya" targetRef="Activity_0rghtfj" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1071r1d" sourceRef="Activity_1btthx3" targetRef="Gateway_0ctvx3o" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0al8eiu" sourceRef="Activity_1enngrb" targetRef="Gateway_0ctvx3o" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1olo1p2" sourceRef="Activity_0rghtfj" targetRef="Activity_0lm6w3e" />]'
      ,q'[    <bpmn:parallelGateway id="Gateway_0ctvx3o">]'
      ,q'[      <bpmn:incoming>Flow_1071r1d</bpmn:incoming>]'
      ,q'[      <bpmn:incoming>Flow_0al8eiu</bpmn:incoming>]'
      ,q'[      <bpmn:incoming>Flow_07xilb7</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1da66k3</bpmn:outgoing>]'
      ,q'[    </bpmn:parallelGateway>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_07xilb7" sourceRef="Activity_0lm6w3e" targetRef="Gateway_0ctvx3o" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1da66k3" sourceRef="Gateway_0ctvx3o" targetRef="Activity_1bbwgpd" />]'
      ,q'[    <bpmn:userTask id="Activity_1bbwgpd" name="Final approval to ship" apex:type="apexPage">]'
      ,q'[      <bpmn:extensionElements>]'
      ,q'[        <apex:apexPage />]'
      ,q'[      </bpmn:extensionElements>]'
      ,q'[      <bpmn:incoming>Flow_1da66k3</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1qhwtp2</bpmn:outgoing>]'
      ,q'[    </bpmn:userTask>]'
      ,q'[    <bpmn:scriptTask id="Activity_080aaf2" name="Draft Invoice" apex:type="executePlsql">]'
      ,q'[      <bpmn:extensionElements>]'
      ,q'[        <apex:executePlsql>]'
      ,q'[          <apex:plsqlCode>null;</apex:plsqlCode>]'
      ,q'[        </apex:executePlsql>]'
      ,q'[      </bpmn:extensionElements>]'
      ,q'[      <bpmn:incoming>Flow_06iqwjh</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1ututkm</bpmn:outgoing>]'
      ,q'[    </bpmn:scriptTask>]'
      ,q'[    <bpmn:userTask id="Activity_00ou09q" name="Approve Discounts" apex:type="apexPage">]'
      ,q'[      <bpmn:extensionElements>]'
      ,q'[        <apex:apexPage />]'
      ,q'[      </bpmn:extensionElements>]'
      ,q'[      <bpmn:incoming>Flow_1ututkm</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1pyqngd</bpmn:outgoing>]'
      ,q'[    </bpmn:userTask>]'
      ,q'[    <bpmn:serviceTask id="Activity_1enngrb" name="Send invoice" apex:type="executePlsql">]'
      ,q'[      <bpmn:extensionElements>]'
      ,q'[        <apex:executePlsql>]'
      ,q'[          <apex:plsqlCode>null;</apex:plsqlCode>]'
      ,q'[        </apex:executePlsql>]'
      ,q'[      </bpmn:extensionElements>]'
      ,q'[      <bpmn:incoming>Flow_1pyqngd</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0al8eiu</bpmn:outgoing>]'
      ,q'[    </bpmn:serviceTask>]'
      ,q'[    <bpmn:serviceTask id="Activity_1btthx3" name="Email Customer to confirm" apex:type="executePlsql">]'
      ,q'[      <bpmn:extensionElements>]'
      ,q'[        <apex:executePlsql>]'
      ,q'[          <apex:plsqlCode>null;</apex:plsqlCode>]'
      ,q'[        </apex:executePlsql>]'
      ,q'[      </bpmn:extensionElements>]'
      ,q'[      <bpmn:incoming>Flow_1air6n9</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1071r1d</bpmn:outgoing>]'
      ,q'[    </bpmn:serviceTask>]'
      ,q'[    <bpmn:serviceTask id="Activity_0a9stdf" name="Check Embargoed Customer List" apex:type="executePlsql">]'
      ,q'[      <bpmn:extensionElements>]'
      ,q'[        <apex:executePlsql>]'
      ,q'[          <apex:plsqlCode>null;</apex:plsqlCode>]'
      ,q'[        </apex:executePlsql>]'
      ,q'[      </bpmn:extensionElements>]'
      ,q'[      <bpmn:incoming>Flow_08s6jze</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_006uuj2</bpmn:outgoing>]'
      ,q'[    </bpmn:serviceTask>]'
      ,q'[    <bpmn:userTask id="Activity_1r5snya" name="Prepare Shipping" apex:type="apexPage">]'
      ,q'[      <bpmn:extensionElements>]'
      ,q'[        <apex:apexPage />]'
      ,q'[      </bpmn:extensionElements>]'
      ,q'[      <bpmn:incoming>Flow_1aa0af4</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_10doy19</bpmn:outgoing>]'
      ,q'[    </bpmn:userTask>]'
      ,q'[    <bpmn:scriptTask id="Activity_0rghtfj" name="Book Transport" apex:type="executePlsql">]'
      ,q'[      <bpmn:extensionElements>]'
      ,q'[        <apex:executePlsql>]'
      ,q'[          <apex:plsqlCode>null;</apex:plsqlCode>]'
      ,q'[        </apex:executePlsql>]'
      ,q'[      </bpmn:extensionElements>]'
      ,q'[      <bpmn:incoming>Flow_10doy19</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1olo1p2</bpmn:outgoing>]'
      ,q'[    </bpmn:scriptTask>]'
      ,q'[    <bpmn:manualTask id="Activity_0lm6w3e" name="Pack Goods">]'
      ,q'[      <bpmn:incoming>Flow_1olo1p2</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_07xilb7</bpmn:outgoing>]'
      ,q'[    </bpmn:manualTask>]'
      ,q'[    <bpmn:exclusiveGateway id="Gateway_1uzm09b" name="Approved" default="Flow_0v4ypbt">]'
      ,q'[      <bpmn:incoming>Flow_1qhwtp2</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0v4ypbt</bpmn:outgoing>]'
      ,q'[      <bpmn:outgoing>Flow_11edvtt</bpmn:outgoing>]'
      ,q'[    </bpmn:exclusiveGateway>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1qhwtp2" sourceRef="Activity_1bbwgpd" targetRef="Gateway_1uzm09b" />]'
      ,q'[    <bpmn:task id="Activity_0j2a5z0" name="Ship Goods">]'
      ,q'[      <bpmn:incoming>Flow_0v4ypbt</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0raow5t</bpmn:outgoing>]'
      ,q'[    </bpmn:task>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0v4ypbt" name="Y" sourceRef="Gateway_1uzm09b" targetRef="Activity_0j2a5z0" />]'
      ,q'[    <bpmn:endEvent id="Event_0052vug" name="End">]'
      ,q'[      <bpmn:incoming>Flow_0raow5t</bpmn:incoming>]'
      ,q'[    </bpmn:endEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0raow5t" sourceRef="Activity_0j2a5z0" targetRef="Event_0052vug" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_11edvtt" name="N" sourceRef="Gateway_1uzm09b" targetRef="Activity_0u1cxe0" />]'
      ,q'[    <bpmn:task id="Activity_0u1cxe0" name="Advise Sales">]'
      ,q'[      <bpmn:incoming>Flow_11edvtt</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_09hbzak</bpmn:outgoing>]'
      ,q'[    </bpmn:task>]'
      ,q'[    <bpmn:endEvent id="Event_0hcbcm9" name="Order needs to be redone.">]'
      ,q'[      <bpmn:incoming>Flow_09hbzak</bpmn:incoming>]'
      ,q'[    </bpmn:endEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_09hbzak" sourceRef="Activity_0u1cxe0" targetRef="Event_0hcbcm9" />]'
      ,q'[    <bpmn:textAnnotation id="TextAnnotation_0l49ruu">]'
      ,q'[      <bpmn:text>Tutorial 8: Keep in Your Lane]'
      ,q'[]'
      ,q'[We're now added Lanes to our model to show who does what.  Look at the Left side of the diagram &amp; you can see our Sales, Finance and Shipping lanes.]'
      ,q'[When you run the process, you can see the task information in the Process Monitor shows which Lane each current task is in.]'
      ,q'[]'
      ,q'[Using Lanes can be very helpful when you model your processes.   We'll look at Task Assignment in more detail in Tutorials 6a, b, and c....</bpmn:text>]'
      ,q'[    </bpmn:textAnnotation>]'
      ,q'[    <bpmn:association id="Association_024tpq3" sourceRef="Activity_1fb79se" targetRef="TextAnnotation_0l49ruu" />]'
      ,q'[    <bpmn:textAnnotation id="TextAnnotation_1q7qdra">]'
      ,q'[      <bpmn:text>This is a Terminate End - which immediately ends the process if it is in the top level of the process.]'
      ,q'[]'
      ,q'[You can control how the process shows up in your monitoring after Termination End by setting the 'Completed Status' in the modeler.   This controls whether the process has a normal 'completed' status, or a 'terminated' status after an abnormal end.  Set in the properties panel. --&gt;]'
      ,q'[]'
      ,q'[If it's inside a Sub-Process, it ends the sub Process and any embedded processes &amp; returns control to the parent process.</bpmn:text>]'
      ,q'[    </bpmn:textAnnotation>]'
      ,q'[    <bpmn:association id="Association_18cs70j" sourceRef="Event_1fqq9sr" targetRef="TextAnnotation_1q7qdra" />]'
      ,q'[  </bpmn:process>]'
      ,q'[  <bpmndi:BPMNDiagram id="BPMNDiagram_1">]'
      ,q'[    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Collaboration_1rka1qz">]'
      ,q'[      <bpmndi:BPMNShape id="Participant_0o8ym8r_di" bpmnElement="Participant_0o8ym8r" isHorizontal="true">]'
      ,q'[        <dc:Bounds x="220" y="100" width="1810" height="894" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Lane_03etxno_di" bpmnElement="Lane_03etxno" isHorizontal="true">]'
      ,q'[        <dc:Bounds x="250" y="690" width="1780" height="304" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Lane_06y2vip_di" bpmnElement="Lane_06y2vip" isHorizontal="true">]'
      ,q'[        <dc:Bounds x="250" y="420" width="1780" height="270" />]'
      ,q'[        <bpmndi:BPMNLabel />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Lane_1di2z70_di" bpmnElement="Lane_1di2z70" isHorizontal="true">]'
      ,q'[        <dc:Bounds x="250" y="100" width="1780" height="320" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_15p5zwa_di" bpmnElement="Event_15p5zwa">]'
      ,q'[        <dc:Bounds x="372" y="262" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="379" y="305" width="22" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_1fb79se_di" bpmnElement="Activity_1fb79se">]'
      ,q'[        <dc:Bounds x="460" y="240" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Gateway_1tdosqr_di" bpmnElement="Gateway_0xszxbu">]'
      ,q'[        <dc:Bounds x="615" y="255" width="50" height="50" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Gateway_1hvg7i1_di" bpmnElement="Gateway_1hvg7i1" isMarkerVisible="true">]'
      ,q'[        <dc:Bounds x="875" y="735" width="50" height="50" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="872" y="705" width="57" height="27" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_0ujpq6a_di" bpmnElement="Event_1fqq9sr">]'
      ,q'[        <dc:Bounds x="982" y="842" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="960" y="885" width="80" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Gateway_0uu1z3t_di" bpmnElement="Gateway_0ctvx3o">]'
      ,q'[        <dc:Bounds x="1425" y="535" width="50" height="50" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_0op2vlf_di" bpmnElement="Activity_1bbwgpd">]'
      ,q'[        <dc:Bounds x="1500" y="520" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_1xvxmx2_di" bpmnElement="Activity_080aaf2">]'
      ,q'[        <dc:Bounds x="720" y="520" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_150wweq_di" bpmnElement="Activity_00ou09q">]'
      ,q'[        <dc:Bounds x="880" y="520" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_0qvcf9e_di" bpmnElement="Activity_1enngrb">]'
      ,q'[        <dc:Bounds x="1040" y="520" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_0t823hl_di" bpmnElement="Activity_1btthx3">]'
      ,q'[        <dc:Bounds x="720" y="240" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_1novl0e_di" bpmnElement="Activity_0a9stdf">]'
      ,q'[        <dc:Bounds x="720" y="720" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_06icm2o_di" bpmnElement="Activity_1r5snya">]'
      ,q'[        <dc:Bounds x="980" y="720" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_0qnu0yv_di" bpmnElement="Activity_0rghtfj">]'
      ,q'[        <dc:Bounds x="1140" y="720" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_0e3ved3_di" bpmnElement="Activity_0lm6w3e">]'
      ,q'[        <dc:Bounds x="1300" y="720" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Gateway_1uzm09b_di" bpmnElement="Gateway_1uzm09b" isMarkerVisible="true">]'
      ,q'[        <dc:Bounds x="1625" y="535" width="50" height="50" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="1626" y="592" width="48" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_0j2a5z0_di" bpmnElement="Activity_0j2a5z0">]'
      ,q'[        <dc:Bounds x="1700" y="520" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_0052vug_di" bpmnElement="Event_0052vug">]'
      ,q'[        <dc:Bounds x="1832" y="542" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="1840" y="585" width="20" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_0u1cxe0_di" bpmnElement="Activity_0u1cxe0">]'
      ,q'[        <dc:Bounds x="1700" y="240" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_0hcbcm9_di" bpmnElement="Event_0hcbcm9">]'
      ,q'[        <dc:Bounds x="1832" y="262" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="1806" y="305" width="89" height="27" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="TextAnnotation_0l49ruu_di" bpmnElement="TextAnnotation_0l49ruu">]'
      ,q'[        <dc:Bounds x="560" y="120" width="915" height="96" />]'
      ,q'[        <bpmndi:BPMNLabel />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="TextAnnotation_1q7qdra_di" bpmnElement="TextAnnotation_1q7qdra">]'
      ,q'[        <dc:Bounds x="1070" y="810" width="570" height="150" />]'
      ,q'[        <bpmndi:BPMNLabel />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0kubj9p_di" bpmnElement="Flow_0kubj9p">]'
      ,q'[        <di:waypoint x="408" y="280" />]'
      ,q'[        <di:waypoint x="460" y="280" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0ry9q57_di" bpmnElement="Flow_0ry9q57">]'
      ,q'[        <di:waypoint x="560" y="280" />]'
      ,q'[        <di:waypoint x="615" y="280" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1air6n9_di" bpmnElement="Flow_1air6n9">]'
      ,q'[        <di:waypoint x="665" y="280" />]'
      ,q'[        <di:waypoint x="720" y="280" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_06iqwjh_di" bpmnElement="Flow_06iqwjh">]'
      ,q'[        <di:waypoint x="640" y="305" />]'
      ,q'[        <di:waypoint x="640" y="560" />]'
      ,q'[        <di:waypoint x="720" y="560" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1ututkm_di" bpmnElement="Flow_1ututkm">]'
      ,q'[        <di:waypoint x="820" y="560" />]'
      ,q'[        <di:waypoint x="880" y="560" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1pyqngd_di" bpmnElement="Flow_1pyqngd">]'
      ,q'[        <di:waypoint x="980" y="560" />]'
      ,q'[        <di:waypoint x="1040" y="560" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_08s6jze_di" bpmnElement="Flow_08s6jze">]'
      ,q'[        <di:waypoint x="640" y="305" />]'
      ,q'[        <di:waypoint x="640" y="760" />]'
      ,q'[        <di:waypoint x="720" y="760" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_006uuj2_di" bpmnElement="Flow_006uuj2">]'
      ,q'[        <di:waypoint x="820" y="760" />]'
      ,q'[        <di:waypoint x="875" y="760" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1aa0af4_di" bpmnElement="Flow_1aa0af4">]'
      ,q'[        <di:waypoint x="925" y="760" />]'
      ,q'[        <di:waypoint x="980" y="760" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="949" y="742" width="8" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1tof406_di" bpmnElement="Flow_1tof406">]'
      ,q'[        <di:waypoint x="900" y="785" />]'
      ,q'[        <di:waypoint x="900" y="860" />]'
      ,q'[        <di:waypoint x="982" y="860" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="911" y="820" width="8" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_10doy19_di" bpmnElement="Flow_10doy19">]'
      ,q'[        <di:waypoint x="1080" y="760" />]'
      ,q'[        <di:waypoint x="1140" y="760" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1071r1d_di" bpmnElement="Flow_1071r1d">]'
      ,q'[        <di:waypoint x="820" y="280" />]'
      ,q'[        <di:waypoint x="1450" y="280" />]'
      ,q'[        <di:waypoint x="1450" y="535" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0al8eiu_di" bpmnElement="Flow_0al8eiu">]'
      ,q'[        <di:waypoint x="1140" y="560" />]'
      ,q'[        <di:waypoint x="1425" y="560" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1olo1p2_di" bpmnElement="Flow_1olo1p2">]'
      ,q'[        <di:waypoint x="1240" y="760" />]'
      ,q'[        <di:waypoint x="1300" y="760" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_07xilb7_di" bpmnElement="Flow_07xilb7">]'
      ,q'[        <di:waypoint x="1400" y="760" />]'
      ,q'[        <di:waypoint x="1450" y="760" />]'
      ,q'[        <di:waypoint x="1450" y="585" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1da66k3_di" bpmnElement="Flow_1da66k3">]'
      ,q'[        <di:waypoint x="1475" y="560" />]'
      ,q'[        <di:waypoint x="1500" y="560" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1qhwtp2_di" bpmnElement="Flow_1qhwtp2">]'
      ,q'[        <di:waypoint x="1600" y="560" />]'
      ,q'[        <di:waypoint x="1625" y="560" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0v4ypbt_di" bpmnElement="Flow_0v4ypbt">]'
      ,q'[        <di:waypoint x="1675" y="560" />]'
      ,q'[        <di:waypoint x="1700" y="560" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="1684" y="533" width="8" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0raow5t_di" bpmnElement="Flow_0raow5t">]'
      ,q'[        <di:waypoint x="1800" y="560" />]'
      ,q'[        <di:waypoint x="1832" y="560" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_11edvtt_di" bpmnElement="Flow_11edvtt">]'
      ,q'[        <di:waypoint x="1650" y="535" />]'
      ,q'[        <di:waypoint x="1650" y="280" />]'
      ,q'[        <di:waypoint x="1700" y="280" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="1661" y="483" width="8" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_09hbzak_di" bpmnElement="Flow_09hbzak">]'
      ,q'[        <di:waypoint x="1800" y="280" />]'
      ,q'[        <di:waypoint x="1832" y="280" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Association_024tpq3_di" bpmnElement="Association_024tpq3">]'
      ,q'[        <di:waypoint x="551" y="240" />]'
      ,q'[        <di:waypoint x="578" y="216" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Association_18cs70j_di" bpmnElement="Association_18cs70j">]'
      ,q'[        <di:waypoint x="1018" y="857" />]'
      ,q'[        <di:waypoint x="1070" y="850" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[    </bpmndi:BPMNPlane>]'
      ,q'[  </bpmndi:BPMNDiagram>]'
      ,q'[</bpmn:definitions>]'
      ,q'[]'
  ));
  flow_diagram.upload_and_parse(
    pi_dgrm_name => 'Tutorial 6a - Collaborations, Lanes and Reservations',
    pi_dgrm_version => '23.1',
    pi_dgrm_category => 'Tutorials',
    pi_dgrm_content => l_dgrm_content
);
end;
/
