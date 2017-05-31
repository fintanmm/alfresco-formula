{% from "alfresco/map.jinja" import alfresco with context %}

opencmis-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# OPENCMIS : salt managed zone"
    - marker_end: "# OPENCMIS ENDS : salt managed zone --"
    - content: |
        opencmis.context.override={{ salt['pillar.get']('alfresco:opencmis:context:override', 'true') }}
        opencmis.servletpath.override={{ salt['pillar.get']('alfresco:opencmis:servletpath:override', 'true') }}
        opencmis.server.override={{ salt['pillar.get']('alfresco:opencmis:server:override', 'true') }}
        opencmis.server.value={{ salt['pillar.get']('alfresco:opencmis:server:value', '') }}