{% from "alfresco/map.jinja" import alfresco with context %}

mail-block-replace:
  file.blockreplace:
  - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
  - marker_start: "# MAIL : salt managed zone"
  - marker_end: "# MAIL ENDS : salt managed zone --"
  - content: |
      mail.host={{ salt['pillar.get']('alfresco:mail:host', '0.0.0.0') }}
      mail.port={{ salt['pillar.get']('alfresco:mail:port', '25') }}
      mail.username={{ salt['pillar.get']('alfresco:mail:username', 'anonymous') }}
      mail.password={{ salt['pillar.get']('alfresco:mail:password', '') }}
      mail.protocol={{ salt['pillar.get']('alfresco:mail:protocol', 'smtp') }}
      mail.encoding={{ salt['pillar.get']('alfresco:mail:encoding', 'UTF-8') }}
      notification.email.siteinvite={{ salt['pillar.get']('alfresco:mail:siteinvite', 'False') }}
             