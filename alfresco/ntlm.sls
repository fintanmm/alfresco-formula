{% from "alfresco/map.jinja" import alfresco with context %}

ntlm-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# NTLM : salt managed zone"
    - marker_end: "# NTLM ENDS : salt managed zone --"
    - content: |
        ntlm.authentication.sso.enabled: {{ salt['pillar.get']('alfresco:auth:ntlm:sso', 'False') }}
        ntlm.authentication.mapUnknownUserToGuest: {{ salt['pillar.get']('alfresco:auth:ntlm:mapUnknownUserToGuest', 'False') }}