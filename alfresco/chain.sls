{% from "alfresco/map.jinja" import alfresco with context %}

chain-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# CHAIN : salt managed zone"
    - marker_end: "# CHAIN ENDS : salt managed zone --"
    - content: |
        authentication.chain={{ salt['pillar.get']('alfresco:auth:chain') }}
