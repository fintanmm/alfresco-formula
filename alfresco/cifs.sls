{% from "alfresco/map.jinja" import alfresco with context %}

{% set ntlm = salt['pillar.get']('alfresco:auth:ntlm:enabled')|title %}
{% set passthru = salt['pillar.get']('alfresco:auth:passthru:enabled')|title %}
{% set kerberos = salt['pillar.get']('alfresco:auth:kerberos:enabled')|title %}

{% if ntlm == 'True' or passthru == 'True' or kerberos == 'True' %}
cifs-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# CIFS : salt managed zone"
    - marker_end: "# CIFS ENDS : salt managed zone --"
    - content: |
        cifs.enabled={{ salt['pillar.get']('alfresco:cifs:enabled', 'False') }}
        cifs.serverName={{ salt['pillar.get']('alfresco:cifs:serverName', '${localname}A') }}
        cifs.domain={{ salt['pillar.get']('alfresco:cifs:domain') }}
        cifs.hostannounce={{ salt['pillar.get']('alfresco:cifs:hostannounce', 'True') }}
        cifs.ipv6={{ salt['pillar.get']('alfresco:cifs:ipv6') }}
        cifs.tcpipSMB={{ salt['pillar.get']('alfresco:cifs:tcpipSMB', 445) }}
        cifs.netBIOSSMB.namePort={{ salt['pillar.get']('alfresco:cifs:netBIOSSMB:namePort', 137) }}
        cifs.netBIOSSMB.datagramPort={{ salt['pillar.get']('alfresco:cifs:netBIOSSMB:datagramPort', 138) }}
        cifs.netBIOSSMB.sessionPort={{ salt['pillar.get']('alfresco:cifs:netBIOSSMB:sessionPort', 139) }}
        cifs.WINS.autoDetectEnabled={{ salt['pillar.get']('alfresco:cifs:WINS:autoDetectEnabled', 'True') }}
{% endif %}        
