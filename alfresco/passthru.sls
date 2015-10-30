{% from "alfresco/map.jinja" import alfresco with context %}

passthru-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# PASSTHRU : salt managed zone"
    - marker_end: "# PASSTHRU ENDS : salt managed zone --"
    - content: |
        passthru.authentication.useLocalServer: {{ salt['pillar.get']('alfresco:auth:passthru:useLocalServer', 'False') }}
        passthru.authentication.domain: {{ salt['pillar.get']('alfresco:auth:passthru:domain', 'company.ad') }}
        passthru.authentication.servers: {{ salt['pillar.get']('alfresco:auth:passthru:servers', 'company.ad\\19.168.1.2,19.168.1.3') }}
        passthru.authentication.guestAccess: {{ salt['pillar.get']('alfresco:auth:passthru:guestAccess', 'False') }}
        passthru.authentication.defaultAdministratorUserNames: {{ salt['pillar.get']('alfresco:auth:passthru:defaultAdministratorUserNames', '') }}
        passthru.authentication.connectTimeout: {{ salt['pillar.get']('alfresco:auth:passthru:connectTimeout', '5000') }}
        passthru.authentication.offlineCheckInterval: {{ salt['pillar.get']('alfresco:auth:passthru:offlineCheckInterval', '300') }}
        passthru.authentication.protocolOrder: {{ salt['pillar.get']('alfresco:auth:passthru:protocolOrder', 'NetBIOS,TCPIP') }}
        passthru.authentication.authenticateCIFS: {{ salt['pillar.get']('alfresco:auth:passthru:authenticateCIFS', 'False') }}
        passthru.authentication.authenticateFTP: {{ salt['pillar.get']('alfresco:auth:passthru:authenticateFTP', 'False') }}