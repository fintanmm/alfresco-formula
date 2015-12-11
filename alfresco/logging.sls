{% from "alfresco/map.jinja" import alfresco with context %}

{{ alfresco.tomcat_dir }}shared/classes/alfresco/extension/log4j.properties:
  file.managed:
    - source: salt://alfresco/files/log4j.properties
    - force: False
    - makedirs: True
    - user: {{ alfresco.user }}
    - group: {{ alfresco.group }}
    - mode: 644   
