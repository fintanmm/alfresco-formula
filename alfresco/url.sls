{% from "alfresco/map.jinja" import alfresco with context %}

alfresco-url-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# ALFRESCO URL : salt managed zone"
    - marker_end: "# ALFRESCO URL ENDS : salt managed zone --"
    - content: |
        alfresco.context={{ salt['pillar.get']('alfresco:url:alfresco:context', 'alfresco') }}
        alfresco.host=a{{ salt['pillar.get']('alfresco:url:alfresco:host', salt['grains.get']('host')) }}
        alfresco.port={{ salt['pillar.get']('alfresco:url:alfresco:port', '8080') }}
        alfresco.protocol={{ salt['pillar.get']('alfresco:url:alfresco:protocol', 'http') }}

share-url-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# SHARE URL : salt managed zone"
    - marker_end: "# SHARE URL ENDS : salt managed zone --"
    - content: |
        share.context={{ salt['pillar.get']('alfresco:url:share:context', 'share') }}
        share.host=a{{ salt['pillar.get']('alfresco:url:share:host', salt['grains.get']('host')) }}
        share.port={{ salt['pillar.get']('alfresco:url:share:port', '8080') }}
        share.protocol={{ salt['pillar.get']('alfresco:url:share:protocol', 'http') }}